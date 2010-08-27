#!/usr/bin/env sh
#
# This script prepares your chef environment.
#
# Things that get installed:
# - curl
# - git
# - rvm (with ruby 1.8.7)
# - chef
#
# Note: wrote to run on archlinux.

# install curl and git
pacman -Syyu curl git --noconfirm --noprogressbar

# install rvm
curl -L http://bit.ly/rvm-install-system-wide | bash

# load rvm functions to the current shell
source /usr/local/lib/rvm

# install ruby 1.8.7
rvm install 1.8.7

# make ruby 1.8.7's 'global' gemset the default
rvm --default 1.8.7@global

# load rvm functions when spawning a new vhell
echo "[[ -s \"/usr/local/rvm/scripts/rvm\" ]] && . \"/usr/local/rvm/scripts/rvm\"" >> /etc/profile

# install chef
gem install chef --no-ri --no-rdoc
