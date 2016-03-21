# setup-scripts
Scripts that initialize virtual machines and set up a running node.

## Files
*gcloud-startup-script.sh:* This script is added to the instance template. As a consequence, it is executed after boot as soon as the machine is available. 
See [Compute Documentation]( https://cloud.google.com/compute/docs/startupscript?hl=en_US ) for more information. 
The script clones this repositroy and executes the scripts `run_as_root.sh` and `run_as_user scripts.sh`.

Note: the `setup-scripts` repository is cloned each time the machine boots. This allows to update the scripts very easily and without adapting the instance template or the `gcloud-startup-script.sh` script. 

*run_as_root.sh:* The commands in this script are executed as root. E.g. installing software.

*run_as_user.sh:* The commands in this script are executed as regular user. E.g. cloning other repositories, running software.


