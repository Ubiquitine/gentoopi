gentoopi
========

<dl>
<dt> What you have installed: </dt>
</dl>
* Latest stable stage3
* LXDE - lightweight and fast desktop
* Midori web browser
* Ayttm IM client (Jabber only)*
* Sylpheed email client
* Chromium browser installation script**
* Openldap
* Pam_mount module - you can mount your home via samba***
* Midnight Commander
* Gentoolkit, eix and Layman.
* Git
* Tmux 
* Htop
* rpi-update - script for firmware upgrade

-----------------------------
*if you want Ayttm to support more protocols - add coresponding USE flags to /etc/portage/package.use

**Just run chrome-install and after that rename chrome.desktop.keep file to chrome.desktop in /usr/share/applications

***You will need to configure pam_mount by yourself

<dl>
<dt> Info: </dt>
</dl>

Default user and password are both 'pi'.

Root doesn't have password, so set ASAP.

</dl>

<dl>
<dt>For installation: 
</dl>
1. Create at least 2 partition on you SD card - one for boot (*FAT32*) and second for root.
   
	1.1 You will need at least 4Gb SD card.
 
	1.2 I recommend to format root partition to *ReiserFS* in order to prevent a lack of free inodes (iy you are planing to install portage).

2. Copy the content of root-fs folder into you root partition. 

	2.1 After that, copy permissions.bk file to the root file system of yout SD card.

	2.2 cd where your SD card root is mounted and executeas root: "# setfacl --restore=permissions.bk" .

	2.3 Also, restore the sticky bit for some important files like /(s)bin/su  /(s)bin/(un)mount /usr/bin/pkexec ...

3. Copy  kernel.img and the raspberry firmware to your boot partition.

4. (Optionaly) You can compile your own kernel using the instruction from this wiki:   http://wiki.gentoo.org/wiki/Raspberry_Pi

5. If you are planning to compile some heavy stuff you may want to use external storage for /var/tmp/portage and use swap-file

	5.1 Create swap file any size you desire and name it "swapfile".

	5.2 Create filesystem image (you can use any filesystem you want) and name it "temp".

	5.3 Put those two files in to the root of your external storage (USB-flash or external harddrive).

	5.5 Conect external storage to you Raspberry Pi and execute "mount -a" and "swapon -a" as root.
