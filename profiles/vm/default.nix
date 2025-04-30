{host, lib, ...}: {
  imports = [
    ../../hosts/${host}
    ../../modules/drivers
    ../../modules/core
  ];
  # Enable GPU Drivers
  drivers.amdgpu.enable = false;
  drivers.nvidia.enable = false;
  drivers.nvidia-prime.enable = false;
  drivers.intel.enable = false;
  vm.guest-services.enable = true;
  
  # Use SDDM for VM environments
  duhzitos.displayManager.type = "sddm";
  
  # Configure X11 for better VM support
  services.xserver = {
    enable = lib.mkForce true;
    videoDrivers = ["modesetting"];
    libinput.enable = true;
    displayManager.defaultSession = "hyprland";
    desktopManager.xterm.enable = false;
  };
  
  # Configure proper VM networking
  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };
}
