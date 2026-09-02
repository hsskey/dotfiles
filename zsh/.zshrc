# --- Homebrew ---
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- Completion & history ---
autoload -Uz compinit && compinit
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY

# --- zsh-autosuggestions (brew install zsh-autosuggestions): Ctrl+f accepts ---
if [ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  ZSH_AUTOSUGGEST_STRATEGY=(history)
  bindkey '^f' autosuggest-accept
fi

export EDITOR=nvim

# uv (https://docs.astral.sh/uv/)
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# tesseract OCR data (brew install tesseract)
export TESSDATA_PREFIX="/opt/homebrew/share/tessdata"

# --- Aliases ---
# git
alias ..='cd ..'
alias add='git add .'
alias push='git push'
alias pull='git pull'
alias m='git switch main'

# coding agents
alias cld="claude --dangerously-skip-permissions"
alias co="codex --full-auto"
alias sku="npx skills@latest update -g"

# pnpm shortcuts
alias pd="pnpm dev"
alias pni="pnpm install"
alias pt="pnpm test"
alias pb="pnpm build"

# Navigation & utilities
alias brewu="brew upgrade"
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

# --- Prompt: starship (brew install starship; config: ~/.config/starship.toml) ---
if [[ $TERM != "dumb" ]] && command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# --- zsh-syntax-highlighting (brew install zsh-syntax-highlighting): must stay last ---
if [ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
fi
