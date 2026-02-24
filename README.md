# xfce-aero-vista

WIP

## Highlights

WIP

- Has `bootc` autoupdates enabled (runs and checks once a day)
- Uses `compiz` as window manager and compositor

## How to install

1. Download Fedora Vauxite ISO from [this URL](https://github.com/winblues/vauxite) and install it regularly
2. When you boot to Vauxite, run this command below to switch to `xfce-aero-vista` (requires internet connection):
  - `sudo bootc switch ghcr.io/fiftydinar/xfce-aero-vista:latest`
3. Reboot the system
4. Boot the Arch entry
5. 1st boot will fail with blinking line in top-left, but 2nd one will be successful (rebase workaround which only applies on 2nd boot)
6. Install the container signatures required for signed image of `xfce-aero-vista` (requires internet connection):
  - `sudo bootc switch --enforce-container-sigpolicy ghcr.io/fiftydinar/xfce-aero-vista:latest`
7. Reboot the system
8. Enjoy!

## Caveats

This image is based on the experimental work of [arch-bootc](https://github.com/bootcrew/arch-bootc) base image, which I had to [fork](https://github.com/fiftydinar/arch-bootc) to fix some issues.  
So based on the above information, it is expected that some things are not good or ready.

1. GRUB bootloader cannot be updated
  - It will stay on the same version basically forever, because [bootupd](https://github.com/coreos/bootupd) only works on Fedora and CoreOS based distributions.
2. Installing or using other bootloader is unsupported
  - For the same reason as 1.
3. Using different initramfs other than `dracut` is unsupported
  - Using `mkinitcpio` and others might work with some modifications, but upstream primarily uses `dracut`, which is also used here
4. Secure boot doesn't work and is unsupported
  - For the same reason as 1 + unsigned kernel by default
