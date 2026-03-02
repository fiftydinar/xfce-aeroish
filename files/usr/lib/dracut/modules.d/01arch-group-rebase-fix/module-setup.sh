#!/bin/bash

check() {
    return 0
}

depends() {
    return 0
}

install() {
    inst_multiple grep sed tr chmod chown touch sync
    inst_simple "$moddir/arch-group-rebase-fix-initrd.sh" /lib/dracut/hooks/pre-pivot/01-arch-group-rebase-fix.sh
}
