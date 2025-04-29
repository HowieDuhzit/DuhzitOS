# DuhzitOS FAQ

## General Questions

### What is DuhzitOS?
DuhzitOS is a modern NixOS configuration that provides a complete desktop environment based on Hyprland. It's designed to be customizable, performant, and aesthetically pleasing.

### Is DuhzitOS a Linux distribution?
No, DuhzitOS is not a Linux distribution. It's a configuration for NixOS that provides a complete desktop environment and system setup. You need to install NixOS first, then apply the DuhzitOS configuration.

### What are the system requirements?
- NixOS 23.11 or later
- UEFI boot with GPT partitioning
- 500MB minimum /boot partition
- Systemd-boot (recommended)
- At least 4GB RAM (8GB recommended)
- Modern CPU (Intel/AMD)

## Installation

### How do I install DuhzitOS?
1. Install NixOS with the required specifications
2. Run the installation script:
```bash
nix-shell -p git curl
sh <(curl -L https://github.com/yourusername/duhzitos/raw/main/install-duhzitos.sh)
```

### Can I install DuhzitOS on an existing NixOS system?
Yes, you can install DuhzitOS on an existing NixOS system. The installation script will guide you through the process.

## Configuration

### How do I customize DuhzitOS?
DuhzitOS is highly customizable. You can modify:
- System configuration in `modules/`
- Host-specific settings in `hosts/`
- Hardware profiles in `profiles/`
- User configuration in `home-manager/`

### How do I update my configuration?
Use the `fr` (Flake Rebuild) command to apply configuration changes:
```bash
fr
```

## Hardware Support

### What hardware is supported?
DuhzitOS supports:
- AMD GPUs
- NVIDIA GPUs (including laptops)
- Intel integrated graphics
- Virtual machines

### How do I configure my specific hardware?
Choose the appropriate profile during installation:
- `amd` for AMD graphics
- `nvidia` for NVIDIA desktop
- `nvidia-laptop` for NVIDIA laptops
- `intel` for Intel graphics
- `vm` for virtual machines

## Troubleshooting

### Where can I get help?
- Check the [documentation](docs/)
- Join our [Discord server](https://discord.gg/your-invite-link)
- Open an issue on [GitHub](https://github.com/yourusername/duhzitos/issues)

### How do I report bugs?
Please open an issue on GitHub with:
- A clear description of the problem
- Steps to reproduce
- Relevant system information
- Logs if available

## Development

### How can I contribute?
We welcome contributions! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

### Where can I find the source code?
The source code is available on [GitHub](https://github.com/yourusername/duhzitos). 