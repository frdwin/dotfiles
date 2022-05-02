# disable greenting
set fish_greeting

# zoxide init
zoxide init fish | source

# environment variables
set -gx PATH $PATH $HOME/.local/bin $HOME/bin
set -gx XCURSOR_PATH $XCURSOR_PATH ~/.local/share/icons
set -gx GOPATH $HOME/go

# aliases
alias ls='exa --icons'
alias ll='exa -h -l --icons --git'
alias lla='exa -h -l -a --icons --git'
alias cd='z'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias grep='rg'
alias cat='bat --theme Nord'

# starship init
starship init fish | source
