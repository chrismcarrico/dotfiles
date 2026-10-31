# ~/.bash_aliases - sourced from ~/.zshrc after Oh My Zsh.
# Git aliases (gst, gco, gp, ...) come from the OMZ git plugin; run `alias` to list all.

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listing
alias ll='ls -lAh'
alias la='ls -A'
alias lt='ls -lAhtr'

# Safer file operations
alias cp='cp -i'
alias mv='mv -i'

# Disk and system
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ports='ss -tulpn'

# Editor
alias v='nvim'

# Shell config
alias zshrc='$EDITOR ~/.zshrc'
alias aliases='$EDITOR ~/.bash_aliases'
alias reload='exec zsh'

# Docker
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'

# Tools
alias lg='lazygit'

# Arch packages
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacrm='sudo pacman -Rns'
alias pacs='pacman -Ss'
alias yayup='yay -Syu'
