# DuhzitOS Theme Definition
{
  name = "DuhzitOS";
  version = "0.0.1";
  description = "Official DuhzitOS color scheme";
  
  colors = {
    # Primary Colors
    yellow = {
      hex = "FDCA40";
      rgb = "253,202,64";
    };
    lightBlue = {
      hex = "66C3FF";
      rgb = "102,195,255";
    };
    red = {
      hex = "F64740";
      rgb = "246,71,64";
    };
    black = {
      hex = "070707";
      rgb = "7,7,7";
    };
    burgundy = {
      hex = "550C18";
      rgb = "85,12,24";
    };
    white = {
      hex = "FFFFFF";
      rgb = "255,255,255";
    };
  };

  # Theme Mapping
  ui = {
    background = "black";
    foreground = "white";
    accent = "yellow";
    primary = "lightBlue";
    secondary = "red";
    tertiary = "burgundy";
  };

  # Terminal Colors
  terminal = {
    black = "black";
    red = "red";
    green = "yellow";  # Using yellow for green to maintain scheme
    yellow = "yellow";
    blue = "lightBlue";
    magenta = "burgundy";
    cyan = "lightBlue";  # Using lightBlue for cyan to maintain scheme
    white = "white";
    
    # Bright variants
    brightBlack = "black";
    brightRed = "red";
    brightGreen = "yellow";
    brightYellow = "yellow";
    brightBlue = "lightBlue";
    brightMagenta = "burgundy";
    brightCyan = "lightBlue";
    brightWhite = "white";
  };
} 