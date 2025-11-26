#!/bin/sh

# Run these apt-get commands to install various packages we want on a typical
# Unix Debian/Ubuntu system for our development and our general use.

# Update
apt-get -y update

# Development
apt-get -y install apt-transport-https
apt-get -y install build-essential
apt-get -y install ca-certificates
apt-get -y install curl
apt-get -y install gcc
apt-get -y install git
apt-get -y install git-core
apt-get -y install gnupg-agent
apt-get -y install make
apt-get -y install openssl
apt-get -y install patch
apt-get -y install software-properties-common
apt-get -y install ssl-cert
apt-get -y install xfsprogs
apt-get -y install sudo


# Libs
apt-get -y install libffi-dev
apt-get -y install libgeos-dev
apt-get -y install libssl-dev
apt-get -y install libv8-dev
apt-get -y install libxml2-dev
apt-get -y install libxslt-dev

# Fetching
apt-get -y install curl
apt-get -y install wget
apt-get -y install jq
apt-get -y install yq

# Editing
apt-get -y install emacs
apt-get -y install nano
apt-get -y install vim

# Utilities
apt-get -y install ack-grep
apt-get -y install atop
apt-get -y install curl
apt-get -y install elinks
apt-get -y install fd-find
apt-get -y install gnupg
apt-get -y install gnupg-agent
apt-get -y install htop
apt-get -y install lynx
apt-get -y install most
apt-get -y install mutt
apt-get -y install pcregrep
apt-get -y install readline-common
apt-get -y install ripgrep
apt-get -y install rsync
apt-get -y install screen
apt-get -y install shellcheck
apt-get -y install tmux
apt-get -y install traceroute
apt-get -y install unrar-free
apt-get -y install unzip
apt-get -y install uuid
apt-get -y install uuid-dev
apt-get -y install uuid-runtime

# Phoenix
apt-get -y install curl 
apt-get -y install elixir
apt-get -y install git 
apt-get -y install postgresql
