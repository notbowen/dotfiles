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
