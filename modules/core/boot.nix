{
  pkgs,
  config,
  lib,
  ...
}: let
  duhzitosTheme = pkgs.plymouth-theme-duhzitos or (pkgs.stdenv.mkDerivation {
    name = "plymouth-theme-duhzitos";
    version = "1.0.0";
    
    src = pkgs.writeTextDir "share/plymouth/themes/duhzitos/duhzitos.plymouth" ''
      [Plymouth Theme]
      Name=DuhzitOS
      Description=DuhzitOS boot splash theme
      ModuleName=two-step

      [two-step]
      Font=Montserrat Regular 12
      TitleFont=Montserrat Regular 30
      ImageDir=/share/plymouth/themes/duhzitos
      DialogHorizontalAlignment=.5
      DialogVerticalAlignment=.7
      TitleHorizontalAlignment=.5
      TitleVerticalAlignment=.382
      HorizontalAlignment=.5
      VerticalAlignment=.7
      WatermarkHorizontalAlignment=.5
      WatermarkVerticalAlignment=.5
      Transition=none
      TransitionDuration=0.0
      BackgroundStartColor=0x070707
      BackgroundEndColor=0x070707
      ProgressBarBackgroundColor=0x550C18
      ProgressBarForegroundColor=0xFDCA40
      DialogClearsFirmwareBackground=true
      MessageBelowAnimation=true

      [boot-up]
      UseEndAnimation=false
      UseFirmwareBackground=false

      [shutdown]
      UseEndAnimation=false
      UseFirmwareBackground=false

      [reboot]
      UseEndAnimation=false
      UseFirmwareBackground=false

      [updates]
      SuppressMessages=true
      ProgressBarShowPercentComplete=true
      UseProgressBar=true
      _Title=Installing Updates...
      _SubTitle=Do not turn off your computer

      [system-upgrade]
      SuppressMessages=true
      ProgressBarShowPercentComplete=true
      UseProgressBar=true
      _Title=Upgrading System...
      _SubTitle=Do not turn off your computer

      [firmware-upgrade]
      SuppressMessages=true
      ProgressBarShowPercentComplete=true
      UseProgressBar=true
      _Title=Upgrading Firmware...
      _SubTitle=Do not turn off your computer
    '';

    buildInputs = [ pkgs.plymouth ];

    installPhase = ''
      mkdir -p $out/share/plymouth/themes/duhzitos
      cp -r $src/share/plymouth/themes/duhzitos/* $out/share/plymouth/themes/duhzitos/
      cp ${./../../img/Logo.png} $out/share/plymouth/themes/duhzitos/logo.png
      cp ${./../../img/Logo.png} $out/share/plymouth/themes/duhzitos/watermark.png
    '';
  });
in {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    kernel.sysctl = { "vm.max_map_count" = 2147483642; };
    loader = {
      systemd-boot = {
        enable = lib.mkIf (!config.vm.guest-services.enable) true;
        # Add logo to systemd-boot menu
        configurationLimit = 10;
        consoleMode = "max";
      };
      efi = lib.mkIf (!config.vm.guest-services.enable) {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      # Fallback to GRUB for VM environments
      grub = lib.mkIf (config.vm.guest-services.enable) {
        enable = true;
        device = "nodev";
        efiSupport = false;
        useOSProber = true;
      };
    };
    # Appimage Support
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
    plymouth = {
      enable = lib.mkIf (!config.vm.guest-services.enable) true;
      theme = "duhzitos";
      themePackages = [ duhzitosTheme ];
    };
  };
}
