#!/bin/bash

# install these first so we can start doing work
sudo apt-get install -y			\
	vim-gnome			\
	mercurial			\

# now the rest
sudo apt-get install 			\
	ipython                         \
	python-scipy                    \
	python-matplotlib               \
	inkscape                        \
	scribus-ng                      \
	scribus-ng-doc                  \
	gimp                            \
	gnome-do                        \
	vlc                             \
	htop                            \
	tree                            \
	nautilus-open-terminal          \
	engauge-digitizer               \
	compizconfig-settings-manager   \
	qalculate-gtk                   \
	openssh-server                  \
	electricsheep                   \
	network-manager-vpnc            \
	exuberant-ctags                 \
	libdvdcss2			\

	## Others?
	# chromium-browser		\
	# backintime-gnome		\
	# deja-dup			\

# install LaTeX last b/c it takes forever
sudo apt-get install -y			\
	texlive				\
	texlive-latex-recommended	\
	texlive-bibtex-extra            \
	texlive-math-extra              \
	texlive-publishers              \
	texlive-science                 \


echo
echo "Now that the install is done, be sure to install these from the web:"
echo "Virtualbox (http://www.virtualbox.org/wiki/Linux_Downloads)"
echo "Chrome (http://www.google.com/chrome)"
echo "Eclipse (http://eclipse.org/downloads/)"
echo "EPD (http://www.enthought.com/products/edudownload.php)"
