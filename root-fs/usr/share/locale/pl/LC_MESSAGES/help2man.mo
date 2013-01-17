��    1      �  C   ,      8     9     ?     [  !   t     �     �     �  &   �            �      �   �  �   �  	   Y     c     o     {     �     �     �     �  G  �     �     �  "   	  �   $	     �	     �	     �	  �   �	  �   �
     3  1   B     t     }     �  �   �  B   �  1   �     �  5        E     K     Y  �  e  )   D     n     q  �  w       "        4  ,   S      �     �     �  .   �       
     �     �   �  �   �  	   N     X  
   ]  	   h  
   r  	   }     �     �  i  �     �       -     �   ?     �          	  �     �   �     }  \   �     �     �       �     7   �     )     I  I   e     �     �  '   �  d  �  2   b#     �#     �#                       	   '                                             0   *      ,          
      %          $          #                  "         1      /                   )   &                   !   +           -   (            .    %B %Y %s \- manual page for %s %s %s: can't create %s (%s) %s: can't get `%s' info from %s%s %s: can't open `%s' (%s) %s: can't unlink %s (%s) %s: error writing to %s (%s) %s: no valid information found in `%s' AUTHOR AVAILABILITY Additional material may be included in the generated output with the
.B \-\-include
and
.B \-\-opt\-include
options.  The format is simple:

    [section]
    text

    /pattern/
    text
 Any
.B [NAME]
or
.B [SYNOPSIS]
sections appearing in the include file will replace what would have
automatically been produced (although you can still override the
former with
.B --name
if required).
 Blocks of verbatim *roff text are inserted into the output either at
the start of the given
.BI [ section ]
(case insensitive), or after a paragraph matching
.BI / pattern /\fR.
 COPYRIGHT DESCRIPTION ENVIRONMENT EXAMPLES Environment Examples FILES Files GNU %s %s

Copyright (C) 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2009, 2010,
2011, 2012 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Written by Brendan O'Dea <bod@debian.org>
 Games INCLUDE FILES Include file for help2man man page Lines before the first section or pattern which begin with `\-' are
processed as options.  Anything else is silently ignored and may be
used for comments, RCS keywords and the like.
 NAME OPTIONS Options Other sections are prepended to the automatically produced output for
the standard sections given above, or included at
.I other
(above) in the order they were encountered in the include file.
 Patterns use the Perl regular expression syntax and may be followed by
the
.IR i ,
.I s
or
.I m
modifiers (see
.BR perlre (1)).
 REPORTING BUGS Report +(?:[\w-]+ +)?bugs|Email +bug +reports +to SEE ALSO SYNOPSIS System Administration Utilities The full documentation for
.B %s
is maintained as a Texinfo manual.  If the
.B info
and
.B %s
programs are properly installed at your site, the command
.IP
.B info %s
.PP
should give you access to the complete manual.
 The latest version of this distribution is available on-line from: The section output order (for those included) is: This +is +free +software Try `--no-discard-stderr' if option outputs to stderr Usage User Commands Written +by `%s' generates a man page out of `--help' and `--version' output.

Usage: %s [OPTION]... EXECUTABLE

 -n, --name=STRING       description for the NAME paragraph
 -s, --section=SECTION   section number for manual page (1, 6, 8)
 -m, --manual=TEXT       name of manual (User Commands, ...)
 -S, --source=TEXT       source of program (FSF, Debian, ...)
 -L, --locale=STRING     select locale (default "C")
 -i, --include=FILE      include material from `FILE'
 -I, --opt-include=FILE  include material from `FILE' if it exists
 -o, --output=FILE       send output to `FILE'
 -p, --info-page=TEXT    name of Texinfo manual
 -N, --no-info           suppress pointer to Texinfo manual
 -l, --libtool           exclude the `lt-' from the program name
     --help              print this help, then exit
     --version           print version number, then exit

EXECUTABLE should accept `--help' and `--version' options and produce output on
stdout although alternatives may be specified using:

 -h, --help-option=STRING     help option string
 -v, --version-option=STRING  version option string
 --version-string=STRING      version string
 --no-discard-stderr          include stderr when parsing option output

Report bugs to <bug-help2man@gnu.org>.
 help2man \- generate a simple manual page or other Project-Id-Version: help2man 1.40.7
Report-Msgid-Bugs-To: Brendan O'Dea <bug-help2man@gnu.org>
POT-Creation-Date: 2012-04-08 23:16+1000
PO-Revision-Date: 2012-04-05 21:09+0200
Last-Translator: Jakub Bogusz <qboosh@pld-linux.org>
Language-Team: Polish <translation-team-pl@lists.sourceforge.net>
Language: pl
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
 %B %Y %s \- strona podr�cznika dla %s %s %s: nie mo�na utworzy� %s (%s) %s: nie mo�na uzyska� informacji `%s' z %s%s %s: nie mo�na otworzy� `%s' (%s) %s: nie mo�na usun�� %s (%s) %s: b��d zapisu do %s (%s) %s: nie znaleziono poprawnej informacji w `%s' AUTOR DOST�PNO�� Do generowanego pliku mo�na do��czy� dodatkowy materia� przy pomocy
opcji
.B \-\-include
i
.BR \-\-opt\-include .
Format jest prosty:

    [sekcja]
    tekst

    /wzorzec/
    tekst
 Ka�da sekcja
.B [nazwa]
lib
.B [sk�adnia]
wyst�puj�ca w pliku do��czanym zast�puje to, co zosta�oby automatycznie
wyprodukowane (aczkolwiek mo�na w razie potrzeby obej�� to zachowanie przez
.B --name
).
 Bloki sformatowanego tekstu *roff s� wstawiane do wyj�cia na pocz�tku
podanej
.BI [ sekcji ]
(bez rozr�niania wielko�ci liter) lub po akapicie pasuj�cym do
.BI / wzorca /\fR.
 COPYRIGHT OPIS �RODOWISKO PRZYK�ADY �rodowisko Przyk�ady PLIKI Pliki GNU %s %s

Copyright (C) 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2009, 2010,
2011, 2012 Free Software Foundation, Inc.
Ten program jest darmowy; warunki kopiowania s� opisane w �r�d�ach.
Autorzy nie daj� �ADNYCH gwarancji, w tym r�wnie� gwarancji PRZYDATNO�CI
DO SPRZEDA�Y LUB DO KONKRETNYCH CEL�W.

Program napisa� Brendan O'Dea <bod@debian.org>
 Gry DO��CZANE PLIKI Plik do��czany do strony podr�cznika help2man Linie przed pierwsz� sekcj� lub wzorzec zaczynaj�cy si� od `\-' s�
przetwarzane jako opcje. Ca�a reszta jest po cichu ignorowana i mo�e
by� u�ywana jako komentarze, s�owa kluczowe RCS itp.
 NAZWA OPCJE Opcje Inne sekcje s� do��czane do automatycznie generowanego wyj�cia
w przypadku standardowych, wy�ej wymienionych sekcji lub w��czane
w miejscu
.I inne
(jak wy�ej) w kolejno�ci, w jakiej wyst�pi�y w do��czanym pliku.
 Wzorce zapisuje si� przy u�yciu sk�adni perlowych wyra�e� regularnych
i mo�na je zako�czy� modyfikatorami
.IR i ,
.I s
lub
.I m
(patrz
.BR perlre (1)).
 ZG�ASZANIE B��D�W B��dy +(w +[\w-]+ +)?+(prosz�|prosimy) +zg�asza� +na +adres|Raporty +o +b��dach +wysy�aj +do ZOBACZ TAK�E SK�ADNIA Narz�dzia administracyjne Pe�na dokumentacja dla programu
.B %s
jest utrzymywana jako podr�cznik Texinfo. Je�li programy
.B info
oraz
.B %s
s� w�a�ciwie zainstalowane, polecenie
.IP
.B info %s
.PP
powinno udost�pni� kompletny podr�cznik.
 Najnowsza wersja tego oprogramowania jest dost�pna pod: Kolejno�� sekcji na wyj�ciu to: Ten +program +jest +darmowy Opcja `--no-discard-stderr' pomo�e, je�li program wypisuje opis na stderr Sk�adnia|U�ycie Polecenia u�ytkownika Napisany +przez|Program +napisa(�a?|li) `%s' generuje stron� podr�cznika z wyj�cia `--help' i `--version'.

Sk�adnia: %s [OPCJA]... PROGRAM

 -n, --name=�A�CUCH      opis akapitu NAZWA
 -s, --section=SEKCJA    numer sekcji dla strony podr�cznika (1, 6, 8)
 -m, --manual=TEKST      nazwa podr�cznika (Polecenia u�ytkownika, ...)
 -S, --source=TEKST      pochodzenie programu (FSF, Debian, ...)
 -L, --locale=�A�CUCH    ustawienie lokalizacji (domy�lnie "C")
 -i, --include=PLIK      do��czenie materia�u z `PLIKU'
 -I, --opt-include=PLIK  do��czenie materia�u z `PLIKU', je�li takowy istnieje
 -o, --output=PLIK       zapisanie wyj�cia do `PLIKU'
 -p, --info-page=TEKST   nazwa podr�cznika Texinfo
 -N, --no-info           pomini�cie wskazania do podr�cznika Texinfo
 -l, --libtool           pomini�cie `lt-' z nazwy programu
     --help              wy�wietlenie tego opisu i zako�czenie pracy
     --version           wy�wietlenie numeru wersji i zako�czenie pracy

PROGRAM powinien przyjmowa� opcje `--help' oraz `--version' i wypisywa�
informacje na standardowe wyj�cie, aczkolwiek mo�na poda� alternatywne
sposoby dzia�ania przy pomocy:

 -h, --help-option=�A�CUCH     �a�cuch opcji pomocy
 -v, --version-option=�A�CUCH  �a�cuch opcji wersji
 --version-string=�A�CUCH      �a�cuch wersji
 --no-discard-stderr           do��czenie stderr przy analizie wyj�cia

B��dy prosimy zg�asza� na adres <bug-help2man@gnu.org>.
 help2man \- generowanie prostej strony podr�cznika lub|albo inne 