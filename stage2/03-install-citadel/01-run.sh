#!/bin/bash -e

# This script:
# - Installs citadel's dependencies
# - Installs citadel

# Install Docker
echo "Installing Docker and the compose plugin..."
echo
on_chroot << EOF
curl -fsSL https://get.docker.com | sh
usermod -a -G docker $FIRST_USER_NAME
mkdir -p /usr/lib/docker/cli-plugins
curl -o /usr/lib/docker/cli-plugins/docker-compose https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linux-aarch64
chmod +x /usr/lib/docker/cli-plugins/docker-compose
EOF

# Bind Avahi to eth0,wlan0 interfaces to prevent hostname cycling
# https://github.com/getumbrel/umbrel-os/issues/76
echo "Binding Avahi to eth0 and wlan0 interfaces..."
on_chroot << EOF
sed -i "s/#allow-interfaces=eth0/allow-interfaces=eth0,wlan0/g;" "/etc/avahi/avahi-daemon.conf";
EOF

# Install Citadel
echo "Installing Citadel..."
echo

# Download Citadel
mkdir /citadel
cd /citadel
if [ -z ${CITADEL_REPO} ]; then
curl -L https://github.com/runcitadel/compose-nonfree/archive/v${CITADEL_VERSION}.tar.gz | tar -xz --strip-components=1
else
git clone ${CITADEL_REPO} .
git checkout "${CITADEL_BRANCH}"
fi

# Enable Citadel OS systemd services
cd scripts/citadel-os/services
CITADEL_SYSTEMD_SERVICES=$(ls *.service)
echo "Enabling Citadel systemd services: ${CITADEL_SYSTEMD_SERVICES}"
for service in $CITADEL_SYSTEMD_SERVICES; do
    sed -i -e "s/\/home\/citadel/\/home\/${FIRST_USER_NAME}/g" "${service}"
    install -m 644 "${service}"   "${ROOTFS_DIR}/etc/systemd/system/${service}"
    on_chroot << EOF
systemctl enable "${service}"
EOF
done

# Replace /home/citadel with home/$FIRST_USER_NAME in other scripts
sed -i -e "s/\/home\/citadel/\/home\/${FIRST_USER_NAME}/g" "/citadel/scripts/citadel-os/citadel-details"

# Copy Citadel to image
mkdir "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/citadel"
rsync --quiet --archive --partial --hard-links --sparse --xattrs /citadel "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"

# Fix permissions
on_chroot << EOF
chown -R ${FIRST_USER_NAME}:${FIRST_USER_NAME} /home/${FIRST_USER_NAME}/citadel/
EOF

echo "Pulling docker images..."
echo
cd /citadel
IMAGES=$(grep '^\s*image' docker-compose.yml | sed 's/image://' | sed 's/\"//g' | sed '/^$/d;s/[[:blank:]]//g' | sort | uniq)
echo
echo "Images to bundle: $IMAGES"
echo

while IFS= read -r image; do
    docker pull --platform=linux/arm64 $image
done <<< "$IMAGES"

# Copy the entire /var/lib/docker directory to image
mkdir -p ${ROOTFS_DIR}/var/lib/docker
rsync --quiet --archive --partial --hard-links --sparse --xattrs /var/lib/docker ${ROOTFS_DIR}/var/lib/
