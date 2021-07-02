# REPRODUCIBLE_TIMESTAMP_ROOTFS is used to set the initial date in the file
# /etc/timestamp.  this allows for an initial system time that is more recent
# than Jan 1, 1970
REPRODUCIBLE_TIMESTAMP_ROOTFS="1620215719"
# variables for setting the firmware version. they are used in naming the
# build artifacts and in populating the /opt/system/sysinfo.env file
MAJOR="0"
MINOR="1"
PATCH="0"
DEV="0"
# BUILD_TYPE should be one of "release", "dev", "debug" or "rc<n>"
# best set before running bitbake with "export BUILD_TYPE=<type>"
# release - official release
# dev - development release
# debug - debug release
# rc<n> - release candidate <n>. ex: rc1
# set a default value in case its not set in the environment
BUILD_TYPE ?= "dev"
PROJECT="vhub"
IMAGE_NAME[vardepsexclude] += "DATETIME DEVTS"
# for BUILD_TYPE=release, DEVTS is null, else DEVTS is -${DATETIME}
DEVTS = "${@oe.utils.conditional('BUILD_TYPE', 'release', '', '-${DATETIME}', d)}"
IMAGE_NAME = "${PROJECT}-${MAJOR}.${MINOR}.${PATCH}.${DEV}-${BUILD_TYPE}${DEVTS}"

