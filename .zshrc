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

alias vi='nvim'
alias emacs='nvim'
alias gpu='watch -n1 "hostname; nvidia-smi pmon -s um -c 1"'
export PATH="/home/lr/fujiso/.linuxbrew/sbin:$PATH"
