��    G      T  a   �        )         ;  #   \  -   �  *   �  +   �  =     )   C  ;   m  <   �      �  :        B     Y      s     �  $   �     �     �  (   	     :	     S	     e	     �	     �	     �	  '   �	  &   �	  $   
     ?
  $   ^
     �
      �
  #   �
  )   �
  ,     0   :     k  /   �     �      �  !   �        #   8     \     o  ?   �  4   �  -   �  4   *  4   _  $   �  &   �  ,   �       "   %     H  ;   a  *   �     �     �  %   �       \  >    �  �   �  5   D     z     �     �  -  �  9   �  *   !  )   L  7   v  2   �  4   �  O     @   f  \   �  e     '   j  U   �  -   �  ,     &   C  "   j  $   �      �  '   �  +   �  !   '  "   I  "   l     �     �     �  :   �  :        K     h  1   }     �  *   �  )   �  3      6   T  :   �  "   �  <   �      &  *   G  /   r  *   �  )   �  ,   �     $  K   =  2   �  .   �  2   �  2     1   Q  $   �  2   �      �      �        2   4   0   g   ,   �      �   .   �   ,   
!  �  7!    *%  �   ?&  2   '     P'  '   e'     �'        %   !   /       +      9       2       A          ;   	         D   6           7              -   B   5   3       *   F          4                              >   '            $             :   ,         1      E                     @              .       <   #         (       ?   "       C       G      0       =   &          8   
       )           %s: CD-ROM auto-eject command failed: %s
 %s: CD-ROM eject command failed
 %s: CD-ROM eject command succeeded
 %s: CD-ROM load from slot command failed: %s
 %s: CD-ROM select disc command failed: %s
 %s: CD-ROM select speed command failed: %s
 %s: CD-ROM select speed command not supported by this kernel
 %s: CD-ROM tray close command failed: %s
 %s: CD-ROM tray close command not supported by this kernel
 %s: CD-ROM tray toggle command not supported by this kernel
 %s: FindDevice called too often
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
 %s: error while finding CD-ROM name
 %s: error while reading speed
 %s: exiting due to -n/--noop option
 %s: expanded name is `%s'
 %s: floppy eject command failed
 %s: floppy eject command succeeded
 %s: invalid argument to --auto/-a option
 %s: invalid argument to --cdspeed/-x option
 %s: invalid argument to --changerslot/-c option
 %s: listing CD-ROM speed
 %s: maximum symbolic link depth exceeded: `%s'
 %s: selecting CD-ROM disc #%d
 %s: setting CD-ROM speed to %dX
 %s: setting CD-ROM speed to auto
 %s: tape offline command failed
 %s: tape offline command succeeded
 %s: toggling tray
 %s: too many arguments
 %s: tried to use `%s' as device name but it is no block device
 %s: trying to eject `%s' using CD-ROM eject command
 %s: trying to eject `%s' using SCSI commands
 %s: trying to eject `%s' using floppy eject command
 %s: trying to eject `%s' using tape offline command
 %s: unable to eject, last error: %s
 %s: unable to exec umount of `%s': %s
 %s: unable to find or open device for: `%s'
 %s: unable to fork: %s
 %s: unable to open /etc/fstab: %s
 %s: unable to open `%s'
 %s: unable to read the speed from /proc/sys/dev/cdrom/info
 %s: unmount of `%s' did not exit normally
 %s: unmount of `%s' failed
 %s: unmounting `%s'
 %s: unmounting device `%s' from `%s'
 %s: using default device `%s'
 Eject version %s by Jeff Tranter (tranter@pobox.com)
Usage:
  eject -h				-- display command usage and exit
  eject -V				-- display program version and exit
  eject [-vnrsfqpm] [<name>]		-- eject device
  eject [-vn] -d			-- display default device
  eject [-vn] -a on|off|1|0 [<name>]	-- turn auto-eject feature on or off
  eject [-vn] -c <slot> [<name>]	-- switch discs on a CD-ROM changer
  eject [-vn] -t [<name>]		-- close tray
  eject [-vn] -T [<name>]		-- toggle tray
  eject [-vn] -x <speed> [<name>]	-- set CD-ROM max speed
  eject [-vn] -X [<name>]		-- list CD-ROM available speeds
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
  -h --help   -v --verbose      -d --default
  -a --auto   -c --changerslot  -t --trayclose  -x --cdspeed
  -r --cdrom  -s --scsi         -f --floppy     -X --listspeed     -q --tape
  -n --noop   -V --version
  -p --proc   -m --no-unmount   -T --traytoggle
 Parameter <name> can be a device file or a mount point.
If omitted, name defaults to `%s'.
By default tries -r, -s, -f, and -q in order until success.
 eject version %s by Jeff Tranter (tranter@pobox.com)
 unable to open %s: %s
 usage: volname [<device-file>]
 volname Project-Id-Version: eject 2.1.4
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2006-04-09 20:13+0300
PO-Revision-Date: 2005-11-19 24:30+0000
Last-Translator: Bahadır Kandemir <bahadir@pardus.org.tr>
Language-Team: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 %s: CD-ROM otomatik çıkar komutu başarısız oldu: %s
 %s: CD-ROM eject komutu başarısız oldu
 %s: CD-ROM eject komutu başarılı oldu
 %s: CD-ROM slottan yükle komutu başarısız oldu: %s
 %s: CD-ROM disk seç komutu başarısız oldu: %s
 %s: CD-ROM hızı seç komutu başarısız oldu: %s
 %s: CD-ROM hızu seç komutu bu çekirdek (kernel) tarafından desteklenmiyor.
 %s: CD-ROM görev çubuğunu kapat komutu başarısız oldu: %s
 %s: CD-ROM görev çubuğunu kapat komutu bu çekirdek (kernel) tarafından desteklenmiyor.
 %s: CD-ROM görev çubuğu durum değiştir komutu bu çekirdek (kernel) tarafından desteklenmiyor.
 %s: FindDevice çok fazla kullanıldı
 %s: IDE/ATAPI CD-ROM değiştirici bu çekirdek (kernel) tarafından desteklenmiyor.
 %s: SCSI çıkarma işlemi başarısız oldu
 %s: SCSI çıkarma işlemi başarılı oldu
 %s: `%s', `%s' adresine bağlanabilir
 %s: `%s', `%s' aygıtına bağlı
 %s: `%s' çok bölümlü bir aygıt
 %s: `%s', `%s' adresine bağlı
 %s: `%s' bir bağlanma noktası değil
 %s: `%s' çok bölümlü bir aygıt değil
 %s: `%s' aygıtı bağlı değil
 %s: görev çubuğu kapatılıyor
 %s: bellek konumlandırılamadı.
 %s: öntanımlı aygıt: `%s'
 %s: aygıt `%s'
 %s: aygıt ismi `%s'
 %s: `%s' için otomatik çıkarma modu pasifleştiriliyor
 %s: `%s' için otomatik çıkarma modu aktifleştiriliyor
 %s: CD-ROM ismi bulunamadı
 %s: hız okunamadı
 %s: -n/--noop seçeneği sebebiyle çıkılıyor
 %s: ayrıntılı isim `%s'
 %s: floppy eject komutu başarısız oldu
 %s: floppy eject komutu başarılı oldu
 %s: --auto/-a seçeneği için geçersiz argüman.
 %s: --cdspeed/-x seçeneği için geçersiz argüman.
 %s: --changerslot/-c seçeneği için geçersiz argüman.
 %s: CD-ROM hızları listeleniyor
 %s: maksimum sembolik bağlantı derinliği aşıldı: `%s'
 %s: CD-ROM diski seçiliyor #%d
 %s: CD-ROM hızı %dX olarak ayarlanıyor
 %s: CD-ROM hızı otomatik olarak ayarlanıyor
 %s: tape offline komutu başarısız oldu
 %s: tape offline komutu başarılı oldu
 %s: görev çubuğu durumu değiştiriliyor
 %s: çok fazla argüman
 %s: aygıt ismi olarak `%s' kullanıldı ancak bu bir blok aygıtı değil
 %s: `%s', CD-ROM eject komutu ile çıkarılıyor
 %s: `%s', SCSI komutları ile çılarılıyor
 %s: `%s', floppy eject komutu ile çıkarılıyor
 %s: `%s', tape offline komutu ile çıkarılıyor
 %s: çıkarma işlemi başarısız, son hata: %s
 %s: `%s' sistemden ayrılamadı: %s
 %s: `%s' aygıtı bulunamadı ya da açılamadı'
 %s: çatallama yapılamadı: %s
 %s: /etc/fstab açılamadı: %s
 %s: `%s' açılamadı
 %s: hız, /proc/sys/dev/cdrom/info'dan okunamadı
 %s: `%s' ayırma işlemi normal sonuçlanmadı.
 %s: `%s' ayırma işlemi başarısız oldu.
 %s: `%s' ayrılıyor
 %s: `%s' aygıtı `%s' adresinden ayrılıyor
 %s: `%s' öntanımlı aygıt kullanılıyor
 Eject sürüm %s Jeff Tranter (tranter@pobox.com)
Kullanım:
  eject -h				-- komut kullanımını göster ve çık
  eject -V				-- program sürümünü göster ve çık
  eject [-vnrsfqpm] [<name>]		-- kaynağı çıkar
  eject [-vn] -d			-- öntanımlı kaynağı göster
  eject [-vn] -a on|off|1|0 [<name>]	-- otomatik çıkar seçeneğini aç ya da kapat
  eject [-vn] -c <slot> [<name>]	-- Bir CD-ROM değiştirici üzerindeki diskleri seç
  eject [-vn] -t [<name>]		-- Görev çubuğunu kapat
  eject [-vn] -T [<name>]		-- Görev çubuğunu durumunu değiştir
  eject [-vn] -x <speed> [<name>]	-- CD-ROM en yüksek hızını ayarla
  eject [-vn] -X [<name>]		-- CD-ROM'un hız seçeneklerini listele
Seçenekler:
  -v	-- Bilgilendirici çıktıyı göster
  -n	-- Çıkarma sadece bulunan aygıtı göster
  -r	-- CD-ROM'u çıkar
  -s	-- SCSI aygıtı çıkar 
  -f	-- Disketi çıkar
  -q	-- Teyp kaseti çıkar
  -p	-- /etc/mtab yerine /proc/mounts kullan
  -m	-- Aygıtı bağlıysa bile ayırma
 Uzun Seçenekler:
  -h --help   -v --verbose      -d --default
  -a --auto   -c --changerslot  -t --trayclose  -x --cdspeed
  -r --cdrom  -s --scsi         -f --floppy     -X --listspeed     -q --tape
  -n --noop   -V --version
  -p --proc   -m --no-unmount   -T --traytoggle
 <name> parametresi bir aygıt dosyası ya da bağlantı noktası olabilir.
Bu parametre boş bırakıldığında öntanımlı olan aygıt `%s' kullanılır.
Başarılı olana kadar -r, -s, -f ve -q parametreleri denenir.
 eject sürüm %s Jeff Tranter (tranter@pobox.com)
 %s açılamadı: %s
 kullanım: volname [<aygıt-dosyası>]
 DiskAdı 