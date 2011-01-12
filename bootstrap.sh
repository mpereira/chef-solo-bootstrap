#!/usr/bin/env sh
#
# This script prepares your chef environment
#
# Things that get installed:
# - curl
# - git
# - rvm (with ruby 1.8.7)
# - chef
#
# Notes:
# - system-wide rvm installation
# - wrote to run on archlinux

# install curl and git
pacman -Syyu curl git --noconfirm --noprogressbar

# install rvm
sh < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )

# load rvm functions to the current shell
source /usr/local/lib/rvm

# install ruby 1.8.7
rvm install 1.9.2

# make ruby 1.8.7's 'global' gemset the default
rvm 1.9.2@global --default

# load rvm functions when spawning a new vhell
echo "[[ -s \"/usr/local/rvm/scripts/rvm\" ]] && . \"/usr/local/rvm/scripts/rvm\"" >> /etc/profile

# install chef
gem install chef --no-ri --no-rdoc
