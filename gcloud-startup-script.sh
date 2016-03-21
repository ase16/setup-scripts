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
SCRIPTS_DIR="$USER_HOME/setup-scripts"

echo "User: $USER" 
echo "User home: $USER_HOME"
echo "Scripts dir: $SCRIPTS_DIR"
echo "================"

echo "Update system..."
apt-get update -y
apt-get upgrade -y

echo "Install git..."
apt-get install -y git

function cloneScriptsDir() {
    # go to home dir of user
    cd ~/
    
    # remove scripts folder if it already exists.
    if [ -d "$SCRIPTS_DIR" ]; then
        echo "Remove scripts folder."
        rm -rf $SCRIPTS_DIR
    fi
    
    # clone fresh copy from github
    echo "clone setup-scripts from github"
    git clone https://github.com/ase16/setup-scripts.git
}

export -f cloneScriptsDir
# run clone function (as other user)
/bin/su $USER -c "bash -c cloneScriptsDir"

# run the root script
echo "Execute run_as_root"
cd $SCRIPTS_DIR && ./run_as_root.sh > run_as_root.log

# run the user script
echo "Execute run_as_user"
/bin/su - $USER -c "cd $SCRIPTS_DIR && ./run_as_user.sh > run_as_user.log"

exit 0


