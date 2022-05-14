#References
#https://github.com/dhruvvyas90/qemu-rpi-kernel
#https://blog.agchapman.com/using-qemu-to-emulate-a-raspberry-pi/amp/

#Downloads from https://github.com/dhruvvyas90/qemu-rpi-kernel:

# 2020-05-27-raspios-buster-lite-armhf.img
# kernel-qemu-4.19.50-buster
# versatile-pb-buster.dtb

# Disk

# qemu-img convert -f raw -O qcow2 2020-05-27-raspios-buster-lite-armhf.img raspbian.qcow
# qemu-img resize raspbian.qcow +6G



qemu-system-arm \
  -M versatilepb \
  -cpu arm1176 \
  -m 256 \
  -hda raspbian.qcow \
  -net user,hostfwd=tcp::5022-:22 \
  -dtb versatile-pb-buster.dtb \
  -kernel kernel-qemu-4.19.50-buster \
  -append 'root=/dev/sda2 panic=1' \
  -no-reboot