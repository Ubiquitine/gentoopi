��    >        S   �      H  )   I      s  #   �  -   �  *   �  +     =   =  )   {  ;   �  :   �          3      M     n  $   �     �     �  (   �          -     ?     ^     x     �  '   �  &   �  $   �     	      4	  #   U	  )   y	  ,   �	  0   �	  /   
     1
      P
  !   q
      �
  #   �
     �
  4   �
  -   %  4   S  4   �  $   �  +   �  ,        ;  "   S     v  *   �     �     �     �  �  
  �      �   �  5   v     �     �     �    �  :      )   ;  )   e  E   �  /   �  3     @   9  6   z  C   �  5   �  '   +  '   S  (   {     �  (   �     �       +   (     T     p     �      �     �     �  9     6   >  .   u  !   �  *   �  *   �  +     .   H  2   w  @   �     �  (   	  )   2  )   \  )   �     �  J   �  H     K   d  J   �  0   �  +   ,  7   X      �  #   �     �  +   �          7  .   M  u  |  �   �  �   �   L   �!     �!  *   "     1"     ,   )                '      =           8   "   (                     -      9      :   2                      5       
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
 volname Project-Id-Version: eject 2.0.13deb-4
POT-Creation-Date: 2004-05-07 01:11+0200
PO-Revision-Date: 2006-05-29 13:50+0200
Last-Translator: Marek Černocký <marek@manet.cz>
Language-Team: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 %s: příkaz pro automatické vysunutí CD-ROM selhal: %s
 %s: příkaz pro vysunutí CD-ROM selhal
 %s: příkaz pro vysunutí CD-ROM uspěl
 %s: příkaz pro načtení CD-ROM ze zásobníku měniče selhal: %s
 %s: příkaz pro volbu disku CD-ROM selhal: %s
 %s: příkaz pro volbu rychlosti CD-ROM selhal: %s
 %s: toto jádro nepodporuje příkaz pro volbu rychlosti CD-ROM
 %s: příkaz pro zavření dvířek CD-ROM selhal: %s
 %s: toto jádro nepodporuje příkaz pro zavření dvířek CD-ROM
 %s: toto jádro nepodporuje IDE/ATAPI CD-ROM měnič
 %s: příkaz SCSI pro vysunutí selhal
 %s: příkaz SCSI pro vysunutí uspěl
 %s: "%s" může být připojený v "%s"
 %s: "%s" je odkaz na "%s"
 %s: "%s" je zařízení s více oddíly
 %s: "%s" je připojený v "%s"
 %s: "%s" není přípojný bod
 %s: "%s" není zařízení s více oddíly
 %s: "%s" není připojený
 %s: zavírají se dvířka
 %s: nelze přidělit paměť
 %s: výchozí zařízení: "%s"
 %s: zařízení je "%s"
 %s: název zařízení je "%s"
 %s: zakazuje se režim automatického vysunutí pro "%s"
 %s: povoluje režim automatického vysunutí pro "%s"
 %s: ukončuje se na základě volby -n/--noop
 %s: rozšířený název je "%s"
 %s: příkaz pro vysunutí diskety selhal
 %s: příkaz pro vysunutí diskety uspěl
 %s: neplatný argument pro volbu --auto/-a
 %s: neplatný argument pro volbu --cdspeed/-x
 %s: neplatný argument pro volbu --changerslot/-c
 %s: překročena maximální hloubka symbolického odkazu: "%s"
 %s: volí se CD-ROM disk #%d
 %s: nastavuje se rychlost CD-ROM na %dX
 %s: nastavuje se rychlost CD-ROM na auto
 %s: příkaz pro odpojení pásky selhal
 %s: příkaz pro odpojení pásky uspěl
 %s: příliš mnoho argumentů
 %s: zkouší se vysunout "%s" s použitím příkazu pro vysunutí CD-ROM
 %s: zkouší se vysunout "%s" s použitím příkazu SCSI pro vysunutí
 %s: zkouší se vysunout "%s" s použitím příkazu pro vysunutí diskety
 %s: zkouší se vysunout "%s" s použitím příkazu pro odpojení pásky
 %s: není možné vysunout, poslední chyba: %s
 %s: nelze spustit /bin/umount pro "%s": %s
 %s: nelze nalézt nebo otevřít zařízení pro: "%s"
 %s: nelze rozvětvit proces: %s
 %s: nelze otevřít /etc/fstab: %s
 %s: nelze otevřít "%s"
 %s: odopojení "%s" neskončilo normálně
 %s: odpojení "%s" selhalo
 %s: odpojuje se "%s"
 %s: použivá se výchozího zařízení "%s"
 Eject verze %s od Jeffa Trantera (tranter@pobox.com), český překlad Marv
Použití:
  eject -h				-- zobrazí tuto nápovědu a skončí
  eject -V				-- zobrazí verzi programu a skončí
  eject [-vnrsfq] [<název>]		-- vysune zařízení
  eject [-vn] -d			-- zobrazí výchozí zařízení
  eject [-vn] -a on|off|1|0 [<název>]	-- zapne (on)/vypne (off) automatické vysouvání
  eject [-vn] -c <pozice> [<název>]	-- vymění disk v CD-ROM měniči
  eject [-vn] -t [<název>]		-- zavře dvířka
  eject [-vn] -x <rychlost> [<název>]	-- nastaví rychlost CD-ROM
Volby:
  -v	-- povolí výpis komentářů
  -n	-- nevysouvat, jen ukázat, jestli zařízení existuje
  -r	-- vysunout CD-ROM
  -s	-- vysunout SCSI zařízení
  -f	-- vysunout disketu
  -q	-- vysunout pásku
  -p	-- použít /proc/mounts místo /etc/mtab
  -m	-- neodpojovat zařízení ikdyž je připojeno
 Dlouhé volby:
  -h --help   -v --verbose	 -d --default
  -a --auto   -c --changerslot  -t --trayclose  -x --cdspeed
  -r --cdrom  -s --scsi	 -f --floppy
  -q --tape   -n --noop	 -V --version
  -p --proc   -m --no-unmount
 Parametr <název> může být soubor zařízení nebo přípojný bod.
Pokud jej vynecháte, jako výchozí se zvolí "%s".
Jako výchozí se zkouší -r, -s, -f, a -q v tomto pořadí, dokud se nezadaří.
 eject verze %s od Jeffa Trantera (tranter@pobox.com), český překlad Marv
 nelze otevřít %s: %s
 použití: volname [<soubor-zařízení>]
 název svazku 