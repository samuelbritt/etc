#!/bin/bash

# install these first so we can start doing work
sudo apt-get install -y			\
	vim-gnome			\
	mercurial			\

# now the rest
sudo apt-add-repository ppa:stebbins/handbrake-releases
sudo apt-get update

	# handbrake			\
sudo apt-get install -y			\
	ipython                         \
	python-scipy                    \
	python-matplotlib               \
	python-virtualenv               \
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
	libdvdread4			\
	ubuntu-restricted-extras	\
	gstreamer0.10-plugins-bad	\
	gstreamer0.10-plugins-ugly	\
	gnome-gmail			\
	colordiff			\
	ddclient			\
	gtk2-engines-pixbuf		\

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

# Enable dvd playback
sudo /usr/share/doc/libdvdread4/install-css.sh

echo
echo "Now that the install is done, be sure to install these from the web:"
echo "Virtualbox (http://www.virtualbox.org/wiki/Linux_Downloads)"
echo "Chrome (http://www.google.com/chrome)"
echo "Eclipse (http://eclipse.org/downloads/)"
echo "EPD (http://www.enthought.com/products/edudownload.php)"
