require core-image-weston.inc
EXTRA_IMAGE_FEATURES = "package-management"
IMAGE_FEATURES += "ssh-server-openssh"
IMAGE_INSTALL_remove = "packagegroup-core-ssh-dropbear"
IMAGE_FSTYPES = "live hddimg iso"
INHERIT += "image-buildinfo"

IMAGE_INSTALL += " \
    htop \
    cpufrequtils \
    dpkg \
    rsync \
    bc \
    xclock \
    qt-kiosk-browser \
    sysinfo \
    packagegroup-security-tpm2 \
    sema \
    startupconfig \
    alsa-utils \
    alsa-tools \
    evtest \
    ethtool \
    fbset \
    fb-test \
    fbida \
    fio \
    glmark2 \
    haveged \
    hdparm \
    hostapd \
    i2c-tools \
    iozone3 \
    iptables \
    iproute2 \
    iperf3 \
    libsocketcan \
    lmbench \
    memtester \
    mmc-utils \
    net-tools \
    spidev-test \
    stress-ng \
    stressapptest \
    sysbench \
    v4l-utils \
    git \
    curl \
    wget \
    which \
    busybox \
    bzip2 \
    cmake \
    bash \
    tar \
    gzip \
    kmod \
    minicom \
    vim \
    lshw \
    ntp \
    ntpdate \
    libstdc++ \
"

create_extra_dir() {
   mkdir -p ${IMAGE_ROOTFS}/configuration
   mkdir -p ${IMAGE_ROOTFS}/snaps
   mkdir -p ${IMAGE_ROOTFS}/ota
   mkdir -p ${IMAGE_ROOTFS}/security
   mkdir -p ${IMAGE_ROOTFS}/userdata
   mkdir -p ${IMAGE_ROOTFS}/apps
   mkdir -p ${IMAGE_ROOTFS}/factory
   mkdir -p ${IMAGE_ROOTFS}/environment
   mkdir -p ${IMAGE_ROOTFS}/ice
   mkdir -p ${IMAGE_ROOTFS}/ffe
   mkdir -p ${IMAGE_ROOTFS}/var/spool/cron/crontabs
}

IMAGE_PREPROCESS_COMMAND += "create_extra_dir;"

