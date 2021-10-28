if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000

setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
zstyle :compinstall filename '/home/pseudomar/.zshrc'
autoload -Uz compinit
compinit

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

alias syu='sudo pacman -Syu'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias zrc='vim ~/.zshrc'
alias src='source ~/.zshrc'
alias untar='tar -zxfy'
alias hotp='htop'
alias fuck='sudo "$SHELL" -c "$(fc -ln -1)"'
alias cdd='cd /mnt/pseudomar'
alias anime='ani-cli'
alias yt-480='youtube-dl -f "bestvideo[height<=480][ext=mp4]+bestaudio[ext=m4a]" --no-playlist '
alias run='g++ -Wall -Wextra -Wshadow -Wfloat-equal -Wconversion -fsanitize=undefined -fsanitize=address -O2 main.cpp -o main && ./main < input.txt > output.txt'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ..='cd ..'

export PATH=$PATH:~/scripts/

# colors in mans
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
