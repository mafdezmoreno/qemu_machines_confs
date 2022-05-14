qemu-system-aarch64 \
    -accel hvf \
    -m 2048 \
    -cpu cortex-a72 -M virt,highmem=off  \
    -drive file=/opt/homebrew/Cellar/qemu/6.2.0_1/share/qemu/edk2-aarch64-code.fd,if=pflash,format=raw,readonly=on \
    -drive file=ovmf_vars.fd,if=pflash,format=raw \
    -serial telnet::4444,server,nowait \
    -drive if=none,file=ubuntu2004.qcow2,format=qcow2,id=hd0 \
    -device virtio-blk-device,drive=hd0,serial="dummyserial" \
    -device virtio-net-device,netdev=net0 \
    -netdev user,id=net0 \
    -device virtio-gpu-pci\
    -device ramfb \
    -device usb-ehci -device usb-kbd\
    -device usb-tablet\
    -usb \
    -monitor stdio


    ##Not nedded
    #-device virtio-keyboard-pci\
    #-device virtio-tablet-pci\
    #-device ramfb \
    #-device usb-ehci -device usb-kbd\
    #-device usb-tablet\

    ## Commnads Not working:
    # -device qxl-vga\ #Nor valir aarch64
    # -vga virtio\ or -vga qxl #arch64: Virtio VGA not available
    #-device VGA,vgamem_mb=32\ #NOT WORKING
    #-device VGA,vgamem_mb=64\ #Makes qemu close
    # -device bochs-display\
    
    ## WORKING PARTIALLY
    #-vga std\ #only 800X600 resolution
    #-vga cirrus\ #only 800X600 resolution (FAST)
    # It can be increased in bios 

    # -device virtio-gpu-pci\ #allows more resolutions options but the cursor don't appear
    ## To resolve the problen whit the mouse pointer:
    # https://superuser.com/questions/1546702/qemu-no-visible-cursor-when-using-qxl-or-virtio


    ## ONLY FOR INSTALLATION
    #-cdrom focal-desktop-arm64.iso \

    # Add reference:
    # https://qemu-project.gitlab.io/qemu/system/qemu-manpage.html?highlight=vga%20std
    # https://wiki.qemu.org/Documentation/Platforms/ARM