DESCRIPTION = "system information"
PRIORITY = "required"
LICENSE="GPL-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

require recipes-core/images/core-image-weston.inc

VERSION ?= "${PROJECT}_${MAJOR}.${MINOR}.${PATCH}.${DEV}_${BUILD_TYPE}"
PRODUCT_VERSION ?= "${VERSION}"
# replace : with - in PRODUCT_VERSION, avoids build failure from sed in base yocto code
PR_VERSION = "${@d.getVar('PRODUCT_VERSION').replace(':', '-')}"
PR = "${PR_VERSION}"
SSTATE_CREATE_PKG = "1"

SRC_URI = " \
          file://sysinfo.sh \
"

inherit deploy

# depends on machine as we have diff dependencies for each
PACKAGE_ARCH = "${MACHINE_ARCH}"

S = "${WORKDIR}"

do_compile[vardepsexclude] = "DATETIME"

do_compile() {
    echo 'OS_VERSION="linux_${VERSION}"' > ${S}/sysinfo.env
    echo 'OS_BUILD_TIMESTAMP="${DATETIME}"' >> ${S}/sysinfo.env
    echo 'OS_MACHINE="${MACHINE}"' >> ${S}/sysinfo.env
    echo 'PRODUCT_VERSION="${PRODUCT_VERSION}"' >> ${S}/sysinfo.env
}

do_install() {
    install -d ${D}/opt/system
    install -m 755 ${S}/sysinfo.env -D ${D}/opt/system/sysinfo.env
    install -d ${D}${bindir}
    install -m 755 ${S}/sysinfo.sh -D ${D}${bindir}/sysinfo
}

do_deploy() {
    install -d ${DEPLOYDIR}
    install ${S}/sysinfo.env ${DEPLOYDIR}
}

addtask deploy after do_compile

FILES_${PN} += "/opt/system/* ${bindir}/*"
