# ~/.bashrc: executed by bash(1) for non-login shells.

#Mr Sandman's PopOS .bashrc - haha bash go brrrrr :)

# Aquí empieza la zona recomendada por defecto | Default .bashrc stuff (base things) 

#------------ DEFAULT CONFIG | CONFIG POR DEFECTO ------------#
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias opcionales
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#-------------------------------------------------------------#
#                                                             #     
#      CUSTOM CONFIG : ALIASES, KEYBINDS, PROMPTS, ETC.       #
#                                                             #
#               https://github.com/mrs4ndman                  #
#                                                             #
#-------------------------------------------------------------#

#------------------------- EXPORTS ---------------------------#

export BROWSER="firefox"
export BASHRC="$HOME/.bashrc"
export EDITOR="vim"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '
export FZF_DEFAULT_OPTS='-m --height 40% --border'
export MAINED="nvim"
export PATH="/home/mrsandman/.cargo/bin:/home/mrsandman/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export VIMRC="$HOME/.vimrc"
export VISUAL="vim"

#------------ MIS PROPIOS ALIAS - MY OWN ALIASES ------------#

# 1.- File management | Gestión archivos

alias infuse='chmod u+x'
alias tree-size='tree -s -h --du'
alias trunk='tree -a -C'

# 2.- Program shorthands | Atajos cortos a programas

alias afk='watch -n 1 neofetch --stdout | lolcat'
alias bt='bashtop'
alias ct='batcat --number'
alias empty-can='trash-empty'
alias fsh='flameshot >/dev/null 2>&1 &! disown'
alias lebron-james='trash-put'
alias list-can='trash-list'
alias lol='toilet --gay lol'
alias slay='toilet --gay'
alias temps='psensor 2>&1'
alias minifetch='neofetch --config ~/.config/neofetch/minifetch.conf'
alias mft='minifetch'
alias nft='neofetch'
alias nv='nvim'
alias nyan='nyancat -n'
alias powershell='pwsh'
alias powsh='pwsh'
alias rge='alacritty -e ranger'
alias svim='sudoedit'
alias srg='sudo ranger'
alias trp='trash-put'
alias trr='trash-restore'

# 3.- Config shorcuts | Atajos a archivos de configuración

alias bup="source ~/.bashrc && echo 'Sourced .bashrc OK - .bashrc recargado OK'"
alias dwn='cd ~/Descargas'
alias dtop='cd ~/Escritorio'
alias gch='cd ~/Gitchub'
alias nvrc='nvim .config/nvim/'
alias nvbash='nvim ~/.bashrc'
alias vrc='vim ~/.vimrc'

# 4.- In-shell program option shortcuts | Atajos a funciones concretas de programas de shell

alias bonk='exit'
alias boop='sudo systemctl restart'
alias cat!='sudo cat'
alias cl='clear'
alias cls='clear;ls -lh'
alias debinst='sudo apt install'
alias gib='sudo apt install'
alias meminfo='free -html'
alias need='sudo apt search'
alias servlist='sudo service --status-all'
alias sreload='sudo systemctl reload'
alias sshrepub='echo "Path to private >> path to recovered public"; sleep 1; ssh-keygen -y -f'
alias sstate='sudo systemctl status'
alias sstop='sudo systemctl stop'
alias syncerr='find -name *.sync-*'
alias untar='tar xvf'
alias vm-list='sudo find / -name *.qcow2 -a -name *.vdi 2>/dev/null'
alias vls='watch -n 0.1 ls -la'
alias whack='sudo systemctl restart'
alias where='echo "The good one:"; which; echo "Where you can find it:"; whereis'
alias wut='whatis'


# 4.1.- ---------------- SHELL CHANGER -----------------------#
# 
# Uncomment the aliases this if you swap shells / are trying shells frequently
# Descomentar los alias si cambias entre / pruebas varias shells regularmente
# 
# Set bash:
#alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out - Ahora haz logout'"
# Set zsh:
#alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out - Ahora haz logout'"
# Set fish:
#alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out - Ahora haz logout'"
# Set sh:
#alias tosh="chsh $USER -s /bin/sh && echo 'Now log out - Ahora haz logout'"


# 5.- Aliases that call on multiple programs / functions

alias af='alias | fzf'
alias did="history | grep"
alias flip='sudo apt update -y && sudo apt upgrade && sudo apt autoremove && sudo apt clean'
alias font-search='fc-list | grep'
alias fv='nvim -o `fzf`'
alias fenv='printenv | fzf'

alias gensecpass="head -c 32 /dev/random | base64 | sed "s:[+=/]::g" | head -c 32"
# This is a bashism, gensecpass ONLY WORKS ON BASH - gensecpass SOLO FUNCIONA EN BASH;
# Will find a way to make it cross-shell compatible

alias mygit-clone='cd /home/mrsandman/git-clone-zone && git clone https://github.com/mrs4ndman/base.git && git clone https://github.com/mrs4ndman/setup.git'
alias myip='curl ipinfo.io/ip'

alias missile='sudo find / -name 2>/dev/null' 
#   The missile knows where it is at all times. It knows this because it knows where it isn't. By subtracting where it is from where it isn't, or where it isn't from where it is (whichever is greater), it obtains a difference, or deviation. The guidance subsystem uses deviations to generate corrective commands to drive the missile from a position where it is to a position where it isn't, and arriving at a position where it wasn't, it now is. Consequently, the position where it is, is now the position that it wasn't, and it follows that the position that it was, is now the position that it isn't.
#   In the event that the position that it is in is not the position that it wasn't, the system has acquired a variation, the variation being the difference between where the missile is, and where it wasn't. If variation is considered to be a significant factor, it too may be corrected by the GEA. However, the missile must also know where it was.
#   The missile guidance computer scenario works as follows. Because a variation has modified some of the information the missile has obtained, it is not sure just where it is. However, it is sure where it isn't, within reason, and it knows where it was. It now subtracts where it should be from where it wasn't, or vice-versa, and by differentiating this from the algebraic sum of where it shouldn't be, and where it was, it is able to obtain the deviation and its variation, which is called error.

#   Missile copy-pasta: Modern day memes hidden in plain sight

alias ports='sudo lsof -l -P -n | grep LISTEN'
alias speedy='sudo mount -t tmpfs -o size=1024M tmpfs /media/rammy' # Temporal RAMDISK that goes away on shutdown | RAMDISK temporal que se va con apagado del sistema #
alias sysinfo='sudo fdisk -l; blkid; lshw; lscpu; lscpi; diskusage; df -hl -x squashfs; temp; nft'

#-------------------------------------------------------------#


#------------------------ GIT ALIAS ZONE ---------------------#

alias gaa='git add .'
alias gca='git commit --amend -m'
alias gcm='git commit -am'
alias gcn='git commit --amend --no-edit'
alias gcl='git clean' 
alias gco='git checkout'
alias gd='git diff'
alias gib='git init -b'
alias gin='git init'
alias gl='git log'
alias glp='git log --graph --oneline --decorate'
alias gpo='git push origin'
alias grv='git revert'
alias gst='git status'
alias gsh='git stash'
alias gsa='git stash apply'
alias gsl='git stash list'
alias gsp='git stash pop'

alias yeet='git push'
alias yoink='git pull'

#-------------------------------------------------------------#

#--- ARCHIVE EXTRACTOR - EXTRACTOR DE ARCHIVOS COMPRIMIDOS ---#
#--- Requires the following packages - Requiere los siguiente paquetes:
# bzip2 tar rar unrar gzip zip unzip ncompress p7zip-full ar zstd xz-utils #

ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1  ;;
            *.tar.gz)   tar xzf $1  ;;
            *.bz2)      bunzip2 $1  ;;
            *.rar)      unrar x $1  ;;
            *.gz)       gunzip $1   ;;
            *.tar)      tar xf $1   ;;
            *.tbz2)     tar xjf $1  ;;
            *.tgz)      tar xzf $1  ;;
            *.zip)      unzip $1    ;;
            *.Z)        uncompress $1;;
            *.7z)       7za e x $1  ;;
            *.deb)      ar x $1     ;;
            *.tar.xz)   tar xf $1   ;;
            *.tar.zst)  unzstd $1   ;;
            *)          echo "'$1' could not be extracted with ex() - No se ha podido extraer con ex" ;;
        esac
    else
        echo "'$1' is not a valid file - '$1' no es un tipo de archivo válido"
    fi
}


#------------- AUTOCOMPLETION - AUTOCOMPLETACIÓN -------------#

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# FZF integration (https://github.com/junegunn/fzf)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


#------------- PLUGIN AND ALIAS LOADING SCRIPTS --------------#

if command -v thefuck >/dev/null 2>&1; then
    eval $(thefuck --alias)
fi

 if command -v starship >/dev/null 2>&1; then
     eval "$(starship init bash)"
 fi

#------------- MINIFETCH ON TERMINAL WINDOW START ---------------#
# Minifetch is an alias for my alternate neofetch config
# Comment out this line if you haven't the alias and separate 
# config for it
#
minifetch


#---------------- bat (cat improved) integration ----------------#
#
# Can remove / comment out if not using bat as a cat frontend
#
eval "$(batpipe)"
# Invokes batpipe
LESSOPEN="|/usr/local/bin/batpipe %s";
export LESSOPEN;
unset LESSCLOSE;

# Uses batpipe as a preprocessor for less
LESS="$LESS -R";
BATPIPE="color";
export LESS;
export BATPIPE;

