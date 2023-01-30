########################################################################
##                            Prompt                                  ##
#######################################################################

# took from Ubuntu (shouuld just be a plain greed prompt)
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


#######################################################################################
## History (can't source it if I want zsh and bash to have different history files ) ##
#######################################################################################

HISTFILE=~/.rocket-bash-history
HISTSIZE=10000
SAVEHIST=10000


################################################################
##                       Alias's                              ##
################################################################
alias ls='ls -lah --color=always --group-directories-first' # my preferred listing

#Diagnonising
alias jctl="journalctl -p 3 -xb"
alias jf='journalctl -f'



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
export EDITOR="code" #vscode works on mac and linux
#export EDITOR="gnome-text-editor" #does not work on mac
#export EDITOR="nvim" #gnome-text-editor is just easier, I forget neovim all the time

# ETC
export BROWSER="firefox"
#export READER="zathura"
#export TERMINAL="konsole"
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


