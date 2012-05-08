#!/bin/bash

#
# Installs all the dot-files (symlinks) to their appropriate locations
#

cd ${HOME}

KERNEL=`uname`
HOST=`uname -n`

# Bash
ln -sf etc/bash/bashrc .bashrc
ln -sf etc/bash/bash_aliases .bash_aliases
ln -sf etc/bash/inputrc .inputrc
if [[ $KERNEL == "Darwin" ]]
then
	ln -sf etc/bash/bash_profile .bash_profile
#elif [[ $KERNEL == "Linux" && ($HOST == silicon || $HOST == aluminum) ]]
#then
	# fix keyboard function keys
	# sudo ./etc/bash/apple_fn.sh
fi

# Vim
ln -sf etc/vim/vim .vim
ln -sf etc/vim/vimrc .vimrc
mkdir -p ~/.swp
if [[ $KERNEL == "Linux" ]]
then
	if [[ $HOST == hydrogen* ]]
	then
		ln -sf etc/vim/gvimrc_hydrogen .gvimrc
	else
		ln -sf etc/vim/gvimrc_linux .gvimrc
	fi
else
	ln -sf etc/vim/gvimrc_osx .gvimrc
fi

# Vim config submodules
# install ruby dev files if needed
hash rake 2>/dev/null || {
	sudo apt-get -y install ruby ruby-dev rake;
}
cd $HOME/.vim/bundle/command-t
rake make
cd $HOME

# Hg
ln -sf etc/hg/hgrc .hgrc
ln -sf etc/hg/hgrc_ignore .hgrc_ignore

# Git
ln -sf etc/git/gitconfig .gitconfig
ln -sf etc/git/gitignore .gitignore
if [[ $KERNEL = "Darwin" ]]
then
	ln -sf etc/git/git-completion.sh ~/.git-completion.sh
fi

# LaTeX
if [[ $KERNEL = "Linux" ]]
then
	ln -sf etc/texmf texmf
elif [[ $KERNEL = "Darwin" ]]
then
	ln -sf etc/texmf ~/Library/texmf
fi

# Eclipse
ln -sf etc/eclipse/vrapperrc .vrapperrc

# Screen
ln -sf etc/screen/screenrc .screenrc
ln -sf etc/screen/screen-profiles .screen-profiles

# Abaqus
if   type -P abaqus &>/dev/null || [[ $HOST == "titanium"  ]]
then
	ln -sf etc/abaqus/abaqus_v6.env abaqus_v6.env
fi

# SSH
mkdir -p .ssh
cd .ssh
ln -sf ../etc/ssh/config config
cd $HOME

# Fonts
# unzip etc/fonts/*zip
# mkdir -p .fonts
# mv *.otf .fonts

# Clean up home
# mkdir -p media
# sudo rm -rf Templates Public
# sudo mv -n Pictures Videos Music media
