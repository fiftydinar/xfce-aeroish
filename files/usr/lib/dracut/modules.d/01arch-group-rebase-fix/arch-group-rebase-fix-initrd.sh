#!/bin/sh

NEWROOT="${NEWROOT:-/sysroot}"

# Only run if the stamp file doesn't exist and /etc/group exists on the real root
[ -f "${NEWROOT}/etc/arch-group-rebase-fix.stamp" ] && exit 0
[ -f "${NEWROOT}/etc/group" ] || exit 0

GROUPS_TO_REMOVE=$(grep -h "^g " "${NEWROOT}"/usr/lib/sysusers.d/*.conf 2>/dev/null | \
    sed -e 's/^g  *//' -e 's/  *.*//' | \
    grep -v -e "wheel" -e "root" -e "sudo" | \
    tr '\n' '|' | sed 's/||*/|/g; s/|$//; s/^|//')

[ -n "${GROUPS_TO_REMOVE}" ] || exit 0

for target_file in "${NEWROOT}/etc/group" "${NEWROOT}/etc/gshadow"; do
    [ -f "$target_file" ] || continue
    sed -E "/^(${GROUPS_TO_REMOVE}):/d" "${target_file}" > "${target_file}.tmp"
    mv "${target_file}.tmp" "${target_file}"
    chown root:root "${target_file}"
    if echo "$target_file" | grep -q "gshadow"; then
        chmod 0000 "${target_file}"
    else
        chmod 644 "${target_file}"
    fi
done

touch "${NEWROOT}/etc/arch-group-rebase-fix.stamp"
sync
