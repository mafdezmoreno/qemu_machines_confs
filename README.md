# Some Tested QEMU VM on M1

These configurations were tested using the 6.2.0_1 QEMU version.
Whit the actual version it's not needed to apply the Alexander Graf patch: https://lore.kernel.org/qemu-devel/20210120224444.71840-1-agraf@csgraf.de/

## Requirements

### Install QEMU

'''
brew install qemu

'''

## Ubuntu 20.04 ARM

2. Download an ARM Ubuntu version

'''
wget https://cdimage.ubuntu.com/focal/daily-live/current/focal-desktop-arm64.iso
'''

3. Create the hard disk

'''
qemu-img create -f qcow2 ubuntu2004.qcow2 15G
'''

4. Create an empty file for persisting UEFI variables:

'''
dd if=/dev/zero conv=sync bs=1m count=64 of=ovmf_vars.fd
'''

5. Run the virtual machine giving execution permision to the installation script:

'''
chmod +x run_ubuntu_install.sh
./run_ubuntu_install.sh
'''

6. After the ubuntu installation, the cdrom line of the sh script can be removed.

7. In the next executions, use the "run_ubuntu.sh" sript.

### References:
https://gist.github.com/citruz/9896cd6fb63288ac95f81716756cb9aa

## Debian 11 ARM

1. Download the required files:
    - Debian iso file
    - The latest armhf vmlinux kernel and initrd.gz initramfs from Debian.

'''
wget http://ftp.us.debian.org/debian/dists/stable/main/installer-armhf/current/images/cdrom/initrd.gz

wget http://ftp.us.debian.org/debian/dists/stable/main/installer-armhf/current/

wget https://cdimage.debian.org/debian-cd/current/armhf/iso-dvd/debian-11.3.0-armhf-DVD-1.iso
'''

2. Create a disk for the Arm QEMU emulator image.


'''
qemu-img create -f qcow2 debian-arm.sda.qcow2 20G
'''

3. Give exection permision to the installation sript and run the VM to install debian

''''
chomd +x run_debian_install.sh
./run_debian_install.sh
'''

4. After the installation procces, the cdrom line of the sh script can be removed.

5. In the next executions use the "run_debian.sh". This script now uses:
    - The new installed kernel
    - The initramfs instalados
    - "-append" contents "root=/dev/sda2" to allow the booting from the previusly created virtual drive

### References:

https://gist.github.com/citruz/9896cd6fb63288ac95f81716756cb9aa
https://willhaley.com/blog/debian-arm-qemu/


