{
  pkgs,
  lib,
  config,
  username,
  ...
}: let
  cfg = config.duhzitos.displayManager;
  
  # DuhzitOS Colors
  colors = {
    black = "#070707";
    darkBurgundy = "#550C18";
    yellow = "#FDCA40";
    lightBlue = "#66C3FF";
    red = "#F64740";
    white = "#FFFFFF";
  };

  # Create a derivation for our themed SDDM config
  sddmTheme = pkgs.stdenv.mkDerivation {
    name = "sddm-theme-duhzitos";
    version = "1.0.0";
    
    src = pkgs.sddm-sugar-dark;
    
    buildInputs = with pkgs; [ 
      imagemagick
      gdk-pixbuf
      librsvg
    ];
    
    nativeBuildInputs = with pkgs; [
      wrapGAppsHook
    ];

    installPhase = ''
      # Setup GDK_PIXBUF_MODULE_FILE for image loading
      export GDK_PIXBUF_MODULE_FILE=$(echo ${pkgs.gdk-pixbuf.out}/lib/gdk-pixbuf-2.0/*/loaders.cache)
      
      cp -r $src $out
      cp ${./../../img/Logo.png} $out/assets/logo.png
      
      # Create a blurred version of the logo for the background
      convert ${./../../img/Logo.png} \
        -blur 0x8 \
        -modulate 50 \
        $out/assets/background.png
        
      # Ensure correct permissions
      chmod -R +r $out
    '';
  };

in {
  options.duhzitos.displayManager = {
    type = lib.mkOption {
      type = lib.types.enum [ "tuigreet" "sddm" ];
      default = "tuigreet";
      description = "The display manager to use. Can be either 'tuigreet' or 'sddm'.";
    };
  };

  config = lib.mkMerge [
    # Common configuration
    {
      services.xserver.enable = lib.mkForce cfg.type == "sddm";
      services.xserver.displayManager.defaultSession = "hyprland";
    }

    # TUIGreet configuration
    (lib.mkIf (cfg.type == "tuigreet") {
      services.greetd = {
        enable = true;
        vt = 3;
        settings = {
          default_session = {
            user = username;
            command = ''
              ${pkgs.greetd.tuigreet}/bin/tuigreet \
                --time \
                --asterisks \
                --user-menu \
                --remember \
                --remember-session \
                --cmd Hyprland \
                --width 40 \
                --greeting "Welcome to DuhzitOS" \
                --text-color "${colors.white}" \
                --text-highlight-color "${colors.yellow}" \
                --prompt-color "${colors.lightBlue}" \
                --prompt-highlight-color "${colors.red}" \
                --border-color "${colors.darkBurgundy}" \
                --window-padding 2
            '';
          };
        };
      };

      # Create ASCII art version of logo for TUI
      environment.etc."greetd/logo.txt".text = ''
        [38;2;253;202;64m▄[38;2;102;195;255m▄[38;2;246;71;64m▄[39m
        [38;2;253;202;64m█[38;2;102;195;255m█[38;2;246;71;64m█[39m DuhzitOS
      '';
    })

    # SDDM configuration
    (lib.mkIf (cfg.type == "sddm") {
      services.xserver.displayManager.sddm = {
        enable = true;
        theme = "duhzitos";
        settings = {
          Theme = {
            CursorTheme = config.stylix.cursor.name;
            CursorSize = toString config.stylix.cursor.size;
            Font = "${config.stylix.fonts.sansSerif.name} ${toString config.stylix.fonts.sizes.desktop}";
          };
          General = {
            InputMethod = "";
            Numlock = "on";
          };
        };
      };

      # Install SDDM theme and dependencies
      environment.systemPackages = with pkgs; [
        libsForQt5.qt5.qtquickcontrols2
        libsForQt5.qt5.qtgraphicaleffects
        sddmTheme
      ];

      # Create SDDM theme directory and symlink
      system.activationScripts.sddm-setup = ''
        mkdir -p /usr/share/sddm/themes/
        ln -sf ${sddmTheme} /usr/share/sddm/themes/duhzitos
      '';

      # Custom SDDM theme colors using DuhzitOS palette
      environment.etc."sddm/theme.conf".text = ''
        [General]
        background=${sddmTheme}/assets/background.png
        type=image
        color=${colors.black}
        fontSize=${toString config.stylix.fonts.sizes.desktop}
        blur=false

        [Theme]
        AccentColor=${colors.yellow}
        BackgroundColor=${colors.black}
        PrimaryColor=${colors.lightBlue}
        TextColor=${colors.white}
        HighlightColor=${colors.red}
        BorderColor=${colors.darkBurgundy}
        LogoPath=${sddmTheme}/assets/logo.png
        
        [Interface]
        ForceHideCompletePassword=true
        PasswordFieldOutlined=true
        ButtonStyle=outlined
        
        [Translations]
        HeaderText=Welcome to DuhzitOS
        
        [Wayland]
        EnableHiDPI=true
      '';

      # Ensure SDDM uses our Wayland session
      environment.etc."sddm/wayland-session".source = pkgs.writeText "wayland-session" ''
        #!/bin/sh
        export XDG_SESSION_TYPE=wayland
        export QT_QPA_PLATFORM=wayland
        export GDK_BACKEND=wayland
        exec Hyprland
      '';
    })
  ];
} 