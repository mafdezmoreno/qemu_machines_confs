qemu-system-arm \
  -m 4G \
  -machine type=virt \
  -cpu cortex-a7 \
  -smp 4 \
  -initrd "./initrd.gz" \
  -kernel "./vmlinuz" \
  -append "console=ttyAMA0" \
  -drive file="./debian-11.3.0-armhf-DVD-1.iso",id=cdrom,if=none,media=cdrom \
    -device virtio-scsi-device \
    -device scsi-cd,drive=cdrom \
  -drive file="./debian-arm.sda.qcow2",id=hd,if=none,media=disk \
    -device virtio-scsi-device \
    -device scsi-hd,drive=hd \
  -netdev user,id=net0,hostfwd=tcp::5555-:22 \
    -device virtio-net-device,netdev=net0 \
  -nographic

