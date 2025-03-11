# ===== Internal ZSH Stuff =====
# Starship
eval "$(starship init zsh)"

# Syntax Highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto Suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ===== PROGRAMS =====
# OCaml
eval $(opam env)

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Docker
fpath=(/Users/bowen/.docker/completions $fpath)
autoload -Uz compinit
compinit

# ===== Additional Configs =====
# Program Aliases
alias vim="nvim"
alias lg="lazygit"
