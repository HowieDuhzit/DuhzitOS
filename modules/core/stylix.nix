{
  pkgs,
  host,
  ...
}: let
  inherit (import ../../hosts/${host}/variables.nix) stylixImage;
in {
  # Styling Options
  stylix = {
    enable = true;
    image = stylixImage;
    
    # DuhzitOS Theme Colors
    base16Scheme = {
      # Base colors from the DuhzitOS color scheme
      base00 = "070707"; # Black
      base01 = "550C18"; # Dark Burgundy
      base02 = "550C18"; # Dark Burgundy (alt)
      base03 = "550C18"; # Dark Burgundy (bright)
      base04 = "FDCA40"; # Yellow
      base05 = "66C3FF"; # Light Blue
      base06 = "F64740"; # Red
      base07 = "FFFFFF"; # White
      base08 = "FDCA40"; # Yellow (accent)
      base09 = "66C3FF"; # Light Blue (accent)
      base0A = "F64740"; # Red (accent)
      base0B = "FDCA40"; # Yellow (bright)
      base0C = "66C3FF"; # Light Blue (bright)
      base0D = "F64740"; # Red (bright)
      base0E = "550C18"; # Dark Burgundy (accent)
      base0F = "070707"; # Black (alt)
    };

    polarity = "dark";
    opacity.terminal = 0.95;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
  };
}
