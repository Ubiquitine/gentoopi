��    >        S   �      H  )   I      s  #   �  -   �  *   �  +     =   =  )   {  ;   �  :   �          3      M     n  $   �     �     �  (   �          -     ?     ^     x     �  '   �  &   �  $   �     	      4	  #   U	  )   y	  ,   �	  0   �	  /   
     1
      P
  !   q
      �
  #   �
     �
  4   �
  -   %  4   S  4   �  $   �  +   �  ,        ;  "   S     v  *   �     �     �     �  �  
  �      �   �  5   v     �     �     �  B  �  -   .  #   \  6   �  7   �  2   �  <   "  Q   _  7   �  L   �  @   6     w  )   �  "   �     �  -   �     '  $   F  1   k     �     �     �     �       !   %  /   G  -   w  $   �     �  %   �  8     ,   F  1   s  3   �  9   �  '     2   ;  6   n  )   �  <   �       >   #  2   b  @   �  D   �  %     .   A  8   p     �  "   �     �  -        3     O  '   e  P  �  �   �  �   �   /   d!     �!  (   �!     �!     ,   )                '      =           8   "   (                     -      9      :   2                      5       
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
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-05-07 01:11+0200
PO-Revision-Date: 2006-04-27 12:51-0300
Last-Translator: Anderson Goulart <globalx@gmail.com>
Language-Team: Portugu�s/Brasil
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit %s: comando auto-ejetor de CD-ROM falhou: %s
 %s: Comando eject do CD-ROM falhou
 %s: Comando eject do CD-ROM foi realizado com sucesso
 %s: comando carregador de CD-ROM da bandeja falhou: %s
 %s: comando seletor de disco do CD-ROM falhou: %s
 %s: comando para selecionar velocidade do CD-ROM falhou: %s
 %s: comando para selecionar velocidade do CD-ROM n�o � suportada por este kernel
 %s: comando para fechar a bandeja do CD-ROM falhou: %s
 %s: comando para fechar a bandeja do CD-ROM n�o � suportada por este kernel
 %s: bandeja do IDE/ATAPI CD-ROM n�o � suportada por este kernel
 %s: SCSI eject falhou
 %s: SCSI eject foi realizado com sucesso
 %s: `%s' pode ser montado em `%s'
 %s: `%s' � um link para `%s'
 %s: `%s' � um dispositivo multi-particionado
 %s: `%s' est� montado em `%s'
 %s: `%s' n�o � um ponto de montagem
 %s: `%s' n�o � um dispositivo multi-particionado
 %s: `%s' n�o est� montado
 %s: fechando a bandeja
 %s: n�o p�de alocar mem�ria
 %s: dispositivo padr�o: `%s'
 %s: o dispositivo � `%s'
 %s: o nome do dispositivo � `%s'
 %s: desabilitando o modo auto-ejetor para `%s'
 %s: habilitando o modo auto-ejetor para `%s'
 %s: saindo devido a op��o -n/--noop
 %s: o nome expandido � `%s'
 %s: comando eject do disquete falhou
 %s: comando eject do disquete foi realizado com sucesso
 %s: argumento inv�lido para op��o --auto/-a
 %s: argumento inv�lido para a op��o --cdspeed/-x
 %s: argumento inv�lido para op��o --changerslot/-c
 %s: profundidade m�xima do link simb�lico excedida: `%s'
 %s: selecionando o disco do CD-ROM #%d
 %s: estabelecendo a velocidade do CD-ROM para %dX
 %s: estabelecendo velocidade autom�tica para o CD-ROM
 %s: comando de desconex�o da fita falhou
 %s: comando de desconex�o da fita foi realizado com sucesso
 %s: muitos par�metros
 %s: tentando ejetar `%s' utilizando o comando eject do CD-ROM
 %s: tentando ejetar `%s' utilizando comandos SCSI
 %s: tentando ejetar `%s' utilizando o comando eject do disquete
 %s: tentando ejetar `%s' utilizando o comando de desconex�o da fita
 %s: n�o p�de ejetar, �ltimo erro: %s
 %s: n�o p�de executar /bin/umount de `%s': %s
 %s: n�o p�de encontrar ou abrir o dispositivo para `%s'
 %s: n�o p�de criar a c�pia: %s
 %s: n�o pode abrir /etc/fstab: %s
 %s: n�o p�de abrir `%s'
 %s: unmount do `%s' n�o terminou normalmente
 %s: unmount do `%s' falhou
 %s: desmontando `%s'
 %s: utilizando dispositivo padr�o `%s'
 Vers�o %s por Jeff Tranter (tranter@pobox.com)
Uso:
  eject -h				-- exibe o uso do comando e sai
  eject -V				-- exibe a vers�o do programa e sai
  eject [-vnrsfq] [<nome>]		-- ejeta o dispositivo
  eject [-vn] -d			-- exibe o dispositivo padr�o
  eject [-vn] -a on|off|1|0 [<nome>]	-- habilita[on] ou desabilita[off] o ejetor autom�tico
  eject [-vn] -c <slot> [<nome>]	-- troca os discos em uma bandeja de cds
  eject [-vn] -t [<nome>]		-- fecha a bandeja
  eject [-vn] -x <velocidade> [<nome>]	-- estabelece a velocidade m�xima do CD-ROM
Op��es:
  -v	-- habilita a sa�da detalhada
  -n	-- n�o ejeta, somente exibe o dispositivo encontrado
  -r	-- ejeta CD-ROM
  -s	-- ejeta dispositivo SCSI
  -f	-- ejeta diquete
  -q	-- ejeta fita
  -p	-- usa /proc/mounts ao inv�s do /etc/mtab
  -m	-- n�o desmonta o dispositivo mesmo que ele esteja montado
 Op��es longas:
  -h --help   -v --verbose	 -d --default
  -a --auto   -c --changerslot  -t --trayclose  -x --cdspeed
  -r --cdrom  -s --scsi	 -f --floppy
  -q --tape   -n --noop	 -V --version
  -p --proc   -m --no-unmount
 Par�metro <nome> pode ser um dispositivo ou um ponto de montagem.
Se omitido, o nome padr�o � `%s'.
Por padr�o tenta -r, -s, -f e -q, nessa ordem, at� obter sucesso.
 vers�o %s por Jeff Tranter (tranter@pobox.com)
 n�o pode abrir %s: %s
 uso: volname [<arquivo-de-dispositivo>]
 volname 