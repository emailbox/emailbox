#!/usr/bin/env bash
# The one-line installer for emailbox
# adapted from amon install script

set -e
file_exists() {
	[ -f "$1" ]
}

command_exists() {
	type "$1" &> /dev/null ;
}

function die(){
 echo $1
 exit 1
}

DISTRO=
VERSION=0.1
PYTHON=python
MONGO_VERSION=2.2.0
VERBOSE=0

# Debian based distros - Tested and supported on : Debian, Ubuntu
if file_exists /etc/debian_version ; then
	DISTRO='debian'
# RPM based distros - Tested and supported on : Fedora, CentOS, Amazon Linux AMI
elif file_exists /etc/redhat-release ; then
	DISTRO='rpm'
elif file_exists /etc/system-release ; then
	DISTRO='rpm'
# Mac OS
elif [ "$(uname -s)" == "Darwin" ]; then
	DISTRO='mac'
	INSTALL_URL="https://raw.github.com/emailbox/emailbox/master/install.sh"
	curl "$INSTALL_URL"macos -o macos_installer
	sudo bash macos_installer $VERSION
	rm -rf macos_installer
	exit
else 
	echo "Your operating system is not supported at the moment"
	exit
fi


# Check if it is 32 or 64 bit machine
MACHINE_TYPE=`uname -m`
if [ "$MACHINE_TYPE" == 'i686' ]; then
	# 32-bit
	echo "*** 32-bit architecture detected"
else
	# 64-bit
	echo "*** 64-bit architecture detected"
fi

# Set variables for the installation
#set -e # Exit the installer on error
bash_script_dir="$( cd "$( dirname "$0" )" && pwd )"
emailbox_install_dir="/usr/local/emailbox"


echo "***  Installing emailbox $VERSION ..."


# Check for heroku cli, git, permissions
# - todo


# Credentials should be entered in some file
# - todo


# Install API
#     git clone git@github.com:emailbox/emailbox_api.git
#     mv credentials.json.rename credentials.json

# Enter your credentials for the various services in `credentials.json` then 

# Push API (with credentials) to new heroku app
#     heroku create
#     heroku addons add:xeround
#     heroku addons add:mongolab
#     rm .gitignore # want to push credentials to heroku (should be using config vars)
#     git push heroku master

# Store credentials locally, use this as the Command Center w/ an interface?
# - idea


# Install Email Worker

#     git clone git@github.com:emailbox/emailbox_email_worker.git
# Add necessary settings to settings.py
# - gmail info (should get from MySQL)

# Add to heroku
#     heroku create
#     git push heroku master

# Start the worker
#     heroku run python emailbox.py email_start
# - need a way to watch this process, restart it if necessary


# Install Email Server
# - don't have this running on heroku yet, so no install instructions available


