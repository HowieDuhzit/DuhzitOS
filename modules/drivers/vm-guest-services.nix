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
    
    # Make sure display sessions are properly registered
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
    
    # Add proper support for Hyprland in VM
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    
    # Ensure the Hyprland session is properly registered
    environment.etc."xdg/wayland-sessions/hyprland.desktop".text = ''
      [Desktop Entry]
      Name=Hyprland
      Comment=A dynamic tiling Wayland compositor
      Exec=Hyprland
      Type=Application
    '';
  };
}
