alias va='vim ~/.acc.excess'
#alias vim="nvim" # neovim for the win

export PATH=$PATH:/Users/tanedev/Google_Drive/bin:/Users/tanedev/ddev/toolchain/gcc-arm-none-eabi-4_9-2015q1/bin
export PATH=$PATH:/opt/vertica/bin
export PATH=$PATH:/opt/vertica/bin
export PATH=$PATH:/media/psf/Home/Google_Drive/dev/toolchain/gcc-arm-none-eabi-4_9-2015q1/bin
export PATH=$PATH:/opt/vertica/bin:/usr/local/gcc-arm-none-eabi-4_9-2015q1/bin


# ALIAS
#
alias pissh='ssh pi@10.0.0.9'
alias ncaen='narget@login.engin.umich.edu'
alias wipi='ssh pi@10.0.0.6'

    # MODIFYING CONFIG
    alias cdd='cd ~/environment/dotfiles/'
    alias cda='cd ~/environment/ansible/'


alias vi='vim -u NONE'

#
alias cda='cd /Users/nateargetsinger/Dropbox/sActive\ Projects/REVAMP_webProf'
alias cdv='cd ~/.vim'
alias hgrep="history|grep "
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
alias vZ="nvim ~/.zshrc"
alias vz="nvim ~/environment/dotfiles/zshrc"
alias vN='vim ~/.bash_profile'
alias vB='vim ~/.bashrc'
alias vV='vim ~/.vimrc'
alias vv='vim ~/environment/dotfiles/vimrc'
alias vT="vim ~/.tmux.conf"

alias ga="git add"

alias ZZ="source ~/.zshrc"
alias vj="nvim ~/Documents/.notes.md"
alias vn="nvim ~/Documents/.journal.md"



alias cdc='cd /Users/nateargetsinger/dev/Codazen/codazenFrontEnd/simple-server'
alias CCC='make clean && make release && ./base < in.txt -m FASTTSP'
alias testbase='make clean && make release && make inMST'

# cd shortcuts
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
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'


#                FUNCTION
howtotmux() {
echo "Some relevant commands:"
echo "tmux new -s session_name"
}

tma() {
	tmux attach-session -t $1
}

backup_hidden() {
	mkdir -p .bak
	st=$(date "+%y.%m.%d-%H.%M")
	for file in $@
	do cp $file .bak/"$file"_"$st"
	done
}
backup() {
	st=$(date "+%y.%m.%d-%H.%M")
	for file in $@
	do cp $file __"$st"_"$file"
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

function cdnew () {
    if [ $# -eq 0 ]
      then
        echo "No arguments supplied"
    else
        echo "alias cd$1='cd `pwd`'" >> ~/environment/dotfiles/.cd_alias
    fi
}
source ~/environment/dotfiles/.cd_alias

function b_cask_install () {
    brew cask install --appdir=/Applications/ $1 | tee ~/environment/ansible/.tee.cask
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
brew install $1 | tee ~/environment/ansible/.tee.brew
}

function cd {
    builtin cd "$@" && ls -F
}

export PGHOST=eecs484.eecs.umich.edu

export SLIMERJSLAUNCHER=/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS/firefox

function ralias () {
    mkdir -p ~/environment/dotfiles/.alias_cache
    echo "alias $1=\"history|tail -n 1|sed 's/\s\s[0-9]*\s\s//'\"" >> ~/environment/dotfiles/.alias_cache
}

function rconf () {
	touch ~/environment/dotfiles/.config_cache
	echo "`history|tail -n 1|sed 's/\s\s[0-9]*\s\s//'`" >> ~/environment/dotfiles/.config_cache
}

function chgrep () {
	hgrep ${1}|tail -n2|head -n1|sed "s/^.\{7\}//"|pbcopy
}


unamestr=`uname`
if [[ "$unamestr" == 'Linux'  ]]; then
    function refactor_make() {
        #cd $(find . -type d -name "_build")/..
        echo "backing up Makefile"
        cp Makefile Makefile.bak
        sed "s/CFLAGS  = -DBOARD_PCA10028/CFLAGS  = -DBOARD_CUSTOM/" Makefile.bak > Makefile
        echo "changing RAM... should subtract 0x4000"
        if [[ -a *.bak ]]; then
            echo "yep it exists"
            exit(0)
        else
            LD_FILE=$(ls *.ld)
        fi
        echo "backing up $LD_FILE file"
        cp $LD_FILE ${LD_FILE}.bak
        sed "s/.*RAM.*LE.*/`grep "RAM.*LENGTH" $LD_FILE|sed \"s/0x6000/0x2000/\"`/" ${LD_FILE}.bak > $LD_FILE
    }
    function rebuild_nrf(){
        
        #cd $(find . -type d -name "_build")/..
        NRF51_SDK=/media/psf/Home/Google_Drive/dev/nordic/nRF51_SDK_8.1.0
        make all
        SOFTDEVICE=$NRF51_SDK/components/softdevice/s110/hex/s110_softdevice.hex
        OUTPUT=_build/output.hex
        INPUT=_build/nrf51422_xxac_s110.hex
        srec_cat $SOFTDEVICE -intel $INPUT -intel -o $OUTPUT -intel --line-length=44
        cp $OUTPUT /media/$USER/MBED
    }
    #ls *.ld|xargs -i cp {} {}.bak
    echo "yes"
else
    echo "not linux"
fi

echo "included config"

DEFAULT_USER=`whoami`
=======

    function getpath(){
        pwd|xclip
    }
    function putpath(){
        `xclip -o`
    }
    function gopath(){
        cd `xclip -o`
    }

	export SLIMERJSLAUNCHER=/usr/bin/firefox
    echo "this is ubuntu - sourced according section"
else
    function getpath(){
        pwd|pbcopy
    }
    function putpath(){
        `pbpaste`
    }
    function gopath(){
        cd `pbpaste`
    }
export SLIMERJSLAUNCHER=/Applications/Firefox.app/Contents/MacOS/firefox
    echo "this is OS X - finished sourcing section"
fi

function begin_install_log() {
    if [ $# -eq 0 ]
      then
        echo "No arguments supplied"
		HIST_NUM=""
    else
		HIST_NUM=$(history|tail -n 1|awk '{ print $1  }')
		HIST_NUM=$((HIST_NUM + 2))
		OUTPUT_FILE=$HOME/environment/ansible/.install_cache/${1}
    fi
}
function capture_install_log() {
if [ ! $HIST_NUM ]
then
	echo "run 'begin_install_log' first"
else
	history|grep -A999 $HIST_NUM|awk '{$1=""; print $0}' >> $OUTPUT_FILE
	HIST_NUM=""
fi
}

DEFAULT_USER=`whoami`


### PATCH - TEMPORARY
PATH=$PATH:$HOME/Google_Drive/util/slimerjs-0.9.6
echo "finished sourcing ~/environment/dotfiles/zshrc"
HISTSIZE=999
SAVEHIST=999

alias neo='nvim'

#GIT ALIAS
alias gitnp='git --no-pager'
alias gcam='git commit -am'


export TERM_COLOR="dark"
alias light="echo -e \"\033]50;SetProfile=Light\a\" && TERM_COLOR=light"
alias dark="echo -e \"\033]50;SetProfile=Dark\a\" && TERM_COLOR=dark"
