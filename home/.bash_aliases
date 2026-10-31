# ~/.bash_aliases - sourced from ~/.shell_common, so keep it valid in zsh and bash.
# Git aliases (gst, gco, gp, ...) come from the OMZ git plugin in zsh; run `alias` to list all.

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listing
alias ls='ls --color=auto'
alias grep='grep --color=auto'
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

# Shell config
alias zshrc='$EDITOR ~/.zshrc'
alias aliases='$EDITOR ~/.bash_aliases'

# Arch packages
alias pacup='sudo pacman -Syu'
alias yayup='yay -Syu'
