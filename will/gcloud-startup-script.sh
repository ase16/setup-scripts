#!/bin/bash

# Documentation: https://cloud.google.com/compute/docs/startupscript?hl=en_US

# This script is run as root after boot.
# The script is added as "Startup script" in the Google Cloud console. 
# The initialization of a system works as follows:
# - the system is updated, git installed
# - the setup-scripts project is cloned from github
# - the run_as_root script is executed as root
# - the run_as_user script is executed as user


# Username
USER=ase16
# home directory of user
USER_HOME="$(eval echo ~"$USER")"
# directory for the scripts in the home dir
SETUP_SCRIPTS="$USER_HOME/setup-scripts"
export SETUP_SCRIPTS

echo "Will: User: $USER" 
echo "Will: User home: $USER_HOME"
echo "Will: Setup scripts: $SETUP_SCRIPTS"
echo "======================================================"

echo "Will: Update system..."
apt-get update -y
#apt-get upgrade -y

echo "Will: Install git..."
apt-get install -y git

function cloneScriptsDir() {
    # go to home dir
    cd ~/
    
    # remove scripts folder if it already exists.
    if [ -d "$SETUP_SCRIPTS" ]
    then
        echo "Will: Remove scripts folder..."
        rm -rf $SETUP_SCRIPTS
    fi
    
    # clone fresh copy from github
    echo "Will: clone setup-scripts from github"
    git clone https://github.com/ase16/setup-scripts.git
}

export -f cloneScriptsDir
# run clone function (as other user)
/bin/su $USER -c "bash -c cloneScriptsDir"

# run the root script
echo "Will: Execute run_as_root"
cd $SETUP_SCRIPTS && cd "will" && ./run_as_root.sh > run_as_root.log 2>&1

# run the user script
echo "Will: Execute run_as_user"
/bin/su - $USER -c "cd $SETUP_SCRIPTS && cd will && ./run_as_user.sh > run_as_user.log 2>&1"

exit 0
