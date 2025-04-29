{pkgs, ...}: {
  programs.ghostty = {
    enable = false;
    package = pkgs.ghostty;
    settings = {
      # DuhzitOS Theme
      theme = "DuhzitOS";
      window-theme = "dark";
      
      # DuhzitOS Colors
      background = "070707";  # Black
      foreground = "FFFFFF";  # White
      
      # Normal Colors
      palette = [
        "070707"  # Black
        "F64740"  # Red
        "FDCA40"  # Yellow
        "FDCA40"  # Yellow (bright)
        "66C3FF"  # Light Blue
        "550C18"  # Dark Burgundy
        "66C3FF"  # Light Blue (bright)
        "FFFFFF"  # White
        
        # Bright Colors
        "070707"  # Black (bright)
        "F64740"  # Red (bright)
        "FDCA40"  # Yellow (bright)
        "FDCA40"  # Yellow (brightest)
        "66C3FF"  # Light Blue (bright)
        "550C18"  # Dark Burgundy (bright)
        "66C3FF"  # Light Blue (brightest)
        "FFFFFF"  # White (bright)
      ];
      
      # UI Elements
      selection-background = "550C18";  # Dark Burgundy
      selection-foreground = "FFFFFF";  # White
      cursor-color = "FDCA40";         # Yellow
      cursor-text = "070707";          # Black
      
      # Window Settings
      background-opacity = 0.95;
      window-padding-x = 15;
      window-padding-y = 15;
      macos-option-as-alt = true;
      
      # Font Settings
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
      
      # Other Settings
      confirm-close-surface = false;
      mouse-hide-while-typing = true;
    };
  };
}
