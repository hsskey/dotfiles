# --- oh-my-zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# --- Homebrew ---
eval "$(/opt/homebrew/bin/brew shellenv)"

# agnoster: hide the user@host segment for the default local user
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# uv (https://docs.astral.sh/uv/)
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# tesseract OCR data (brew install tesseract)
export TESSDATA_PREFIX="/opt/homebrew/share/tessdata"

# --- Aliases ---
alias brewu="brew upgrade"
alias cld="claude --dangerously-skip-permissions"
alias sku="npx skills@latest update --global -y"

# pnpm shortcuts
alias pd="pnpm dev"
alias pi="pnpm install"
alias pt="pnpm test"
alias pb="pnpm build"

# Navigation & utilities
alias rc='nvim $HOME/.zshrc'
alias s='source ~/.zshrc'
alias h='cd $HOME'
alias c='clear'
alias l='eza -lah'

function mc {
  mkdir -p $1
  cd $1
}

# --- Machine-local overrides (not tracked in git) ---
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
