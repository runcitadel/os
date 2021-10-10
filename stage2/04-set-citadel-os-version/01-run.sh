sed -i -e "s/CITADEL_OS=<version>/CITADEL_OS=$CITADEL_OS_VERSION/g" files/citadel
install -m 644 files/citadel "${ROOTFS_DIR}"/etc/default/citadel
