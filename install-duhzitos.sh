#!/usr/bin/env bash

# DuhzitOS Installation Script
# This script will help you install DuhzitOS on your system.

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_section() {
    echo "-----"
    print_info "$1"
    echo "-----"
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    print_error "Please do not run this script as root"
    exit 1
fi

# Check if this is NixOS
if [ -n "$(grep -i nixos < /etc/os-release)" ]; then
    print_success "Verified this is NixOS."
else
    print_error "This is not NixOS or the distribution information is not available."
    exit 1
fi

# Check for git
if command -v git &> /dev/null; then
    print_success "Git is installed, continuing with installation."
else
    print_error "Git is not installed. Please install Git and try again."
    echo "Example: nix-shell -p git"
    exit 1
fi

print_section "Welcome to DuhzitOS Installation"
echo "Default options are in brackets []"
echo "Just press enter to select the default"
sleep 2

# Ensure we're in the home directory
print_section "Ensuring we're in the home directory"
cd || exit

# User Profile Selection
print_section "User Profile Selection"
read -rp "Choose your user profile:
Options:
[ power ] - For developers, content creators, and power users
basic     - For regular desktop usage
Please type your choice: " userProfile

if [ -z "$userProfile" ]; then
    userProfile="power"
fi

# Hostname
print_section "System Configuration"
read -rp "Enter Your New Hostname: [ default ] " hostName
if [ -z "$hostName" ]; then
    hostName="default"
fi

# Hardware Profile
read -rp "Enter Your Hardware Profile (GPU)
Options:
[ amd ]
nvidia
nvidia-laptop
intel
vm
Please type out your choice: " profile
if [ -z "$profile" ]; then
    profile="amd"
fi

# Backup existing installation
backupname=$(date "+%Y-%m-%d-%H-%M-%S")
if [ -d "duhzitos" ]; then
    print_info "DuhzitOS exists, backing up to .config/duhzitos-backups folder."
    if [ -d ".config/duhzitos-backups" ]; then
        print_info "Moving current version of DuhzitOS to backups folder."
        mv "$HOME"/duhzitos .config/duhzitos-backups/"$backupname"
    else
        print_info "Creating the backups folder & moving DuhzitOS to it."
        mkdir -p .config/duhzitos-backups
        mv "$HOME"/duhzitos .config/duhzitos-backups/"$backupname"
    fi
else
    print_success "Thank you for choosing DuhzitOS!"
    echo "I hope you find your time here enjoyable!"
fi

print_section "Cloning & Setting Up DuhzitOS Repository"
git clone -b DuhzitOS https://github.com/HowieDuhzit/DuhzitOS.git duhzitos
cd duhzitos || exit
mkdir -p hosts/"$hostName"
cp hosts/default/*.nix hosts/"$hostName"

# Configure git temporarily
installusername=$(echo "$USER")
git config --global user.name "$installusername"
git config --global user.email "$installusername@gmail.com"
git add .
git config --global --unset-all user.name
git config --global --unset-all user.email

# Update configuration files
sed -i "/^\s*host[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$hostName\"/" ./flake.nix
sed -i "/^\s*profile[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$profile\"/" ./flake.nix

# Keyboard configuration
print_section "Keyboard Configuration"
read -rp "Enter your keyboard layout: [ us ] " keyboardLayout
if [ -z "$keyboardLayout" ]; then
    keyboardLayout="us"
fi
sed -i "/^\s*keyboardLayout[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$keyboardLayout\"/" ./hosts/$hostName/variables.nix

read -rp "Enter your console keymap: [ us ] " consoleKeyMap
if [ -z "$consoleKeyMap" ]; then
    consoleKeyMap="us"
fi
sed -i "/^\s*consoleKeyMap[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$consoleKeyMap\"/" ./hosts/$hostName/variables.nix

# Update username in configuration
sed -i "/^\s*username[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$installusername\"/" ./flake.nix

# Apply profile-specific configurations
if [ "$userProfile" = "power" ]; then
    print_info "Applying power user configuration..."
    # Enable development tools and advanced features
    echo "{ config, ... }: {
      # Power user specific configurations
      programs.development.enable = true;
      programs.virtualization.enable = true;
      programs.containerization.enable = true;
    }" > ./hosts/"$hostName"/user-profile.nix
else
    print_info "Applying basic user configuration..."
    # Enable basic desktop features
    echo "{ config, ... }: {
      # Basic user specific configurations
      programs.basic-desktop.enable = true;
    }" > ./hosts/"$hostName"/user-profile.nix
fi

print_section "Generating Hardware Configuration"
sudo nixos-generate-config --show-hardware-config > ./hosts/$hostName/hardware.nix

print_section "Setting Required Nix Settings"
export NIX_CONFIG="experimental-features = nix-command flakes"

print_section "Starting System Installation"
print_info "This may take a while. Please be patient..."
sudo nixos-rebuild switch --flake ~/duhzitos/#${profile}

print_success "Installation completed!"
echo "Please reboot your system to start using DuhzitOS."
