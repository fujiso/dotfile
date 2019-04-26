#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Customize to your needs...
bindkey -e
#eval "$(pyenv virtualenv-init -)"

alias gpu='watch -n1 "hostname; nvidia-smi pmon -s um -c 1"'
alias imux='tmux attach || tmux new-session \; source-file ~/.tmux/imux'
