#!/bin/sh

set -eu

stamp_file="/var/lib/remove-fstab-root.stamp"
root_UUID=$(sed -n 's/.*root=UUID=\([^[:space:]]\{36\}\).*/UUID=\1/p' /proc/cmdline)

if [ -n "$root_UUID" ] && grep -E -q "^$root_UUID[[:space:]]/[[:space:]]" /etc/fstab && findmnt / | grep -q composefs && [ ! -L /boot/grub2/grub.cfg ]; then
    tmp=$(mktemp /tmp/fstab.XXXXXX) || exit 1
    sed '/^'"$root_UUID"'[[:space:]]\/[[:space:]]/d' /etc/fstab > "$tmp"
    mv "$tmp" /etc/fstab
    rm -f "$tmp"
    touch "$stamp_file"
else
    exit 0
fi
