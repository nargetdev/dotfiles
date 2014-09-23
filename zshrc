# Set $PATH back to default so that when you re-source this file your path
# doesn't grow indefinitely
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
#{{{alias
# eecs 485 shortcuts
alias cdm='cd /Users/nateargetsinger/485/proj1'
alias ssh485='ssh narget@eecs485-05.eecs.umich.edu'
alias 485machine="echo \"narget@eecs485-05.eecs.umich.edu\""

alias vim='mvim -v'
alias vi='vim -u NONE'
alias va='vim ~/.acc.excess'
#
alias cda='cd /Users/nateargetsinger/Dropbox/sActive\ Projects/REVAMP_webProf'
alias cdv='cd ~/.vim'
alias histgrep="history|grep "
alias webify="ssh nargetde@nargetdev.com git pull"
alias sshaso='ssh nargetde@nargetdev.com'
alias gpu="git push"
alias gcm="git commit -m"
alias gco='git checkout'
alias ls..='ls ..'
alias cd..='cd ..'
alias gs="git status"
alias vZ="vim ~/.zshrc"
alias ga="git add"

alias ZZ="source ~/.zshrc"
alias vj="vim ~/Documents/.notes.md"



alias cdc='cd /Users/nateargetsinger/dev/Codazen/codazenFrontEnd/simple-server'
alias CCC='make clean && make release && ./base < in.txt -m FASTTSP'
alias testbase='make clean && make release && make inMST'

# cd shortcuts
alias cdd='cd ~/dotfiles'
#alias cdm='cd /Users/nateargetsinger/dev/webDev/REVAMP_webProf'

alias cdv='cd ~/.vim/bundle'
alias cd281='cd ~/Desktop/281'
alias cd314='cd ~/Desktop/314'
alias cd395='cd ~/Desktop/395'
alias cd455='cd ~/Desktop/455'
alias cdsync='cd ~/eecs/281market/syncDir'
alias myproj='cd ~/eecs/281market'

alias Xsync='sshfs narget@login.engin.umich.edu:e/p3 /Users/nateargetsinger/eecs/281market/syncDir'
#alias Xsync='sshfs narget@login.engin.umich.edu:/afs/umich.edu/user/n/a/narget/e/p3 /Users/nateargetsinger/eecs/281market'
alias nosync='umount /Users/nateargetsinger/eecs/281market'
 #alias nosync='diskutil unmount ~/eecs/p3'
alias ls='ls -G'
alias tls='tmux ls'
alias tmux='tmux -2'

# edit a certain file shortcuts
alias vN='vim ~/.bash_profile'
alias vB='vim ~/.bashrc'
alias vV='vim ~/.vimrc'

# resource from ~/.bashrc so you dont have to logout and log back in
alias BB='source ~/.bashrc'


alias vp='vim *.h *.cpp'
alias v='vim'

#NOTE: this won't work for you cause you aint me.
alias autocaen='osascript /Users/nateargetsinger/Dev/OSAS/acaen.scpt'
alias auto='autocaen &'
alias caen='ssh narget@login.engin.umich.edu'

alias play='afplay -q 1'

#NOTE to self: I've deleted the ~/rsync/e dir.  Use sshfs on a dir by dir
#			   basis so to avoid bloated network sync.
alias mnt='sshfs narget@login.engin.umich.edu:e ~/rsync/e'
alias xmnt='diskutil unmount /Users/nateargetsinger/rsync/e'
#}}}
#{{{Function Section

#function cmdir(){
	#mkdir $1 && cd $1;
#}
#function pb() {
    #echo "$@" | pbcopy
#}
#grabX() {
	#mkdir -pv ~/eecs/281market/safetynet
	#cp -v ~/eecs/281market/{*.h,*.cpp} ~/eecs/281market/safetynet
	#touch ~/eecs/281market/safetynet/timestamp.txt
	#date > ~/eecs/281market/safetynet/timestamp.txt
	#cp -v ~/eecs/Xmarket/{*.h,*.cpp} ~/eecs/281market
#}
#attach() {
	#tmux attach-session -t $1
#}

##for example, this shell command will set the window to 100x50 characters: 
##printf '\e[8;50;100t'

##Minimize the window for a few seconds, then restore it:

##printf '\e[2t' && sleep 3 && printf '\e[1t' Move the window to the top/left 
##corner of the display:

##printf '\e[3;0;0t'
#left() {
	#printf '\e[3;0;0t' # top left
	#printf '\e[8;48;89t' # maximize vertically
#}

#right() {
	#printf '\e[3;720;0t' # middle
	#printf '\e[8;48;89t' # maximize vertically
#}

##Zoom the window:
#zoom() {
	#printf '\e[9;1t'
#}

##Bring the window to the front (without changing keyboard focus):

##printf '\e[5t'
#small()
#{
	#printf '\e[8;25;70t'
#}


#login()
#{
	#ssh ''$1'@login.engin.umich.edu';
#}
#thanks()
#{
	#printf "Ya no problem bro\n"	
#}

#ww()
#{
	#osascript /Users/nateargetsinger/Dev/OSAS/echo.scpt
#}
#wl()
#{
	#osascript /Users/nateargetsinger/Dev/OSAS/echo.scpt
	#printf '\e[3;0;0t' # top left
	#printf '\e[8;48;89t' # maximize vertically
#}
#wr()
#{
	#osascript /Users/nateargetsinger/Dev/OSAS/echo.scpt
	#printf '\e[3;720;0t' # middle
	#printf '\e[8;48;89t' # maximize vertically
#}

#lh()
#{
	#osascript /Users/nateargetsinger/Dev/OSAS/lh.scpt
	#osascript /Users/nateargetsinger/Dev/OSAS/lh.scpt
	#osascript /Users/nateargetsinger/Dev/OSAS/lh.scpt
#}

#rh()
#{
	#osascript /Users/nateargetsinger/Dev/OSAS/rh.scpt
	#osascript /Users/nateargetsinger/Dev/OSAS/rh.scpt
	#osascript /Users/nateargetsinger/Dev/OSAS/rh.scpt
#}



#show()
#{
	#defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder
#}

#hide()
#{
	#defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder
#}

#send()
#{
	#scp $@ narget@login.engin.umich.edu:
#}


## lsext displays long list of files of the given extension
#function lsext()
#{
#find . -type f -iname '*.'${1}'' -exec ls -l {} \; ;
#}



## batchexec executes a given linux command on a group of files
#function batchexec()
#{
#find . -type f -iname '*.'${1}'' -exec ${@:2}  {} \; ;
#}

## rpass generate a random password with a specified length
#function rpass() {
        #cat /dev/urandom | tr -cd '[:graph:]' | head -c ${1:-12}
#}

## getip displays the ipaddress of a given interface
#function getip()
#{
#/sbin/ifconfig ${1:-eth0} | awk '/inet addr/ {print $2}' | awk -F: '{print $2}';
#}

## mach displays the basic information about the system
#function mach()
#{
    #echo -e "\nMachine information:" ; uname -a
    #echo -e "\nUsers logged on:" ; w -h
    #echo -e "\nCurrent date :" ; date
    #echo -e "\nMachine status :" ; uptime
    #echo -e "\nMemory status :" ; free
    #echo -e "\nFilesystem status :"; df -h
#}

## ll function formats the ls -l output better

#function ll ()
#{
    #clear;
    #tput cup 0 0;
    #ls --color=auto -F --color=always -lhFrt;
    #tput cup 40 0;
#}
#function swap()         
#{
    #local TMPFILE=tmp.$$
    #mv "$1" $TMPFILE
    #mv "$2" "$1"
    #mv $TMPFILE"$2"
#}
#}}}





# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



alias mypath="echo $PATH"
alias howbig='du -hs'

rc() { echo $1 >> .zshrc }
newfunc() {echo "you da shit homie"}
show()
{
	defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder
}
alias cdm='/Users/nateargetsinger/485/proj1/admin/pa1/php/html'

alias cd485='cd /Users/nateargetsinger/485/submitDir/pa1_8tdyc1h5mi'
