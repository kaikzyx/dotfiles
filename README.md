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
- Wallpapers (`wallpapers/*.png`)
- SDDM custom theme (`sddm/themes/minimal`) and theme selection (`sddm/sddm.conf.d/theme.conf`)

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
  - `awww`
  - `hyprshot`
  - `wpctl` (PipeWire)
  - `brightnessctl`
- Display/login manager:
  - `sddm`
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

# Optional: backup current SDDM setup (system-wide files)
mkdir -p ~/.config-backup/sddm
cp -r /usr/share/sddm/themes/minimal ~/.config-backup/sddm/ 2>/dev/null || true
cp -r /etc/sddm.conf.d ~/.config-backup/sddm/ 2>/dev/null || true
```

### 2. Apply dotfiles

From the repository root:

```bash
cp -r .config/* ~/.config/
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
```

### 3. Install SDDM theme (system-wide)

```bash
sudo mkdir -p /usr/share/sddm/themes
sudo cp -r sddm/themes/minimal /usr/share/sddm/themes/
sudo mkdir -p /etc/sddm.conf.d
sudo cp sddm/sddm.conf.d/10-theme.conf /etc/sddm.conf.d/
```

## Notes

- Kitty includes only the active theme referenced by `kitty.conf`.
- Neovim folder intentionally contains only files that override LazyVim defaults.
- VS Code export intentionally contains only user settings, not history/cache/state.
- Zsh setup assumes `oh-my-zsh` and `powerlevel10k` are installed in the expected paths.
- Wallpapers are stored in `wallpapers/` and can be used by your wallpaper scripts.
- SDDM theme files are versioned in `sddm/themes/minimal`; enablement is set via `sddm/sddm.conf.d/theme.conf`.
