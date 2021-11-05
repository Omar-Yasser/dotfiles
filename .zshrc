if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000

setopt autocd extendedglob 
unsetopt beep notify nomatch
bindkey -e
zstyle :compinstall filename '/home/pseudomar/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit
compinit

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /home/pseudomar/scripts/z.sh

alias syu='sudo pacman -Syu'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias zrc='vim ~/.zshrc'
alias src='source ~/.zshrc'
alias hotp='htop'
alias fuck='sudo "$SHELL" -c "$(fc -ln -1)"'
alias cdd='cd /mnt/pseudomar'
alias yt720='youtube-dl -f bestvideo[height<=720]+bestaudio/best[height<=720]'
alias audio='youtube-dl -x -f bestaudio/best'
alias run='g++ -Wall -Wextra -Wshadow -Wfloat-equal -Wconversion -fsanitize=undefined -fsanitize=address -O2 main.cpp -o main && ./main < input.txt > output.txt'
alias jv='javac main.java && java main'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ducks='du -lcks * | sort -rn | head -30'
alias ..='cd ..'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
