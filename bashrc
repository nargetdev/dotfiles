alias tmux="TERM=screen-256color-bce tmux"
#pathogen install
howtotar()
{
	echo "$ tar -xvfz <name of tarball with .tar.gz extension>"
	echo "$ tar -xvfj <name of tarball with tar.bz2 extension>"
}
configure_pyclewn()
{
	vimdir=$HOME/.vim/bundle python setup.py install --force --home=$HOME
}
uninstall_pyclewn()
{
	vimdir=$HOME/.vim/bundle python setup.py install --force --home=$HOME --record files.txt;
	rm $(cat files.txt)
}
configure_vim()
{
	./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
	make && make install
	mkdir -p $HOME/bin
	cd $HOME/bin
	ln -s $HOME/opt/vim/bin/vim
	which vim
	vim --version
}
#B;;B;;B;;B;;B;;B;;B;;B;;B;;B;;B;;B;;B;;
tarball()
{
	tar -czf submit.tar.gz *
}
untar()
{
	tar xvzf $1
}
buntar()
{
	tar xvjf $1
}
myoutput()
{
	one > my1.txt;
	sleep .5
	echo "one"
	two > my2.txt;
	sleep .5
	echo "two"
	three > my3.txt;
	sleep .5
	echo "three"
	four > my4.txt;
}


#alias one='./rotld -d -c POOR_MAN -a NORMAL -v 10 1.txt'
#alias two='./rotld -d -c POOR_MAN -a NORMAL -v 10 2.txt'
#alias three='./rotld -d -c POOR_MAN -a NORMAL -v 10 3.txt'
#alias four='./rotld -c -a POOR_MAN -v 10 4.txt'

#alias one='./rotld -d -c BINARY -a NORMAL -v 10 1.txt'
#alias two='./rotld -d -c BINARY -a NORMAL -v 10 2.txt'
#alias three='./rotld -d -c BINARY -a NORMAL -v 10 3.txt'
#alias four='./rotld -c -a BINARY -v 10 4.txt'

alias one='./rotld -d -c SORTED -a NORMAL -v 10 1.txt'
alias two='./rotld -d -c SORTED -a NORMAL -v 10 2.txt'
alias three='./rotld -d -c SORTED -a NORMAL -v 10 3.txt'
alias four='./rotld -c -a SORTED -v 10 4.txt'

alias large='./rotld -c SORTED -a NORMAL -v 10 sample-input-2.txt'
alias largeP='./rotld -c POOR_MAN -a NORMAL -v 10 sample-input-2.txt'
alias dP='./rotld -c BINARY -a NORMAL -v 10 -d  sample-input-2.txt > d.txt'

alias BB='source ~/.bash_profile'
alias dcomp='diff d.txt sample-debug-output-2.txt'
alias comp='diff out.txt sample-output-2.txt'
alias norotate='xrandr -o normal'
alias rotate='xrandr -o left'
alias cdm='cd ~/e/p3'

remake()
{
	make clean;
	make debug;
}
#if [ -f ~/.bashrc ]; then
#	.~/.bashrc
#PS1='\[\033[0;31m\]\u\[\033[0;33m\]\!\[\033[0;32m\]\w\[\033[m\] '
#PS1='\[\033[0;35m\]CAEN\[\033[0;33m\]\!\[\033[0;32m\]\w\[\033[m\] '
alias tappD='./rotld -c POOR_MAN -a NORMAL -v 10 -d test-11-PAIRING-LIGHT.txt'
alias tappS='./rotld -c SORTED   -a NORMAL -v 10 -d test-11-PAIRING-LIGHT.txt'
alias tappB='./rotld -c BINARY   -a NORMAL -v 10 -d test-11-PAIRING-LIGHT.txt'
alias test1='./rotld -c POOR_MAN -a LIGHT test-1-POOR_MAN-LIGHT.txt'
alias test5='./rotld -d -v 10 -c POOR_MAN -a NORMAL test-5-BINARY-LIGHT.txt'
alias test6='./rotld -c POOR_MAN -a LIGHT test-6-PAIRING-NORMAL.txt'
function p2tar()
{
	dos2unix *.cpp *.h Makefile test-*.txt; tar -czf submit.tar.gz *.cpp *.h Makefile test-*.txt
}

PS1='\[\033[0;35m\]CAEN\[\033[0;33m\]\!\[\033[0;36m\]\w\[\033[m\]$ '
alias run='./a.out'

alias loc='~C'


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

cmdir()
{
	mkdir $1;
	cd $1;
}
#//B;;B;;B;;B;;B;;B;;B;;B;;B;;B;;B;;B;;B;;file bookmark

#alias d2u='dos2unix -U*; tar czf ./submit.tar.gz *.cpp *.h Makefile test*.txt'
#fast access to config files
#some runstuffs for proj2:
alias run1='./rotld -c POOR_MAN -a LIGHT -v 4 infile.txt'
alias run2='./rotld -c SORTED -a LIGHT -d -v 5 infile.txt'
alias run3='./rotld -c BINARY -a LIGHT -d -v 6 infile.txt'
alias run4='./rotld -c POOR_MAN -a NORMAL -d infile.txt'


alias vV='vim ~/.vimrc'
alias vB='vim ~/.bashrc'

#load *.cpp and *.h files to buffer
alias vp='vim ./*.cpp ./*.h'

alias vbi='vim +BundleInstall +qall'  #install bundles from vundle
alias v*='vim *'
alias run='./a.out'
alias cdv='cd ~/.vim/bundle'
alias cdms='cd ~/e/p2/s2'
alias v='vim'
# Creates an archive (*.tar.gz) from given directory.
alias vN="vim ~/.bash_profile"
