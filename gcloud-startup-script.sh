#! /bin/bash

# Documentation: https://cloud.google.com/compute/docs/startupscript?hl=en_US

# This script is run as root after boot.


$SCRIPTS_DIR = "setup-scripts"

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
    git clone https://github.com/ase16/setup-scripts.git
}

export -f cloneScriptsDir
# run clone function (as other user)
/bin/su ase16 -c "bash -c cloneScriptsDir"
# run hello script (as other user)
/bin/su - ase16 -c "./setup-scripts/hello.sh"
exit 0


