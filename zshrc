#{{{alias
alias cdc='cd /Users/nateargetsinger/dev/Codazen/codazenFrontEnd/simple-server'
alias CCC='make clean && make release && ./base < in.txt -m FASTTSP'
alias testbase='make clean && make release && make inMST'

# cd shortcuts
alias cdd='cd ~/dotfiles'
alias cdm='cd /Users/nateargetsinger/dev/webDev/REVAMP_webProf'
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
alias vZ='vim ~/.zshrc'
alias vj='vim ~/.notes.txt'

# resource from ~/.bashrc so you dont have to logout and log back in
alias ZZ='source ~/.zshrc'


alias vp='vim *.h *.cpp'
alias v='vim'

#NOTE: this won't work for you cause you aint me.
alias autocaen='osascript /Users/nateargetsinger/Dev/OSAS/acaen.scpt'
alias auto='autocaen &'
alias caen='ssh narget@login.engin.umich.edu'

alias play='afplay -q 1'
alias vim='~/vim'

#NOTE to self: I've deleted the ~/rsync/e dir.  Use sshfs on a dir by dir
#			   basis so to avoid bloated network sync.
alias mnt='sshfs narget@login.engin.umich.edu:e ~/rsync/e'
alias xmnt='diskutil unmount /Users/nateargetsinger/rsync/e'
#}}}
#{{{Function Section
vplus()
{
#!/bin/bash
 
# Request size
stty -echo
echo -ne '\e[18t'
 
# Read size char. by char. (CSI 8 ; height ; width t)
width=0
height=0
p=0
while IFS= read -r -n1 char
do
  # Get past CSI
  if [[ "$p" == 0  &&  "$char" == ";" ]];  then
    p=$((p+1))
 
  # width
  elif [[ "$p" == 1  ]];  then
    [[ "$char" == ";" ]]  &&  p=$((p+1))  ||  height="${height}${char}"
 
  # height
  elif [[ "$p" == 2  ]];  then
    [[ "$char" == "t" ]]  &&  break  ||  width="${width}${char}"
 
  fi
done
 
# Done
stty echo
echo -e "width=$width\nheight=$height"
printf \e\[8;"$width"'170t'
}

function cmdir(){
	mkdir $1 && cd $1;
}
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
big()
{
	printf '\e[8;40;170t'
}

med()
{
	printf '\e[8;30;120t'
}

sm()
{
	printf '\e[8;25;70t'
}

xsm ()
{
	printf '\e[8;20;45t'
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
	scp $@ narget@login.engin.umich.edu:
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

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=420
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

#Use MacVim
#export PATH="/usr/local/bin/mvim:$PATH"

#PS1="\[\033[0;35m\]MOTHERSHIP\[\033[0;33m\]\[\033[0;36m\]\w\[\033[m\]\[\033[0;33m\]\$git_branch\$git_dirt\[$txtrst\]\$ "
#
#Functions!!!
function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

export EDITOR=/usr/local/Cellar/macvim/7.4-72/MacVim.app/Contents/MacOS/Vim
alias remake='make clean && make debug'

# zsh only
#sensible quickstart
source ~/.oh-my-zsh/templates/zshrc.zsh-template
