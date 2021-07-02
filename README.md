OpenEmbedded/Yocto for Zoetis's vetscan hub intel-corei7 platform
===================================================

Build Instructions:

repo init -u git@github.com:ZoetisDenmark/vetscan-hub-manifest -b main
repo sync -j4
source ./setup-environment
bitbake core-image-weston

