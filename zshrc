########################################################################
##                            Prompt                                  ##
#######################################################################


# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[magenta]%}[%{$fg[magenta]%}%n%{$fg[blue]%}@%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[magenta]%}]%{$reset_color%}$%b "

#######################################################################################
## History (can't source it if I want zsh and bash to have different history files ) ##
#######################################################################################

HISTFILE=~/.rocket-zsh-history
HISTSIZE=10000
SAVEHIST=10000


################################################################
##                       Alias's                              ##
################################################################


#Diagnonising
alias jctl="journalctl -p 3 -xb"
alias jf='journalctl -f'

# reboot  to boot-manager
alias boot-manager="sudo systemctl reboot --firmware-setup"

################################################################
##                       Edit Dotfiles                       ##
################################################################
#zsh RC
alias zshreload='exec zsh'
alias editzsh='$EDITOR ~/.zshrc'


#bash RC
alias bashreload='source ~/.bashrc'
alias editbash='$EDITOR ~/.bashrc'

#neovim RC
alias editnvimf='flatpak run io.neovim.nvim $HOME/.var/app/io.neovim.nvim/config/nvim/init.vim'




# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'


#Force Delete not empty directory
alias frmdir="sudo rm -vrf"

#Show how much room each directory is using
alias space="du -sh *" 


# switch between shells (alias's allready in arco linux)
# I do not recommend switching default SHELL from bash to learn.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#ls
alias ls='ls -lah --color=always --group-directories-first' # my preferred listing

#Show all the history stored.
alias history="$EDITOR $HISTFILE"

#Directory Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'



#Speed test 
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'


########################################################################
##                            Default Apps                            ##
#######################################################################

# $EDITORS
#export EDITOR="code" # Does not work with the flatpak version but I made a alias
alias code='flatpak run com.visualstudio.code'

# ETC
export BROWSER="firefox"
#export READER="zathura"
export TERMINAL="konsole" # could not get blackbox to run from flatpak so made a alias for it
alias blackbox="flatpak run com.raggesilver.BlackBox"
export VIDEO="vlc"
#export IMAGE=""
#export OPENER="xdg-open"
#export WM="bspwm"

export TERM="xterm-256color"  
export COLORTERM="truecolor"


################################################################
##                       Vim                                  ##
################################################################
# Launch Neovim Flatpak
alias nvimf='flatpak run io.neovim.nvim'

########################################################################
##                            Vim-mode                                ##
#######################################################################
set -o vi



################################################################
##                         cheat                              ##
################################################################
function cheat() { curl -m 7 "http://cheat.sh/$1"; }


################################################################
##                       Distrobox                            ##
################################################################
alias arch='distrobox enter Arch'
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/podman/bin:$PATH
xhost +si:localuser:$USER
neofetch
