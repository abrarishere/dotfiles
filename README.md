# dotfiles

A collection of personal dotfiles for Linux, featuring configurations for Neovim, Zsh, WezTerm, and various utility scripts.

## Directory Overview

```
.
├── nvim/         # Neovim configuration (Lua, plugins, custom modules)
├── scripts/      # Shell scripts for system utilities
├── wezterm/      # WezTerm terminal emulator configuration
└── zsh/          # Zsh shell configuration
```

## Key Features

### Neovim (`nvim/`)
- Modular Lua setup in `.config/nvim/`
- Plugin management via `lazy.nvim`
- Custom keymaps, LSP integration, formatting, and UI improvements

### Scripts (`scripts/`)
- Utilities like `reset_resolution.sh`, `set_virtual_resolution.sh` for display management
- `weather.sh` for adding custom cities to gnome-weather

### WezTerm (`wezterm/`)
- `.wezterm.lua` for personalized terminal appearance and behavior

### Zsh (`zsh/`)
- `.zshrc` with prompt customization, aliases, and environment settings

## Getting Started

Clone this repository and symlink the desired configuration files to your home directory. For example:

```sh
ln -s /path/to/dotfiles/zsh/.zshrc ~/.zshrc
ln -s /path/to/dotfiles/nvim/.config/nvim ~/.config/nvim
ln -s /path/to/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua
```

Alternatively, you can use GNU Stow for symlink management.

Scripts can be executed directly or added to your `PATH`.

## Requirements

- Linux or macOS (may also work on Windows)
- Latest Neovim
- Zsh
- WezTerm
- (Optional) Additional dependencies for scripts (see script headers)

## License

For personal use. You are welcome to adapt these configurations for your own setup.
