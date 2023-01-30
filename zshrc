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
##                       Ansible Alias's                      ##
################################################################

###Old Public lines
#alias ans='sudo ansible-pull -o -U https://github.com/ReevesA1/ansible.git -vv' # -o means it will only run if any changes 
#alias fans='sudo ansible-pull -U https://github.com/ReevesA1/ansible.git -vv' # -U force run 

### New Private Lines
alias ans='sudo ansible-pull -o -U https://ReevesA1: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@github.com/ReevesA1/ansible.git -vv && source ~/.zshrc' 
# -o means it will only run if any changes 
alias fans='sudo ansible-pull -U https://ReevesA1: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@github.com/ReevesA1/ansible.git -vv && source ~/.zshrc' 
# force run without the -o

alias customfacts='sudo ansible localhost -m setup -a 'gather_subset=!all,!min,virtual' -a filter=ansible_local'
alias gatherfacts='sudo ansible localhost -m gather_facts'

################################################################
##                       Fixes and Diagnosing                 ##
################################################################

# Fixes
alias fix-nautilus='rm -rf ~/.config/nautilus'


#Diagnonising
alias jctl="journalctl -p 3 -xb"
alias jf='journalctl -f'
alias topgradewtf='topgrade --dry-run'


################################################################
##                       Edit Dotfiles                       ##
################################################################
#zsh RC
alias zshreload='exec zsh'
alias editzsh='$EDITOR ~/.zshrc'
#Manjaro zshrc redirect
#alias manzsh='nvim /usr/share/zsh/manjaro-zsh-config'


#bash RC
alias bashreload='source ~/.bashrc'
alias editbash='$EDITOR ~/.bashrc'

#neovim RC
alias editnvim='nvim $HOME/Dotfiles/Neovim/init.vim'
alias editnvimf='flatpak run io.neovim.nvim $HOME/.var/app/io.neovim.nvim/config/nvim/init.vim'

#Neofetch RC
alias editneofetch='nano $HOME/.config/neofetch/config.conf'

################################################################
##                       Vim                                  ##
################################################################
# Launch Neovim Flatpak
alias nvimf='flatpak run io.neovim.nvim'


################################################################
##                       Emacs                                ##
################################################################
# emacs
alias em="/usr/bin/emacs -nw"
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"


################################################################
##                       Package Managers                     ##
################################################################

#Topgrade
alias topgrade="topgrade --disable git_repos -y"

#Pacman
alias fixpacman="sudo rm /var/lib/pacman/db.lck"


#Update Mirrors
alias pmu='sudo pacman-mirrors --fasttrack && sudo pacman -Syyu'
alias amu='sudo nala fetch'

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

#Update
alias pfs='paru && flatpak update && flatpak uninstall --unused && snap refresh && sudo npm install -g npm' 
alias afs='sudo apt update && sudo apt upgrade && sudo flatpak update && flatpak uninstall --unused && snap refresh && pacstall -U && pacstall -Up && sudo npm install -g npm'
alias dfs='sudo dnf update && sudo dnf upgrade && sudo flatpak update && flatpak uninstall --unused && snap refresh && sudo npm install -g npm'
#alias macupx86='sudo softwareupdate -ia ; brew bundle --file=/Users/rocket/.brew-dump/Brewfile; brew bundle --file=/Users/rocket/.brew-dump/Brewfile --force cleanup ; brew doctor'
alias macup='sudo softwareupdate -ia ; arch -arm64 brew bundle --file=/Users/rocket/.brew-dump/Brewfile ; arch -arm64 brew bundle --file=/Users/rocket/.brew-dump/Brewfile --force cleanup ; arch -arm64 brew doctor'
#FYI the --no-quarantine flag does not work on brew bundle on on normal brew commands


################################################################
##                       Cleanup                              ##
################################################################
alias cleanpac='sudo pacman -Rns $(pacman -Qtdq)' #no need in arco already there # if nothing to clean I get an error
alias cleandnf='sudo dnf clean all'
alias cleanapt='sudo apt clean && sudo apt autoremove'



################################################################
##                       SystemCTL                            ##
################################################################
alias sdisable='sudo systemctl disable $@'
alias senable='sudo systemctl enable $@'
alias srestart='sudo systemctl restart $@'
alias sstart='sudo systemctl start $@'
alias sstatus='sudo systemctl status $@'



################################################################
##                       Github                              ##
################################################################
alias ga="git add ."
alias gp="git push"
alias gc="git commit"


################################################################
##                       Misc                                 ##
################################################################
alias cro='systemctl status cro_miner.service'
alias zero='sudo zerotier-cli status'
#alias rofi='rofi -combi-modi window,drun,ssh -theme sidebar -font "hack 10" -show combi -icon-theme "Papirus" -show-icons'
alias rofi='rofi -combi-modi window,drun,ssh -theme mountains -show combi -show-icons'
alias df='df -h'
alias locaterefresh='sudo updatedb' #mlocate refresh database
alias tarnow='tar -acf'
alias untar='tar -zxvf'
alias grubup="sudo update-grub"
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages
alias diff='colordiff -u'
alias installdeb="sudo dpkg -i"
alias pwd="pwd| xclip -sel clipboard"


#batcat
alias cat='bat'
#alias bat='batcat' #for ubuntu only because of a conflict

#htop to bpytop
alias htop="bpytop"

#DT scripts
alias hub='dm-hub' # reason I dont need the path is cause DT put path in script?



# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias lss='exa -lah --group-directories-first --tree --level=2 --icons'
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

#Trash instead of hard deleting
alias rm='trash -v'

#Force Delete not empty directory
alias frmdir="sudo rm -vrf"

#Show how much room each directory is using
alias space="du -sh *" 


#youtube-dlp
alias ytsave='yt-dlp -f "[ext=mp4] /bv*[height<=480]+ba/b[height<=480]"'


# switch between shells (alias's allready in arco linux)
# I do not recommend switching default SHELL from bash to learn.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#Copy Websites (html) to PDF's
alias pdf="wkhtmltopdf"


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


########################################################################
##                            color man pages                         ##
#######################################################################

### "bat" as manpager (does it work with ubunbtu batcat?)
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "nvim" as manpager
#export MANPAGER="nvim -c 'set ft=man' -"

########################################################################
##                            Vim-mode                                ##
#######################################################################
set -o vi






########################################################################
## Enable 'ctrl+s' for Saving in neovim by checking interactive shell ##
#######################################################################

##Bash command 
#[[ $- == *i* ]] && stty -ixon
##ZSH Command
[[ -o login ]] && stty -ixon
##Normal command but Ill get errors on certain shells (like gnome-terminal)
#stty -ixon



################################################################
##                         NALA Functions                     ##
################################################################


# better way to alias nala so both apt and nala work
apt() { 
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}

# if titus commands above for nala don't work reactivate the -g command below
#Debian based
#alias -g apt='nala' #-g stands for global alias and only works on zsh
#alias nala='sudo nala update && sudo nala upgrade' #best i can do in bash for nala


################################################################
##                         Guake Functions                    ##
################################################################


# for Guake to not get the instant prompt thing
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet



################################################################
##                         Arch                               ##
################################################################

# Replace yay with paru if installed
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'



################################################################
##                         cheat                              ##
################################################################
function cheat() { curl -m 7 "http://cheat.sh/$1"; }


