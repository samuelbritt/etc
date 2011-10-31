#!/bin/sh

# This script appends a line in to /etc/modprobe.d/hid_apple.conf. This
# switches the behavior of the Apple keyboard: Pressing <F8> will generate <F8>
# rather than a special media key. Use <Fn> to toggle.
echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u

# The effect will take place on reboot. The followning line will temporarily
# enable the effect for this session.
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
