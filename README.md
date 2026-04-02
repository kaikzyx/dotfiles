# Arch Linux Dotfiles

Personal dotfiles for an Arch Linux setup, focused on a minimal Wayland workflow.

## What is included

- Zsh shell config (`.zshrc` + `.p10k.zsh`)
- Hyprland (`.config/hypr`)
- Waybar (`.config/waybar`)
- Wofi (`.config/wofi`)
- Kitty (`.config/kitty`) with only the active theme (`OneDark.conf`)
- VS Code user settings (`.config/Code/User/settings.json`)
- Neovim LazyVim overrides only (`.config/nvim`)

## Repository layout

```text
.
├── .p10k.zsh
├── .config
│   ├── Code
│   │   └── User
│   │       └── settings.json
│   ├── hypr
│   │   ├── hyprland.conf
│   │   └── scripts
│   │       └── set_wallpaper.sh
│   ├── kitty
│   │   ├── kitty.conf
│   │   └── themes
│   │       └── OneDark.conf
│   ├── nvim
│   │   └── lua
│   │       ├── config
│   │       │   └── options.lua
│   │       └── plugins
│   │           ├── colorscheme.lua
│   │           └── smear_cursor.lua
│   ├── waybar
│   │   ├── config.jsonc
│   │   └── style.css
│   └── wofi
│       ├── config
│       └── style.css
├── .zshrc
└── README.md
```

## Prerequisites

- Arch Linux (or compatible distro)
- `zsh`
- `oh-my-zsh`
- `powerlevel10k`
- Zsh plugins used in `.zshrc`:
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
- Hyprland ecosystem tools used by the config:
  - `hyprland`
  - `waybar`
  - `wofi`
  - `kitty`
  - `swww`
  - `hyprshot`
  - `wpctl` (PipeWire)
  - `brightnessctl`
- Fonts:
  - `JetBrainsMono Nerd Font`

## Install

### 1. Backup current config

```bash
mkdir -p ~/.config-backup
cp -r ~/.config/hypr ~/.config-backup/ 2>/dev/null || true
cp -r ~/.config/waybar ~/.config-backup/ 2>/dev/null || true
cp -r ~/.config/wofi ~/.config-backup/ 2>/dev/null || true
cp -r ~/.config/kitty ~/.config-backup/ 2>/dev/null || true
cp -r ~/.config/Code ~/.config-backup/ 2>/dev/null || true
cp -r ~/.config/nvim ~/.config-backup/ 2>/dev/null || true
cp ~/.zshrc ~/.config-backup/ 2>/dev/null || true
cp ~/.p10k.zsh ~/.config-backup/ 2>/dev/null || true
```

### 2. Apply dotfiles

From the repository root:

```bash
cp -r .config/* ~/.config/
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
```

## Notes

- Kitty includes only the active theme referenced by `kitty.conf`.
- Neovim folder intentionally contains only files that override LazyVim defaults.
- VS Code export intentionally contains only user settings, not history/cache/state.
- Zsh setup assumes `oh-my-zsh` and `powerlevel10k` are installed in the expected paths.

## Maintenance

After changing local configs, sync updates back into this repository and commit:

```bash
git add .
git commit -m "update dotfiles"
```
