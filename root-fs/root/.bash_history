rm -rf /var/tmp/portage/**
lsblk
mount /dev/sda1 /mnt/
mount -o lop /mnt/bigfile /var/tmp/portage/
mount -o loop /mnt/bigfile /var/tmp/portage/
mount -o loop -t ext4 /mnt/bigfile /var/tmp/portage/
mount -o loop -t reiserfs /mnt/bigfile /var/tmp/portage/
mount  -t reiserfs /mnt/bigfile /var/tmp/portage/
mount  -t auto /mnt/bigfile /var/tmp/portage/
mount  /mnt/bigfile /var/tmp/portage/
mount  /mnt/temp /var/tmp/portage/
df
emerge -C gajim
emerge setxkbmap
openbox set background image
openbox set background image
emerge setxkbmap
halt
nano /etc/X11/xinit/xinitrc.d/90-setxkbmap
chmod + x /etc/X11/xinit/xinitrc.d/90-setxkbmap
chmod +x /etc/X11/xinit/xinitrc.d/90-setxkbmap
top
emerge syslog-ng
rc-update add syslog-ng boot
rc-update add dbus default
rc-update add consolekit default
rc-update add xdm default
nano /etc/fstab 
