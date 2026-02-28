#!/bin/sh

set -eu

stamp_file="/var/lib/remove-fstab-root.stamp"
root_UUID=$(sed -n 's/.*root=UUID=\([^[:space:]]\{36\}\).*/UUID=\1/p' /proc/cmdline)

if [ -n "$root_UUID" ] && grep -E -q "^$root_UUID[[:space:]]/[[:space:]]" /etc/fstab && findmnt / | grep -q composefs && [ ! -L /boot/grub2/grub.cfg ]; then
    tmp=$(mktemp /tmp/fstab.XXXXXX) || exit 1

    awk -v uuid="$root_UUID" '
    BEGIN { OFS = "\t" }
    $1 == uuid && $2 == "/" {
        opts = $4
        # if "ro" already present, leave line as-is
        if (opts ~ /(^|,)ro(,|$)/) {
            print
            next
        }
        # replace rw occurrences with ro (handles several positions)
        if (opts ~ /(^rw,|,rw,|,rw$|^rw$)/) {
            sub(/^rw,/, "ro,", opts)
            sub(/,rw,/, ",ro,", opts)
            sub(/,rw$/, ",ro", opts)
            sub(/^rw$/, "ro", opts)
        } else {
            if (opts == "") {
                opts = "ro"
            } else {
                opts = opts "," "ro"
            }
        }
        $4 = opts
        print
        next
    }
    { print }
    ' /etc/fstab > "$tmp"

    mv "$tmp" /etc/fstab
    rm -f "$tmp"
    touch "$stamp_file"
else
    exit 0
fi
