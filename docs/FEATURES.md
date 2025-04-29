# DuhzitOS Features and Packages

DuhzitOS is a custom NixOS-based distribution focused on simplicity, speed, compatibility, and customization, particularly tailored for creative users such as developers and 3D modelers.

## Core Features

### Window Manager and Desktop Environment
- [Hyprland](https://wiki.hyprland.org/) as the default window manager
- Custom DuhzitOS theme with a carefully crafted color scheme
- Display Manager Options:
  - Default: [TUI-based login manager](https://github.com/apognu/tuigreet) (tuigreet)
    - Lightweight and fast
    - Terminal-based interface
    - Custom themed with DuhzitOS colors
  - Alternative: [SDDM](https://github.com/sddm/sddm)
    - Graphical login interface
    - [Sugar Dark theme](https://github.com/MarianArlt/sddm-sugar-dark)
    - Custom themed with DuhzitOS colors
    - Touch screen support
- Wayland-based desktop environment

### System Features
- [Zen kernel](https://github.com/zen-kernel/zen-kernel) (linux_zen) for improved desktop performance
- [Flatpak](https://docs.flatpak.org/en/latest/) support with automatic Flathub repository setup
- [Docker](https://docs.docker.com/) support enabled by default
- Advanced package management with [Nix flakes](https://nixos.wiki/wiki/Flakes)
- Automatic SSD optimization ([fstrim](https://man7.org/linux/man-pages/man8/fstrim.8.html))
- [Plymouth](https://www.freedesktop.org/wiki/Software/Plymouth/) boot splash enabled
- [Appimage](https://appimage.org/) support built-in
- Automatic system cleanup (keeps last 5 generations, up to 7 days)

### Audio and Video
- [PipeWire](https://pipewire.org/) audio server with ALSA and PulseAudio compatibility
- Video loopback support ([v4l2loopback](https://github.com/umlaeute/v4l2loopback))
- Advanced media controls with [playerctl](https://github.com/altdesktop/playerctl)

### Hardware Support
- [Bluetooth](https://wiki.archlinux.org/title/Bluetooth) support enabled by default
- Scanner support ([SANE](http://www.sane-project.org/))
- [QMK](https://docs.qmk.fm/) keyboard firmware support
- [CUPS](https://www.cups.org/) printer support (optional)
- Smart device monitoring ([smartd](https://www.smartmontools.org/)) for non-VM installations
- [Logitech](https://github.com/libratbag/libratbag) wireless device support (disabled by default)

### Security and System Services
- [Polkit](https://www.freedesktop.org/software/polkit/docs/latest/polkit.8.html) for privilege escalation
- [GNOME Keyring](https://wiki.gnome.org/Projects/GnomeKeyring) for secure credential storage
- [OpenSSH](https://www.openssh.com/) server enabled
- [RTKit](https://github.com/heftig/rtkit) for real-time process priority
- [Syncthing](https://docs.syncthing.net/) file synchronization (disabled by default)
- Firewall enabled with common ports (22, 80, 443, 59010, 59011, 8080)

### Gaming Support
- [Steam](https://store.steampowered.com/linux) with [Proton-GE](https://github.com/GloriousEggroll/proton-ge-custom) compatibility layer
- [Gamescope](https://github.com/Plagman/gamescope) session support
- Remote Play functionality
- Advanced gaming features like RT and Wayland exposure

## Default Applications

### System Utilities
- **File Management**
  - [Thunar](https://docs.xfce.org/xfce/thunar/start) (optional) with archive and volume management plugins
  - [yazi](https://yazi-rs.github.io/) (TUI File Manager)
  - [file-roller](https://wiki.gnome.org/Apps/FileRoller) (Archive Manager)

- **System Monitoring**
  - [htop](https://htop.dev/) (System Monitor)
  - [inxi](https://github.com/smxi/inxi) (System Information)
  - [lm_sensors](https://github.com/lm-sensors/lm-sensors) (Hardware Temperature Monitoring)
  - [lshw](https://github.com/lyonel/lshw) (Hardware Information)
  - [pciutils](https://mj.ucw.cz/sw/pciutils/) (PCI Device Tools)
  - [usbutils](https://github.com/gregkh/usbutils) (USB Device Tools)

- **Network Tools**
  - [NetworkManager](https://networkmanager.dev/) with applet
  - [wget](https://www.gnu.org/software/wget/) (File Download)
  - [mtr](https://github.com/traviscross/mtr) (Network Diagnostics)

### Development Tools
- **Version Control**
  - [git](https://git-scm.com/doc) (configured with user settings)
  - [nixfmt-rfc-style](https://github.com/nix-community/nixfmt) (Nix Formatter)

- **Android Development**
  - [adb](https://developer.android.com/tools/adb) (Android Debug Bridge)

- **Container Tools**
  - [docker-compose](https://docs.docker.com/compose/)
  - [docker](https://docs.docker.com/)

### Media Applications
- **Audio**
  - [pavucontrol](https://freedesktop.org/software/pulseaudio/pavucontrol/) (Audio Control)
  - [rhythmbox](https://wiki.gnome.org/Apps/Rhythmbox) (Music Player)
  - [picard](https://picard.musicbrainz.org/) (Music Metadata Editor)
  - [ytmdl](https://github.com/deepjyoti30/ytmdl) (YouTube Music Downloader)

- **Video**
  - [mpv](https://mpv.io/) (Video Player)
  - [ffmpeg](https://ffmpeg.org/documentation.html) (Media Processing)

- **Graphics**
  - [GIMP](https://www.gimp.org/docs/) (Image Editor)
  - [eog](https://wiki.gnome.org/Apps/EyeOfGnome) (Image Viewer)
  - [hyprpicker](https://github.com/hyprwm/hyprpicker) (Color Picker)

### Internet and Browsers
- [Brave Browser](https://brave.com/linux/)
- [amfora](https://github.com/makeworld-the-better-one/amfora) (Terminal Gemini Browser)

### Terminal Utilities
- **Shell and Terminal**
  - [zsh](https://zsh.sourceforge.io/Doc/) (Default Shell)
  - [Starship](https://starship.rs/) prompt
  - [JetBrains Mono Nerd Font](https://www.jetbrains.com/lp/mono/) (Default Terminal Font)

- **Command Line Tools**
  - [eza](https://eza.rocks/) (Modern ls replacement)
  - [ripgrep](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md) (Advanced text search)
  - [ncdu](https://dev.yorhel.nl/ncdu) (Disk Usage Analyzer)
  - [duf](https://github.com/muesli/duf) (Disk Usage Viewer)
  - [cliphist](https://github.com/sentriz/cliphist) (Clipboard Manager)
  - [killall](https://gitlab.com/psmisc/psmisc) (Process Management)
  - [socat](http://www.dest-unreach.org/socat/doc/socat.html) (Data Transfer)
  - [onefetch](https://github.com/o2sh/onefetch) (System Information)

- **Fun Terminal Tools**
  - [cmatrix](https://github.com/abishekvashok/cmatrix)
  - [cowsay](https://github.com/tnalpgge/rank-amateur-cowsay)
  - [lolcat](https://github.com/busyloop/lolcat)

### Compression Tools
- [unrar](https://www.rarlab.com/rar_add.htm)
- [unzip](https://infozip.sourceforge.net/UnZip.html)

## Default Fonts
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/) (Terminal)
- [Montserrat](https://fonts.google.com/specimen/Montserrat) (System)
- [Noto Fonts](https://fonts.google.com/noto) (Emoji and CJK)
- [Font Awesome](https://fontawesome.com/docs)
- [Material Icons](https://fonts.google.com/icons)
- [Fira Code](https://github.com/tonsky/FiraCode)
- [Symbola](https://fontlibrary.org/en/font/symbola)

## Theme and Styling
- Custom DuhzitOS color scheme
  - Base Colors:
    - Black (`#070707`)
    - Dark Burgundy (`#550C18`)
    - Yellow (`#FDCA40`)
    - Light Blue (`#66C3FF`)
    - Red (`#F64740`)
    - White (`#FFFFFF`)
  - Color Usage:
    - Primary Background: Black
    - Accent Colors: Dark Burgundy, Yellow, Light Blue, Red
    - Text: White, Light Blue
    - Highlights: Yellow, Red
- [Bibata-Modern-Ice](https://github.com/ful1e5/Bibata_Cursor) cursor theme (24px)
- Dark theme by default
- 95% terminal opacity
- Standardized font sizes:
  - Applications: 12px
  - Terminal: 15px
  - Desktop: 11px
  - Popups: 12px

## User Configuration
Default user is added to the following groups:
- adbusers
- docker
- libvirtd
- lp
- networkmanager
- scanner
- wheel

## Version Information
- Based on [NixOS 23.11](https://nixos.org/manual/nixos/stable/)
- Current DuhzitOS Version: 2.3 

## Configuration Options

### Display Manager Selection
You can choose between two display managers:
```nix
# In your configuration.nix or home.nix
duhzitos.displayManager.type = "tuigreet"; # Default
# OR
duhzitos.displayManager.type = "sddm";     # Graphical alternative
``` 