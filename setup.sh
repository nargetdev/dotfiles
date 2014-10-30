#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
# $DIR now has the location of this file

#arguments
if [ $# -eq 0 ]; then
	echo
	echo "Which components would you like to setup?"
	echo "Your options are:"
	echo "bashrc --> $ ln -s $DIR/bashrc ~/.bashrc"
	echo
	echo "vimrc  --> $ ln -s $DIR/vimrc  ~/.vimrc"
	echo
	echo "wombat --> $ mkdir -p ~/.vim/colors"
	echo "           $ curl 'http://www.vim.org/scripts/download_script.php?src_id=13400' > ~/.vim/colors/wombat256mod.vim"
	echo
	echo "Example:"
	echo "$ ./setup.sh bashrc wombat vimrc"
	echo
exit	
fi

# begin parsing options if there were options
for var in "$@"
do
	if [ "$var" = "bashrc" ]; then
		echo
		echo "Symlinking bashrc..."
		ln -s $DIR/bashrc ~/.bashrc

		if [ $? -eq 0 ]; then echo "Success!"
		fi

	elif [ "$var" = "vimrc" ]; then
		echo
		echo "Symlinking vimrc..."
		ln -s $DIR/vimrc ~/.vimrc

		if [ $? -eq 0 ]; then echo "Success!"
		fi

	elif [ "$var" = "wombat" ]; then
		echo
		echo "Installing wombat256mod.vim in ~/.vim/colors..."
		mkdir -p ~/.vim/colors
		curl 'http://www.vim.org/scripts/download_script.php?src_id=13400' > ~/.vim/colors/wombat256mod.vim	

		if [ $? -eq 0 ]; then echo "Success!"
		fi
	else
		echo
		echo "$var is not a valid input."
	fi
done

echo
echo "+-----------+"
echo "| All done! |"
echo "+-----------+"
echo





# deprecated options format kept for archival purposes

#select opt in $@; do
#if [ "$opt" = "bashrc" ]; then
#echo installing bashrc
#exit
#elif [ "$opt" = "vimrc"  ]; then
#echo installing vimrc
#else
#clear
#echo bad option
#fi
#done
#
#if [ "boo" = "foo" ]; then
#echo "nooooo!"
##ln -s $DIR/.bashrc 
#fi
