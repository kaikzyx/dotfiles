# Powerlevel10k instant prompt. Keep this near the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/powerlevel10k/powerlevel10k.zsh-theme"

[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt share_history inc_append_history

if command -v asdf &>/dev/null; then
  export ASDF_DATA_DIR="$HOME/.asdf"
  export PATH="$ASDF_DATA_DIR/shims:$PATH"
fi

autoload -Uz compinit && compinit

alias wall="$HOME/.config/hypr/scripts/set_wallpaper.sh"

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
