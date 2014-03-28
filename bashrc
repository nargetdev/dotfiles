#{{{alias
alias Xsync='sshfs narget@login.engin.umich.edu:~/e/p3 ~/eecs/281market'
alias nosync='umount ~/eecs/281market'
 #alias nosync='diskutil unmount ~/eecs/p3'
alias ls='ls -G'
alias tls='tmux ls'
alias tmux='tmux -2'

# cd shortcuts
alias cdd='cd ~/dotfiles'
alias cdm='cd ~/eecs/281market'
alias cdv='cd ~/.vim/bundle'

# edit a certain file shortcuts
alias vN='vim ~/.bash_profile'
alias vB='vim ~/.bashrc'
alias vV='vim ~/.vimrc'

# resource from ~/.bashrc so you don't have to logout and log back in
alias BB='source ~/.bashrc'


alias vp='vim *.h *.cpp'
alias v='vim'

#NOTE: this won't work for you cause you aint me.
alias autocaen='osascript /Users/nateargetsinger/Dev/OSAS/acaen.scpt'
alias auto='autocaen &'
alias caen='ssh narget@login.engin.umich.edu'

alias play='afplay -q 1'
alias vim='~/vim'

alias mnt='sshfs narget@login.engin.umich.edu:e ~/rsync/e'
alias xmnt='diskutil unmount /Users/nateargetsinger/rsync/e'
#}}}
#{{{Function Section
function pb() {
    echo "$@" | pbcopy
}
grabX()
{
	mkdir -pv ~/eecs/281market/safetynet
	cp -v ~/eecs/281market/{*.h,*.cpp} ~/eecs/281market/safetynet
	touch ~/eecs/281market/safetynet/timestamp.txt
	date > ~/eecs/281market/safetynet/timestamp.txt
	cp -v ~/eecs/Xmarket/{*.h,*.cpp} ~/eecs/281market
}
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
