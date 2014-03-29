source ~/.bashrc

#Add git branch to status line:#{{{
#=======================================================|
#$ mkdir -p .bash                                       |
#$ cd .bash                                             |
#$ git clone git@github.com:jimeh/git-aware-prompt.git  |
#=======================================================|
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
 #}}}

PS1="\[\033[0;35m\]CAEN\[\033[0;33m\]\[\033[0;36m\]\w\[\033[m\]\[\033[0;33m\]\$git_branch\$git_dirt\[$txtrst\]\$ "

# Some modules I like to keep on board.
module load cmake/2.8.8
module load python/2.7.6
module load gcc
module load git
module load gdb

# Place my local bin before the system bin so I can use vim 7.4 and other fun stuff
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.vim/local/bin:$PATH
export EDITOR=~/bin/vim

# Clewn stuffs
export CLEWNDIR=$HOME/.vim/bundle/pyclewn/macros
#change key mapping in file $HOME/.vim/bundle/pyclewn/macros\
#.pyclewn_keys.gdb
