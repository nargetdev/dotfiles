export PATH=$PATH:/Users/tanedev/Google\ Drive/bin

# ALIAS
#
alias pissh='ssh pi@10.0.0.9'
alias ncaen='narget@login.engin.umich.edu'
alias wipi='ssh pi@10.0.0.6'

    # MODIFYING CONFIG
    alias cdd='cd ~/config/dotfiles/'
    alias cda='cd ~/config/ansible/'


alias vi='vim -u NONE'

alias va='vim ~/.acc.excess'
#
alias cda='cd /Users/nateargetsinger/Dropbox/sActive\ Projects/REVAMP_webProf'
alias cdv='cd ~/.vim'
alias histgrep="history|grep "
alias webify="ssh nargetde@nargetdev.com git pull"
alias orange='ssh nargetde@nargetdev.com'

# git stuff (Note: be carefull of compatability with oh-my-zsh git plugin)
alias gpu="git push"
alias gcomm="git commit -m"
#gcomm() {
	##echo "$1"
	#git commit -m "$1"
#}
alias gco='git checkout'
alias ls..='ls ..'
alias cd..='cd ..'
alias gs="git status"

# edit a certain file shortcuts
alias vZ="vim ~/.zshrc"
alias vz="vim ~/config/dotfiles/zshrc"
alias vN='vim ~/.bash_profile'
alias vB='vim ~/.bashrc'
alias vV='vim ~/.vimrc'
alias vv='vim ~/config/dotfiles/vimrc'
alias vT="vim ~/.tmux.conf"

alias ga="git add"

alias ZZ="source ~/.zshrc"
alias vj="vim ~/Documents/.notes.md"



alias cdc='cd /Users/nateargetsinger/dev/Codazen/codazenFrontEnd/simple-server'
alias CCC='make clean && make release && ./base < in.txt -m FASTTSP'
alias testbase='make clean && make release && make inMST'

# cd shortcuts
alias cdd='cd ~/.dotfiles'
#alias cdm='cd /Users/nateargetsinger/dev/webDev/REVAMP_webProf'

alias cdv='cd ~/.vim/bundle'


#alias ls='ls -G'
alias tls='tmux ls'
alias tmux='tmux -2'


# resource from ~/.bashrc so you dont have to logout and log back in
alias BB='source ~/.bashrc'


alias vp='vim *.h *.cpp'
alias v='vim'

#NOTE: this won't work for you cause you aint me.
alias autocaen='osascript /Users/nateargetsinger/Dev/OSAS/acaen.scpt'
alias auto='autocaen &'
alias caen='ssh narget@login.engin.umich.edu'

alias play='afplay -q 1'

alias mnt='sshfs narget@login.engin.umich.edu:e ~/rsync/e'
alias xmnt='diskutil unmount /Users/nateargetsinger/rsync/e'
alias mypath="echo $PATH"
alias howbig='du -hs'


alias tkill="tmux kill-server"

alias lsa='ls -a'
alias edz='ed ~/.zshrc'
alias cdm='cd /Users/nateargetsinger/485/pa3_8tdyc1h5mi'
alias vadobe='vim ~/.notes.adobe.crit'

alias show='defaults write com.apple.finder AppleShowAllFiles YES;
killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO;
killall Finder /System/Library/CoreServices/Finder.app'

alias G='grep'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'


#                FUNCTION
howtotmux() {
echo "Some relevant commands:"
echo "tmux new -s session_name"
}

tma() {
	tmux attach-session -t $1
}

backup() {
	mkdir -p .bak
	st=$(date "+%y.%m.%d-%H.%M")
	for file in $@
	do cp $file .bak/"$file"_"$st"
	done
}
#function cmdir(){
	#mkdir $1 && cd $1;
#}
#function pb() {
    #echo "$@" | pbcopy
#}

rc() { echo "${1}" >> .zshrc }

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
function swap()         
{
	# save you a lot of grief if this function messes up
		cp "$1" "$1.inCaseOfCatastrophe"
		cp "$2" "$2.inCaseOfCatastrophe"
    local TMPFILE=swap.tmp.$$
    mv "$1" "$TMPFILE"
    mv "$2" "$1"
    mv "$TMPFILE" "$2"
}

function snap(){
git add -A
git commit -am "${1}"
}

# copy asset(s) to website directory
# usage: web source_file(s) directory_relative_to_root_of_web_directory
function web () {
cp -i $*[1,-2] /Users/nate_argetsinger/dev/web/startbootstrap-agency/${@[$#]}
}

function newcd () {
    if [ $# -eq 0 ]
      then
        echo "No arguments supplied"
    else
        echo "alias cd$1='cd `pwd`'" >> ~/.cd_alias
    fi
}
function cdnew () {
    if [ $# -eq 0 ]
      then
        echo "No arguments supplied"
    else
        echo "alias cd$1='cd `pwd`'" >> ~/.cd_alias
    fi
}
source ~/.cd_alias

function b_cask_install () {
    brew cask install --appdir=/Applications/ $1 | tee ~/config/ansible/.tee.cask
}


function updatecdm () {
echo "alias cdm='cd `pwd`'" >> ~/.cd_alias
}

function newalias () {
	echo "Handle?"
	read handle
	echo "Command?"
	read cmd
	echo "alias $handle='$cmd'">>~/.zshrc
}

function addapp(){
	cp -r `pbpaste` /Applications
	echo "Coppied `pbpaste` to my apps!"
}

function cc(){
	git clone `pbpaste`
}

function br_install () {
brew install $1 | tee ~/config/ansible/.tee.brew
}

function cd {
    builtin cd "$@" && ls -F
}

export PGHOST=eecs484.eecs.umich.edu

function ralias () {
    mkdir -p ~/config/dotfiles/.alias_cache
    echo "alias $1=\"history|tail -n 1|sed 's/\s\s[0-9]*\s\s//'\"" >> ~/config/dotfiles/.alias_cache
}

function rconf () {
    touch ~/config/dotfiles/.config_cache
    echo "`history|tail -n 1|sed 's/\s\s[0-9]*\s\s//'`" >> ~/config/dotfiles/.config_cache
}
