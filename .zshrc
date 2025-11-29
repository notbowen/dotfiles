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

# Control Keys
bindkey '\e[1;5D' backward-word
bindkey '\e[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

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

    # depot tools
    export PATH="/Users/bowen/CTFs/tools/browser/depot_tools:$PATH"

    # incus
    export DYLD_LIBRARY_PATH="/opt/homebrew/opt/glib/lib:/opt/homebrew/lib:$DYLD_LIBRARY_PATH"

    # Added by Antigravity
    export PATH="/Users/bowen/.antigravity/antigravity/bin:$PATH"

elif [[ $(uname) == "Linux" ]]; then
    # Fly.io
    export FLYCTL_INSTALL="/home/bowen/.fly"
    export PATH="$FLYCTL_INSTALL/bin:$PATH"

    # nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    # OCaml
    eval $(opam env)

    # Snap
    export PATH="$PATH:/snap/bin"
fi

# ===== Additional Configs =====
# Program Aliases
if [[ $(uname) == "Darwin" ]]; then
    alias vim="nvim"
elif [[ $(uname) == "Linux" ]]; then
    alias vim="/opt/nvim-linux-x86_64/bin/nvim"
fi
alias lg="lazygit"
alias act="source .venv/bin/activate"
alias pwn="docker run --security-opt seccomp=unconfined --privileged --cap-add=SYS_PTRACE -p 31337:31337 -v ./:/pwn -it pwn:pwn bash"

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

# Rust
if [[ $(uname) == "Linux" ]]; then
    . "$HOME/.cargo/env"
    alias ls=/home/bowen/.cargo/bin/exa
elif [[ $(uname) == "Darwin" ]]; then
    alias ls=/Users/bowen/.cargo/bin/exa
fi
