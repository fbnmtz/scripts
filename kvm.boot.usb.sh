#!/bin/bash

if [ -z "$1" ]; then
	echo "no disk informed. usage:"
	echo "./kvm.boot.usb.sh /path/to/usbdisk-for-boot"
else
	sudo qemu-system-x86_64 -usb -usbdevice disk:$1  -boot menu=on  -m 512
fi

# sudo qemu-system-x86_64 -usb -usbdevice disk:$1 -hda ~/devel/kvm-vms/local.vhd.img -boot menu=on  -m 512
#s qemu-system-x86_64 -hda ~/devel/windows7-vhd.img -boot menu=on  -m 512
