export DOTFILES_DIR=~/.dotfiles
export ANSIBLE_DIR=~/.ansible

alias vim="nvim" # neovim for the win

# MODIFYING CONFIG
alias cdd="cd $DOTFILES_DIR"
alias cda="cd $ANSIBLE_DIR"


alias vi='vim -u NONE'

#alias cdv='cd ~/.vim'
alias hgrep="history|grep "


# space clobber
alias ls..='ls ..'
alias cd..='cd ..'


# edit a certain file shortcuts
alias vZ="nvim ~/.zshrc"
alias vz="nvim $DOTFILES_DIR/zshrc"
alias vV="vim ~/.vimrc"
alias vv="vim  $DOTFILES_DIR/vimrc"
alias vT="vim ~/.tmux.conf"

alias ZZ="source ~/.zshrc"

alias vn="nvim ~/Documents/.notes.md"
alias vj="nvim ~/Documents/.journal.md"


alias tls='tmux ls'
alias tmux='tmux -2'

# VERY INTERESTING ... explore this later - can I still get into the CAEN machine?
#NOTE: this won't work for you cause you aint me.
# alias autocaen='osascript /Users/nateargetsinger/Dev/OSAS/acaen.scpt'
# alias auto='autocaen &'
# alias caen='ssh narget@login.engin.umich.edu'

alias howbig='du -hs'

alias tkill="tmux kill-server"

alias lsa='ls -a'

alias show='defaults write com.apple.finder AppleShowAllFiles YES;
killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO;
killall Finder /System/Library/CoreServices/Finder.app'

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


add_to_zshrc () { echo "${1}" >> .zshrc }

left() {
printf '\e[3;0;0t' # top left
printf '\e[8;48;89t' # maximize vertically
}

right() {
printf '\e[3;720;0t' # middle
printf '\e[8;48;89t' # maximize vertically
}

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


function cdnew () {
    if [ $# -eq 0 ]
      then
        echo "No arguments supplied"
    else
        echo "alias cd$1='cd \"`pwd`\"'" >> $DOTFILES_DIR/.cd_alias
    fi
}
source $DOTFILES_DIR/.cd_alias


function newalias () {
	echo "Handle?"
	read handle
	echo "Command?"
	read cmd
	echo "alias $handle='$cmd'">>~/.zshrc
}


function install_w_tee () {
brew install $1 | tee $ANSIBLE_DIR/.tee.brew
}

# alias cd to also print dir contents..
#function cd {
#    builtin cd "$@" && ls -F
#}


echo "included config"

DEFAULT_USER=`whoami`

function getpath(){
	pwd > $DOTFILES_DIR/.getpath
}
function putpath(){
	`cat $DOTFILES_DIR/.getpath`
}
function gopath(){
cd `xclip -o`
}

# echo this is Darwin
#function getpath(){
#pwd|pbcopy
#}
#function putpath(){
#`pbpaste`
#}
#function gopath(){
#cd `pbpaste`
#}


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


echo "finished sourcing ~/environment/dotfiles/zshrc"
HISTSIZE=999
SAVEHIST=999


export TERM_COLOR="dark"
alias light="echo -e \"\033]50;SetProfile=Light\a\" && TERM_COLOR=light"
alias dark="echo -e \"\033]50;SetProfile=Dark\a\" && TERM_COLOR=dark"

function modfunc(){
nvim `type $1|awk '{print $7}'`
}

function knowhost(){
awk "NR != ${1}" ~/.ssh/known_hosts > ~/.ssh/known_hosts
}
