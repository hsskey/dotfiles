#!/usr/bin/env bash
# Idempotent installer: symlinks configs into $HOME, backing up any real
# file/dir it would replace (never silently overwrites).
# Requires Homebrew (fails early if missing); clones tpm if absent.
# Prompt (starship) and zsh plugins are installed by the Brewfile, not here.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local source="$1" target="$2"
  mkdir -p "$(dirname "$target")"

  if [ -L "$target" ]; then
    ln -sfn "$source" "$target"
    echo "  link:   $target"
    return
  fi

  if [ -e "$target" ]; then
    local backup
    backup="$target.bak.$(date +%Y%m%d%H%M%S)"
    mv "$target" "$backup"
    echo "  backup: $target -> $backup"
  fi

  ln -s "$source" "$target"
  echo "  link:   $target"
}

echo "=== dotfiles install ==="

if ! command -v brew >/dev/null 2>&1; then
  echo "error: Homebrew is required but 'brew' was not found." >&2
  echo "install it first: https://brew.sh" >&2
  exit 1
fi

echo "zsh"
link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"

echo "starship"
link "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

echo "git"
link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_DIR/git/ignore" "$HOME/.config/git/ignore"
if [ ! -f "$HOME/.gitconfig.local" ]; then
  cp "$DOTFILES_DIR/git/.gitconfig.local.example" "$HOME/.gitconfig.local"
  echo "  created ~/.gitconfig.local - edit it with your git identity"
fi

echo "gh"
link "$DOTFILES_DIR/gh/config.yml" "$HOME/.config/gh/config.yml"

echo "nvim"
link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo "tmux"
link "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  echo "  installed tpm (press prefix + I inside tmux to install plugins)"
fi

echo "ghostty"
link "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

echo "wezterm"
link "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"

echo ""
echo "=== done ==="
echo "next steps:"
echo "  brew bundle --file=$DOTFILES_DIR/Brewfile"
echo "  edit ~/.gitconfig.local (git identity)"
echo "  optional: cp $DOTFILES_DIR/zsh/.zshrc.local.example ~/.zshrc.local"
