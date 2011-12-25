#!/usr/bin/bash

##### Create the sym links for the config files
DOTFILES_DIR=~/.dotfiles
config_files=( bash_profile vimrc gitconfig gitignore )
config_directories=( filezilla vim )

symlink_files() {
    for name in ${config_files[@]}
    	do
    		ln -s $DOTFILES_DIR/$name ~/.dotfiles/tmp/.$name
    	    echo "\tlinking $name...."
    	done
}

symlink_directories() {
    for name in ${config_directories[@]}
    	do 
    		ln -s $DOTFILES_DIR/$name ~/.dotfiles/tmp/.$name
    		echo "\tlinking $name...."
    	done
}

symlink_all() {
	symlink_files
	symlink_directories
}

unlink_all() {
    for name in ${config_files[@]}
    	do
    		unlink ~/.dotfiles/tmp/.$name
    		echo "\tunlinking $name"
    	done

    for name in ${config_directories[@]}
    	do
    		unlink ~/.dotfiles/tmp/.$name
    		echo "\tunlinking $name"
    	done
}

usage(){
	echo "Usage:"
	echo "\tunlink -> unlinks all files and directories"
	echo "\tlink -> links all files and directories"	
}

if [ $# -ne 1 ] ; then
	usage
	exit
fi

if [ $1 = "link" ] ; then
	echo "Linking files and directories:"
	symlink_all
elif [ $1 = "unlink" ]; then
	echo "Unlinking files and directories:"
	unlink_all
else
	echo "Invalid option"
	usage
fi