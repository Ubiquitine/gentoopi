��    >        S   �      H  )   I      s  #   �  -   �  *   �  +     =   =  )   {  ;   �  :   �          3      M     n  $   �     �     �  (   �          -     ?     ^     x     �  '   �  &   �  $   �     	      4	  #   U	  )   y	  ,   �	  0   �	  /   
     1
      P
  !   q
      �
  #   �
     �
  4   �
  -   %  4   S  4   �  $   �  +   �  ,        ;  "   S     v  *   �     �     �     �  �  
  �      �   �  5   v     �     �     �  d  �  '   P      x      �  0   �  $   �  -     M   >  -   �  M   �  K        T     k     �     �  "   �     �     �  %        <     S     e     �     �     �  #   �  #   �  .        @     Z     x  1   �  5   �  8   �  /   7     g  !   �  #   �     �     �       4     2   R  2   �  2   �  $   �  &     )   7     a  $   v     �  &   �     �     �           �   ,  �     8   �     �  !   �           ,   )                '      =           8   "   (                     -      9      :   2                      5       
       ;   %      1                  #   *                 6       	   >   /      4      7       3       !             +       &   $                          .       0      <       %s: CD-ROM auto-eject command failed: %s
 %s: CD-ROM eject command failed
 %s: CD-ROM eject command succeeded
 %s: CD-ROM load from slot command failed: %s
 %s: CD-ROM select disc command failed: %s
 %s: CD-ROM select speed command failed: %s
 %s: CD-ROM select speed command not supported by this kernel
 %s: CD-ROM tray close command failed: %s
 %s: CD-ROM tray close command not supported by this kernel
 %s: IDE/ATAPI CD-ROM changer not supported by this kernel
 %s: SCSI eject failed
 %s: SCSI eject succeeded
 %s: `%s' can be mounted at `%s'
 %s: `%s' is a link to `%s'
 %s: `%s' is a multipartition device
 %s: `%s' is mounted at `%s'
 %s: `%s' is not a mount point
 %s: `%s' is not a multipartition device
 %s: `%s' is not mounted
 %s: closing tray
 %s: could not allocate memory
 %s: default device: `%s'
 %s: device is `%s'
 %s: device name is `%s'
 %s: disabling auto-eject mode for `%s'
 %s: enabling auto-eject mode for `%s'
 %s: exiting due to -n/--noop option
 %s: expanded name is `%s'
 %s: floppy eject command failed
 %s: floppy eject command succeeded
 %s: invalid argument to --auto/-a option
 %s: invalid argument to --cdspeed/-x option
 %s: invalid argument to --changerslot/-c option
 %s: maximum symbolic link depth exceeded: `%s'
 %s: selecting CD-ROM disc #%d
 %s: setting CD-ROM speed to %dX
 %s: setting CD-ROM speed to auto
 %s: tape offline command failed
 %s: tape offline command succeeded
 %s: too many arguments
 %s: trying to eject `%s' using CD-ROM eject command
 %s: trying to eject `%s' using SCSI commands
 %s: trying to eject `%s' using floppy eject command
 %s: trying to eject `%s' using tape offline command
 %s: unable to eject, last error: %s
 %s: unable to exec /bin/umount of `%s': %s
 %s: unable to find or open device for: `%s'
 %s: unable to fork: %s
 %s: unable to open /etc/fstab: %s
 %s: unable to open `%s'
 %s: unmount of `%s' did not exit normally
 %s: unmount of `%s' failed
 %s: unmounting `%s'
 %s: using default device `%s'
 Eject version %s by Jeff Tranter (tranter@pobox.com)
Usage:
  eject -h				-- display command usage and exit
  eject -V				-- display program version and exit
  eject [-vnrsfq] [<name>]		-- eject device
  eject [-vn] -d			-- display default device
  eject [-vn] -a on|off|1|0 [<name>]	-- turn auto-eject feature on or off
  eject [-vn] -c <slot> [<name>]	-- switch discs on a CD-ROM changer
  eject [-vn] -t [<name>]		-- close tray
  eject [-vn] -x <speed> [<name>]	-- set CD-ROM max speed
Options:
  -v	-- enable verbose output
  -n	-- don't eject, just show device found
  -r	-- eject CD-ROM
  -s	-- eject SCSI device
  -f	-- eject floppy
  -q	-- eject tape
  -p	-- use /proc/mounts instead of /etc/mtab
  -m	-- do not unmount device even if it is mounted
 Long options:
  -h --help   -v --verbose	 -d --default
  -a --auto   -c --changerslot  -t --trayclose  -x --cdspeed
  -r --cdrom  -s --scsi	 -f --floppy
  -q --tape   -n --noop	 -V --version
  -p --proc   -m --no-unmount
 Parameter <name> can be a device file or a mount point.
If omitted, name defaults to `%s'.
By default tries -r, -s, -f, and -q in order until success.
 eject version %s by Jeff Tranter (tranter@pobox.com)
 unable to open %s: %s
 usage: volname [<device-file>]
 volname Project-Id-Version: eject 2.1.2
POT-Creation-Date: 2005-08-24 00:00+0200
PO-Revision-Date: 2005-09-22 11:40+0800
Last-Translator: Wei-Lun Chao <chaoweilun@pcmail.com.tw>
Language-Team: Chinese (traditional) <zh-l10n@linux.org.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
 %s: 光碟自動跳出命令失敗: %s
 %s: 光碟片跳出指令失敗
 %s: 光碟片跳出指令成功
 %s: 從光碟櫃載入光碟的命令失敗: %s
 %s: 選擇光碟的命令失敗: %s
 %s: 光碟機速度選擇的命令失敗: %s
 %s: 光碟機速度選擇的命令並不被本作業系統的核心所支援
 %s: 光碟機拖盤關閉的命令失敗: %s
 %s: 光碟機拖盤關閉的命令並不被本作業系統的核心所支援
 %s: IDE/ATAPI 介面的光碟櫃並不被本作業系統的核心所支援
 %s: SCSI 跳出失敗
 %s: SCSI 跳出成功
 %s: '%s' 可掛載於 '%s'
 %s: '%s' 被連結到 '%s'
 %s: `%s' 是多重分割區裝置
 %s: '%s' 被掛載到 '%s'
 %s: '%s' 並不是掛載點
 %s: `%s' 不是多重分割區裝置
 %s: '%s' 並未掛載
 %s: 關閉拖盤
 %s: 無法指派記憶體
 %s: 內定裝置為: '%s'
 %s: 裝置是 '%s'
 %s: 裝置名稱為 '%s'
 %s: 關閉 '%s' 自動跳出模式
 %s: 開啟 '%s' 自動跳出模式
 %s: 由於 -n/--noop 選項的因素而跳出
 %s: 擴展名稱為 '%s'
 %s: 軟碟跳出命令失敗
 %s: 軟碟跳出命令成功
 %s: 對於 --auto/-a 選項而言是無效引數
 %s: 對於 ---cdspeed/-x 選項而言是無效引數
 %s: 對於 --changerslot/-c 選項而言是無效引數
 %s: 超過符號連結的最大深度值: '%s'
 %s: 選擇光碟片編號 #%d
 %s: 設定光碟機速度為 %dX
 %s: 設定光碟機速度為自動
 %s: 磁帶離線命令失敗
 %s: 磁帶離線命令成功
 %s: 太多引數了
 %s: 嘗試使用 CD-ROM 跳出指令將 '%s' 跳出
 %s: 嘗試使用 SCSI 跳出指令將 '%s' 跳出
 %s: 嘗試使用軟碟跳出指令將 '%s' 跳出
 %s: 嘗試使用磁帶離線指令將 '%s' 跳出
 %s: 無法跳出，錯誤碼為: %s
 %s: 無法執行 /bin/umount '%s': %s
 %s: 找不到或無法開啟裝置: '%s'
 %s: 無法 fork: %s
 %s: 無法開啟 /etc/fstab 檔: %s
 %s: 無法開啟 '%s'
 %s: 卸載 '%s' 發生不正常結束
 %s: 卸載 '%s' 失敗
 %s: 卸載 '%s'
 %s: 使用內定裝置 '%s'
 Eject 版本 %s 作者 Jeff Tranter (tranter@pobox.com)
用法:
  eject -h				-- 顯示命令用法後結束
  eject -V				-- 顯示程式版本後結束
  eject [-vnrsfq] [<名稱>]		-- 跳出裝置
  eject [-vn] -d			-- 顯示內定裝置名稱
  eject [-vn] -a on|off|1|0 [<名稱>]	-- 自動跳出功能開關
  eject [-vn] -c <插槽> [<名稱>]	-- 切換光碟櫃內的光碟片
  eject [-vn] -t [<名稱>]		-- 關閉拖盤
  eject [-vn] -x <速度> [<名稱>]	-- 設定光碟機最快速度
選項:
  -v	-- 顯示詳細狀態
  -n	-- 不要跳出，只顯示裝置有找到即可
  -r	-- 跳出 CD-ROM
  -s	-- 跳出 SCSI 裝置
  -f	-- 跳出軟碟片
  -q	-- 跳出磁帶
  -p	-- 使用 /proc/mounts 來取代 /etc/mtab
  -m	-- 即使裝置已掛載也不要卸載裝置
 長選項:
  -h --help   -v --verbose	 -d --default
  -a --auto   -c --changerslot  -t --trayclose  -x --cdspeed
  -r --cdrom  -s --scsi	 -f --floppy
  -q --tape   -n --noop	 -V --version
  -p --proc   -m --no-unmount
 參數 <name> 可以是裝置檔名或者掛載點。
不加參數時，內定為 `%s'。
程式預設會依序測試 -r, -s, -f, 和 -q 直到成功。
 eject 版本 %s 作者 Jeff Tranter <tranter@pobox.com>
 無法開啟 %s: %s
 用法: volname [<裝置檔名>]
 volname 