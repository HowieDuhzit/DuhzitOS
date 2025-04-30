{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.vm.guest-services;
in
{
  options.vm.guest-services = {
    enable = mkEnableOption "Enable Virtual Machine Guest Services";
  };

  config = mkIf cfg.enable {
    # Basic VM guest services
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
    services.spice-webdavd.enable = true;
    
    # Enable required services for graphics in VM
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    
    # Add packages specific to VM environments
    environment.systemPackages = with pkgs; [
      xorg.xf86videoqxl
      spice-gtk
      spice
      virglrenderer
    ];
    
    # Set environment variables for better VM compatibility
    environment.sessionVariables = {
      LIBGL_ALWAYS_SOFTWARE = "1";
      WLR_RENDERER = "pixman";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };
}
