#!/bin/bash

#
# Installs all the dot-files (symlinks) to their appropriate locations
#

cd ${HOME}

# Bash
ln -sf etc/bash/bashrc .bashrc
ln -sf etc/bash/bash_aliases .bash_aliases
ln -sf etc/bash/inputrc .inputrc
if [[ `uname` == "Darwin" ]]
then
	ln -sf etc/bash/bash_profile .bash_profile
fi

# Vim
ln -sfT etc/vim/vim .vim
ln -sf etc/vim/vimrc .vimrc
mkdir -p ~/.swp
if [[ `uname` == "Linux" ]]
then
	if [[ `uname -n` == hydrogen* ]]
	then
		ln -sf etc/vim/gvimrc_hydrogen .gvimrc
	else
		ln -sf etc/vim/gvimrc_linux .gvimrc
	fi
else
	ln -sf etc/vim/gvimrc_osx .gvimrc
fi

# Hg
ln -sf etc/hg/hgrc_ignore .hgrc_ignore
if [[ `uname` = "Linux" ]]
then
	ln -sf etc/hg/hgrc_linux .hgrc
else
	ln -sf etc/hg/hgrc_osx .hgrc
fi

# LaTeX
ln -sfT etc/texmf texmf

# Eclipse
ln -sf etc/eclipse/vrapperrc .vrapperrc

# Screen
ln -sf etc/screen/screenrc .screenrc
ln -sfT etc/screen/screen-profiles .screen-profiles

# Abaqus
if   type -P abaqus &>/dev/null || [[ `uname -n` == "titanium"  ]]
then
	ln -sf etc/abaqus/abaqus_v6.env abaqus_v6.env
fi

# SSH
mkdir -p .ssh
cd .ssh
ln -sf ../etc/ssh/config config
cd $HOME

# Fonts
unzip etc/themes/fonts/*zip
mkdir -p .fonts
mv *.otf .fonts

# Clean up home
# mkdir -p media
# sudo rm -rf Templates Public
# sudo mv -n Pictures Videos Music media
