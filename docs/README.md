# DuhzitOS

<div align="center">

## 🚀 DuhzitOS v0.0.1 - Your Next-Gen NixOS Configuration

A modern, customizable NixOS configuration built for performance and aesthetics.

<img align="center" width="80%" src="docs/screenshots/desktop.png" />

</div>

## 🌟 Features

- **Hyprland Window Manager**: Modern, dynamic tiling window manager
- **Stylix Theming**: Beautiful, consistent theming across all applications
- **Modular Configuration**: Easy to customize and extend
- **Multiple Hardware Profiles**: Support for AMD, NVIDIA, Intel, and VM setups
- **Home Manager Integration**: User-specific configurations made easy

## 📋 Requirements

- NixOS 23.11 or later
- UEFI boot with GPT partitioning
- 500MB minimum /boot partition
- Systemd-boot (recommended)

## 🚀 Quick Start

1. Install NixOS with the required specifications
2. Run the installation script:
```bash
nix-shell -p git curl
sh <(curl -L https://github.com/yourusername/duhzitos/raw/main/install-duhzitos.sh)
```

## 🛠️ Customization

DuhzitOS is designed to be highly customizable. Key configuration files are located in:

- `modules/`: Core system modules
- `hosts/`: Host-specific configurations
- `profiles/`: Hardware-specific profiles

## 🤝 Contributing

We welcome contributions! Please read our [Contributing Guide](CONTRIBUTING.md) for details.

## 📚 Documentation

- [Installation Guide](docs/installation.md)
- [Configuration Guide](docs/configuration.md)
- [FAQ](docs/faq.md)

## 📞 Support

- [Discord Server](https://discord.gg/your-invite-link)
- [GitHub Issues](https://github.com/yourusername/duhzitos/issues)

## 📜 License

DuhzitOS is licensed under the MIT License. See [LICENSE](LICENSE) for details. 