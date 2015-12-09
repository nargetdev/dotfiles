editor=nvim
alias publish='ssh -v -f nargetde@nargetdev.com "cd public_html && git pull &> /dev/null" 2> ~/tmp/ssh.err'

dotfile_location=/Users/tanedev/environment/dotfiles

source $dotfile_location/.backup_directives

#alias vim="nvim" # neovim for the win

export PATH=/Users/tanedev/Google_Drive/dev/hardware/toolchain/gcc-arm-none-eabi-4_9-2015q1/bin:$PATH:/opt/vertica/bin
export PATH=$PATH:/opt/local/bin
export PATH=/usr/lib/qt4/bin:$PATH


source $dotfile_location/zsh_alias

source $dotfile_location/zsh_function



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

    function getpath(){
        echo \"`pwd`\" > $HOME/environment/.getpath
    }
    function putpath(){
        `cat $HOME/environment/.getpath`
        #`xclip -o`
    }
    #function gopath(){
        #cd `xclip -o`
    #}

	export SLIMERJSLAUNCHER=/usr/bin/firefox
    echo "this is ubuntu - sourced according section"
else
    function getpath(){
        echo \"`pwd`\" > $HOME/environment/.getpath
    }
    function putpath(){
        cd `cat $HOME/environment/.getpath`
        #`xclip -o`
    }
    function gopath(){
        cd  "`cat $HOME/environment/.getpath`"
    }
    #function getpath(){
        #pwd|pbcopy
    #}
    #function putpath(){
        #`pbpaste`
    #}
    #function gopath(){
        #cd `pbpaste`
    #}

function sdk6_0_build_and_flash(){
    nrfjprog --flash $(rm -r _build; make -f $1 |tail -n 1|awk '{print $5}')
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


#GIT ALIAS
alias gitnp='git --no-pager'
alias gcam='git commit -am'


export TERM_COLOR="dark"
alias light="echo -e \"\033]50;SetProfile=Light\a\" && TERM_COLOR=light"
alias dark="echo -e \"\033]50;SetProfile=Dark\a\" && TERM_COLOR=dark"

alias flash_SD73="nrfjprog --flash-softdevice s110_nrf51822_7.3.0_softdevice.hex"

function flash_here() {
  nrfjprog --flash _build/*.hex
}

function deretlif_hide(){
    hdiutil create -srcfolder /Users/tanedev/deretlif -encryption AES-128 /Users/tanedev/deretlif
    #rm -rf /Users/tanedev/deretlif
}
function deretlif_show(){
}
#
#set -o vi
#
export S110="/Users/tanedev/Google_Drive/dev/hardware/IoT/nordic/nrf51822/soft_device/s110_nrf51822_7.3.0/s110_nrf51822_7.3.0_softdevice.hex"

function my_nrfjprog(){
nrfjprog --erase-all && nrfjprog --flash-softdevice $1 && nrfjprog --flash $1 && nrfjprog --reset
}

#alias gitnp="git --no-pager"

function message_date(){
gdate -ud "2001-01-01 + `pbpaste` seconds"
}

alias nrsync="rsync -avh --progress --append"

alias getBathroom='curl "https://bathroomlogger.firebaseio.com/bathroom_activity.json" | jq ".[].utc"|xargs -n 1 date -r'
