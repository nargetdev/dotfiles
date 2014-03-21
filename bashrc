#{{{alias
alias tls='tmux ls'
alias tmux='tmux -2'
alias cdm='cd ~/eecs/281market'
alias cdv='cd ~/.vim/bundle'
alias BB='source ~/.bashrc'
alias vN='vim ~/.bash_profile'
alias vB='vim ~/.bash_profile'

alias vB='vim ~/.bashrc'
alias vV='vim ~/.vimrc'
alias v='vim'
alias autocaen='osascript /Users/nateargetsinger/Dev/OSAS/acaen.scpt'
alias auto='autocaen &'

alias play='afplay -q 1'
alias vim='~/vim'
#}}}
#{{{Function Section
attach()
{
	tmux attach-session -t $1
}

#for example, this shell command will set the window to 100x50 characters:
#printf '\e[8;50;100t'

#Minimize the window for a few seconds, then restore it:

#printf '\e[2t' && sleep 3 && printf '\e[1t'
#Move the window to the top/left corner of the display:

#printf '\e[3;0;0t'
left()
{
	printf '\e[3;0;0t' # top left
	printf '\e[8;48;89t' # maximize vertically
}

right()
{
	printf '\e[3;720;0t' # middle
	printf '\e[8;48;89t' # maximize vertically
}

#Zoom the window:
zoom()
{
	printf '\e[9;1t'
}

#Bring the window to the front (without changing keyboard focus):

#printf '\e[5t'
small()
{
	printf '\e[8;25;70t'
}
alias med=''

alias caen='ssh narget@login.engin.umich.edu'
alias mnt='sshfs narget@login.engin.umich.edu:e ~/rsync/e'
alias xmnt='diskutil unmount /Users/nateargetsinger/rsync/e'

login()
{
	ssh ''$1'@login.engin.umich.edu';
}
thanks()
{
	printf "Ya no problem bro\n"	
}

ww()
{
	osascript /Users/nateargetsinger/Dev/OSAS/echo.scpt
}
wl()
{
	osascript /Users/nateargetsinger/Dev/OSAS/echo.scpt
	printf '\e[3;0;0t' # top left
	printf '\e[8;48;89t' # maximize vertically
}
wr()
{
	osascript /Users/nateargetsinger/Dev/OSAS/echo.scpt
	printf '\e[3;720;0t' # middle
	printf '\e[8;48;89t' # maximize vertically
}

lh()
{
	osascript /Users/nateargetsinger/Dev/OSAS/lh.scpt
	osascript /Users/nateargetsinger/Dev/OSAS/lh.scpt
	osascript /Users/nateargetsinger/Dev/OSAS/lh.scpt
}

rh()
{
	osascript /Users/nateargetsinger/Dev/OSAS/rh.scpt
	osascript /Users/nateargetsinger/Dev/OSAS/rh.scpt
	osascript /Users/nateargetsinger/Dev/OSAS/rh.scpt
}

show()
{
	defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder
}

hide()
{
	defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder
}

send()
{
	scp $@ narget@login.engin.umich.edu:~/
}


# lsext displays long list of files of the given extension
function lsext()
{
find . -type f -iname '*.'${1}'' -exec ls -l {} \; ;
}

# batchexec executes a given linux command on a group of files
function batchexec()
{
find . -type f -iname '*.'${1}'' -exec ${@:2}  {} \; ;
}

# rpass generate a random password with a specified length
function rpass() {
        cat /dev/urandom | tr -cd '[:graph:]' | head -c ${1:-12}
}

# getip displays the ipaddress of a given interface
function getip()
{
/sbin/ifconfig ${1:-eth0} | awk '/inet addr/ {print $2}' | awk -F: '{print $2}';
}

# mach displays the basic information about the system
function mach()
{
    echo -e "\nMachine information:" ; uname -a
    echo -e "\nUsers logged on:" ; w -h
    echo -e "\nCurrent date :" ; date
    echo -e "\nMachine status :" ; uptime
    echo -e "\nMemory status :" ; free
    echo -e "\nFilesystem status :"; df -h
}

# ll function formats the ls -l output better
function ll ()
{
    clear;
    tput cup 0 0;
    ls --color=auto -F --color=always -lhFrt;
    tput cup 40 0;
}

alarm()
{
	sleep "$1" && afplay "$2"
}
#}}}
