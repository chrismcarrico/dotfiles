# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.shell_common ]] && . ~/.shell_common

PS1='[\u@\h \W]\$ '

alias reload='exec bash'
