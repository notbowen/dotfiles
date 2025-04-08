# ===== Internal ZSH Stuff =====
# Starship
eval "$(starship init zsh)"

# Set GPG_TTY
export GPG_TTY=$(tty)

# Syntax Highlighting & Auto Suggestions
if [[ $(uname) == "Darwin" ]]; then
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ $(uname) == "Linux" ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Save History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# ===== MacOS Programs =====
if [[ $(uname) == "Darwin" ]]; then
    # OCaml
    eval $(opam env)

    # nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

    # Docker
    fpath=(/Users/bowen/.docker/completions $fpath)
    autoload -Uz compinit
    compinit
fi

# ===== Additional Configs =====
# Program Aliases
alias vim="/opt/nvim-linux-x86_64/bin/nvim"
alias lg="lazygit"
alias act="source .venv/bin/activate"
alias bat="batcat"

# Created by `pipx` on 2025-03-18 05:07:29
export PATH="$PATH:/home/bowen/.local/bin"
export PATH="$PATH:$HOME/.config/emacs/bin"

# bun completions
[ -s "/home/bowen/.bun/_bun" ] && source "/home/bowen/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
