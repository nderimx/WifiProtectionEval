# Intermidiary Gateway in Public Networks Evaluation

Documentation and the Configuration of the project: Intermidiary Gateway in Public Networks Evaluation, which describes how to reproduce the steps of setting up the same network environment, and conduct the same security tests.

## Defense Setup

### Physical Gateway Setup

#### Devices:
1. Raspberry Pi (in our case PI2)
2. Supported USB Wifi Adapter (our case Ralink chipset) (realtek is NOT recommended)
3. micro SD card
4. Router with internet access (and permission to hack it)
5. Ethernet Cable
6. Attack Computer (with wifi)

#### (Ethernet<-o->Wifi) Steps to reproduce:

1. Download *[openwrt image](https://archive.openwrt.org/releases/22.03.5/targets/bcm27xx/)* (for your raspberry pi model)
2. Install *[Raspberry Pi Images](https://www.raspberrypi.com/software/)*
3. Flash the SD card with the openwrt image using raspberry pi imager
4. Connect the powered up raspberrypi to your computer via ethernet (insert sd card into the raspberry pi beforehand)
5. `ssh root@192.168.1.1`
6. `passwd` and type in the new password
7. Add the *[initial network configurations]()* to the /etc/config/network file
8. Edit /etc/config/firewall to change `option input 'REJECT'` to `option input 'ACCEPT'`, which is located below `option name 'wan'`
9. Connect the raspberry pi to the public router through ethernet
10. Get the new ip address with `nmap -sn [x.x.x.x/xx] | grep -B2 raspberry`
11. ssh into the new ip address
12. `opkg update`
13. `opkg install kmod-rt2800-lib kmod-rt2800-usb kmod-rt2x00-lib kmod-rt2x00-usb kmod-usb-core kmod-usb-uhci kmod-usb-ohci kmod-usb2 usbutils openvpn-openssl luci-app-openvpn` to install drivers and other dependencies` (these drivers are specific to ralink)
14. Apply the *[final network configuration]()*
15. Apply the *[wireless configuration]()* located in /etc/config/wireless (if the file doesn't exist, create it)
16. `service network restart`
17. `uci commit wireless`
18. `wifi`
19. Insert the USB Wifi Adapter

![Public Network](illustrations/public_network.png "Public Network")

### *[Steps](https://openwrt.org/docs/guide-user/virtualization/virtualbox-vm)* to reproduce Virtual Router Setup:
1. Download *[openwrt image](https://archive.openwrt.org/releases/22.03.5/targets/x86/64/openwrt-22.03.5-x86-64-generic-ext4-combined.img.gz)* (for your machine's architecture)
2. `gzip -d openwrt-*.img.gz`
3. `VBoxManage convertfromraw --format VDI openwrt-*.img openwrt.vdi`
4. `VBoxManage modifymedium openwrt.vdi --resize 128`

![Virtual Network](illustrations/virtual_environment.png "Virtual Environmnent")

### VPN Setup:
- <https://protonvpn.com/support/how-to-set-up-protonvpn-on-openwrt-routers/>

### Eliminate *[DNS](https://dnsleaktest.com/)* and *[WebRTC](https://ipleak.net/)* leaks:
- 

### *[Firewall Setup](https://openwrt.org/docs/guide-user/firewall/firewall_configuration)*:
- 

## Attack Setup

### Attack Machine

#### Attack Tools


## Security Testing

### Testing and Data Gathering

## Evaluation Methodologies


#### Commands Cheatsheet
- `lsusb`
- `dmesg`
- `cat /sys/kernel/debug/usb/devices`
- `opkg update`
- `opkg install <package>`
- `service network restart`
- `uci show network`
- `uci commit wireless`
- `wifi`