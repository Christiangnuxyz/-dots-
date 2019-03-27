#!/bin/sh

# Reinstallsjon script for Ubuntu


# Notat til meg selv

# Set BASH til avslutte scripet hvis feil er funnet 
#set-e



# Variabler:
SISTENDRET="26.mars.2019"
NYTT="Lagt til steam-devices for bruk av kontrollere med Steam"
VER="Versjon 1.8.9"
OS="Testet sist på Ubuntu 18.10"
ENDRINGER="Ingen endringer"
FJERNET="Ingenting fjernet"
KODENAVN="$(lsb_release -sc)"

# Pakker
BASIC="lxrandr pavucontrol synaptic software-properties-common  terminator transmission-gtk apparmor"
SIKKERHET="gufw clamtk chkrootkit rkhunter gpgv2 gtkhash seahorse"
MEDIA="libvlc-bin vlc handbrake mkchromecast youtube-dl mpv gimp gimp-plugin-registry audacity geary libreoffice flameshot"
OPPTAK="kazam"
TILLEGG="caffeine alarm-clock-applet"
UTVIKLING="filezilla zeal sqlitebrowser"
SPILL="pcsx2 lgogdownloader xboxdrv"
SPILLEXSTRAPAKKER="libboost-program-options1.65.1 libboost-regecx1.65.1"
FONTS="fonts-firacode fonts-league-spartan fonts-powerline fonts-emojione fonts-opendyslexic"
FREEVIRTUAL="gnome-boxes"
BACKUPPROGRAMMER="grsync backintime-gnome"


# Pakker som brukers fra kommandolinjen 
TERMINAL="neofetch at tldr htop pv zsh powerline unzip shellcheck curl git buku openssh-client rsync tree net-tools"
TERMINALNETTVERK="resolvconf network-manager"
TERMINALEPOST="pst-utils"
METADATA="libimage-exiftool-perl"
FJERNSTRYING="openssh-server rclone"
PAKKESYSTEMER="snap snapd flatpak"


# Språk pakkker 
SPRÅKPAKKER="hunspell"
ENGELSK="hunspell-en-ca libreoffice-help-en-us hunspell-en-au libreoffice-l10n-en-za libreoffice-help-en-gb hunspell-en-gb libreoffice-l10n-en-gb hunspell-en-za mythes-en-au hyphen-en-ca hyphen-en-us mythes-en-us hyphen-en-gb gimp-help-en"
NORSK="language-pack-nb language-pack-nb-base language-pack-gnome-nb libreoffice-l10n-nb firefox-locale-nb wnorwegian hunspell-no mythes-no hyphen-no"


# Pakker som følger med som standard installasjonen av Ubuntu fra Canoical
CANONICAL="thunderbird* cheese simple-scan gnome-mines aisleriot gnome-sudoku gnome-mahjongg brasero orca gksu"
# Disse pakkene brukes for å melde om feil som oppstår på Ubuntu til Canoical
VALGFRIT="apport-gtk ubuntu-report"


# Maskinvare pakker 
VIRTUALTERMINAL="cpu-checker"
MASKINVARE="fwupdate fwupd"
TEMPERATUR="lm-sensors hddtemp psensor"
HARDDISK="bleachbit gparted gdmap baobab gnome-disk-utility testdisk smartmontools"
HARDDISKCRYPT="cryptsetup"
FILSYSTEMSUPPORT="exfat-utils exfat-fuse hfsprogs"

# Pakker som innholder EULA eller andre non-freee software som mediakodekser osv
EULA="ubuntu-restricted-extras steam steam-devices libsdl2-2.0-0 libvde0 libvdeplug2"
DVDSUPPORT="libdvd-pkg libdvdcss-dev libdvdcss2"
VIRTALBOXEULA="virtualbox libqt5opengl5 libvde0 libvdeplug2 virtualbox-qt virtualbox-ext-pack vde2 virtualbox-guest-additions-iso"
HEICSUPPORT="libheif-examples libheif1"

# Pakker som har med utseende på programmvarene og skrivebord generelet

PROGRAMVARERTEMA="libreoffice-gtk libreoffice-gtk2 libreoffice-gtk3"
UTSEENDE="gtk-chtheme folder-color qt4-qtconfig qt5-style-plugins qt5ct"
PAKKESYSTEMERUTSEENDE="qt5-flatpak-platformtheme"
BIONICBEAVER="suru-icon-theme"
IKONER="moka-icon-theme pocillo-icon-theme"
TEMA="arc-theme"


# Snap pakker
SNAPPAKKER="spotify"
SNAPBIONIC="communitheme"
CANONICALSNAP="gnome-system-monitor"
SNAPGTK="gtk-common-themes gtk2-common-themes"

# Appimage
KEEPASSXCAPPIMAGE="https://github.com/keepassxreboot/keepassxc/releases/download/2.4.0/KeePassXC-2.4.0-x86_64.AppImage"

# Appimage sin nedlastings mappe
Nedlastingermappe="$HOME/Appimage/"

# Appimage SHA-256-digest
KEEPASSXCAPPIMAGESHA="https://github.com/keepassxreboot/keepassxc/releases/download/2.3.4/KeePassXC-2.4.0-x86_64.AppImage.DIGEST"

# For luke smith sitt CSV script som er modifisert av meg for Ubuntu 

CSVPAKKER="latexila pandoc wkhtmltopdf"


# Laptop pakker

LAPTOP="cheese simple-scan qtqr"
LAPTOPBATTERI="tlp tlp-rdw gnome-power-manager"
BLUETOOTHPAKKER="bluez bluez-tools bluetooth"

# Telefon pakker

ANDROID="adb fastboot"


# Tenker at legge til muligheten for å sjekke om du bruker ubuntu GNOME 
VANLIGGNOME="gnome-session gnome-session-wayland"

# GNOME 3 pakker

GNOME="gnome-control-center gnome-font-viewer  gnome-calculator  gnome-system-monitor gnome-color-manager gnome-software-plugin-flatpak  gnome-software-plugin-snap"
GNOMEDIGTALIVET="gnome-calendar evolution gnome-contacts"
GNOMETILPASS="gnome-tweak-tool dconf-editor dconf-cli"
GNOMESIKKERHET="clamtk-gnome clamtk-nautilus seahorse-nautilus"
GNOMEEXTENSION=" gnome-shell-extensions chrome-gnome-shell gnome-shell-extension-appindicator  gnome-shell-extension-weather gnome-shell-extension-dashtodock gnome-shell-extension-mediaplayer gnome-shell-extension-caffeine"
GNOMEVPN="network-manager-openvpn-gnome network-manager-pptp-gnome network-manager-l2tp-gnome"
GNOMENETTVERK="network-manager-ssh-gnome"
GNOMEPROGRAMMER="gnome-todo gnome-usage gnome-screenshot tilix"
UBUNTUGNOMEPAKKER="gnome-shell-extension-ubuntu-dock"
HELSE="safeeyes"


# Pakker for Ubuntu 18.10 

COSMICCUDDELFISH="gnome-shell-extension-gsconnect peek picard feedreader"


# Pakker som fjenes hvis det er gnome 3

FJERNVISGNOME="tomboy kdeconnect kleopatra"
REDSHIFTGNOME="gnome-shell-extension-redshift redshift redshift-gtk"

# Sjekker versjon av GNOME shell

GNOMESHELLVERSJON="3.30.1|3.28|3.27|3.26|3.25|3.24"

# GNOME Gsettings
GTK="Arc-Dark"
GNOMEIKON="Pocillo"
MUSIKON="DMZ-Black"

# GNOME Tracker beskrivelse
TRACKER="metadata database, indexer and search tool"

# GNOME extension mapper 
DASHTODOCK="dash-to-dock@micxgx.gmail.com"
OPENWEATHER="openweather-extension@jenslody.de"


# Mapper
AMAZON="/usr/share/applications/ubuntu-amazon-default.desktop"

# URL-er
VIRTALBOXURL="https://www.virtualbox.org/wiki/Downloads"
PROTONINFO="https://github.com/ValveSoftware/Proton/wiki/Requirements"
GNOMESHELLINFO="https://extensions.gnome.org/local/"

# Maskinvare URL-er 
FWUPSUPPORTETURL="https://fwupd.org/lvfs/devicelist"

# FLATPAK GTK TEAMER

# UBUNTU FLATPAK GTK TEAMER
FLATPAKCOMMUNITHEME="org.gtk.Gtk3theme.Communitheme"
FLATPAKYARU="org.gtk.Gtk3theme.Yaru"
FLATPAKYARUDARK="org.gtk.Gtk3theme.Yaru-dark"

# ARC FLATPAK GTK TEAMER

FLATPAKARC="org.gtk.Gtk3theme.Arc"                                                                                         
FLATPAKARCSOLID="org.gtk.Gtk3theme.Arc-solid"                                                                              
FLATPAKARCDARKER="org.gtk.Gtk3theme.Arc-Darker"                                                                               
FLATPAKARCDARKERSOLID="org.gtk.Gtk3theme.Arc-Darker-solid"
FLATPAKARCDARK="org.gtk.Gtk3theme.Arc-Dark"
FLATPAKARCDARKSOLID="org.gtk.Gtk3theme.Arc-Dark-solid"  




# Funksjoner
 reinstallsjon-script-for-ubuntu-hjelp() {

cat << _EOF_

 Reinstallsjon script for Ubuntu og Ubuntu baserte distroer som Linux Mint osv
 Reinstallere pakker som Christian bruker på sine Ubuntu maskinere

 Kommandoer:
    Reinstallsjon = reinstallere alt utenom om Firefox.

    Kjøring av "Reinstallsjon script for Ubuntu" reinstallere alt utenom om Firefox.

    Med å legg til "--laptop" valget installere du disse pakkene $LAPTOP
    Med å legg til "--resetfirefox" tilbakestiler firefox til sånn firefox blir sånn som den kommer fra Mozilla
    reinstallsjon-script-for-ubuntu-hjelp "--hjelp"


_EOF_

}

    if
	[ "$1" == "--hjelp" ]; then
	reinstallsjon-script-for-ubuntu-hjelp
	exit
	fi

 reinstallsjon-script-for-ubuntu-help() {

cat << _EOF_

 Reinstallsjon script for Ubuntu og Ubuntu baserte distroer som Linux Mint osv
 Reinstallere pakker som Christian bruker på sine Ubuntu maskinere

 Kommandoer:
    Reinstallsjon = reinstallere alt utenom om Firefox.

    Kjøring av "Reinstallsjon script for Ubuntu"  reinstallere alt utenom om Firefox.

    Med å legg til "--laptop" valget installere du disse pakkene $LAPTOP
    Med å legg til "--resetfirefox" tilbakestiler firefox til sånn firefox blir sånn som den kommer fra Mozilla
    reinstallsjon-script-for-ubuntu-help "--help"


_EOF_

}

    if
	[ "$1" == "--help" ]; then
	reinstallsjon-script-for-ubuntu-help
	exit
	fi

# Hardware

laptop() {

    # Installer pakker til laptopen som chess for webcam osv
	echo "---------------------------------------------------------------------------------------------"
	echo "Installer pakker som er anbefalt for Bærbar PC/Laptop"
	echo "---------------------------------------------------------------------------------------------"
	sudo apt-get install $LAPTOP -yyq
	batteri()  {
	# Sjekker om laptop-en har et batteri som funker installer deretter $LAPTOPBATTERI pakken ellers hvis ikke laptop batteri funker fjerner $LAPTOPBATTERI pakkene 	
	echo "---------------------------------"
	echo "Sjekker om laptop-en har batteri"
	echo "---------------------------------"
	if  upower --show-info /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"
		then 
		echo "---------------------------------------------------------------------------------------------"
		echo "Installere disse"$LAPTOPBATTERI" pakken for laptop batteri" && sudo apt-get install $LAPTOPBATTERI -yyq
	echo "---------------------------------------------------------------------------------------------"
	else
	echo "------------------------------------------------"
	echo -e "\e[1;31m Du har IKKE batteri i laptopen \e[0m" && sudo apt-get purge $LAPTOPBATTERI -yyq 
	echo "-------------------------------------------------"
    fi
    }

	tlp() {
    # Fjerner laptop-mode-tools som er installert som standard på Ubuntu og ersatter laptop-mode-tools med tlp
	
	echo "--------------------------------------------------------------------------------------------------------------"
	if echo "Hvis laptop-mode-tools er instalert ersatt det med tlp" && dpkg --get-selections | grep -qw laptop-mode-tools
	echo "--------------------------------------------------------------------------------------------------------------"
		then
		sudo apt-get purge laptop-mode-tools -yyq  >/dev/null
	else
		echo "-----------------------------------------------------------------------------"
	echo -e "\e[1;31m Du har IKKE laptop-mode-tools installert derfor blir den ikke fjernet \e[0m"
		echo "-----------------------------------------------------------------------------"
	fi
	}

	GNOME3LAPTOP() {
	# Sjekker om skrivebordmiljøet er GNOME 3 eller ikke
	if echo "$XDG_CURRENT_DESKTOP" | grep "GNOME"
	then
		# Aktivere sånn at GNOME 3 viser batteri prossent i gnome-shell 	
		echo "-------------------------------------------------"
		echo "Aktivere at batteri prossent vis i GNOME shell"
		echo "-------------------------------------------------"
		gsettings set org.gnome.desktop.interface show-battery-percentage true
	else
    echo "---------------------------------------------------------------------"
	echo -e "\e[1;31m Du har bruker IKKE GNOME 3 \e[0m"
	echo "---------------------------------------------------------------------"
	fi
	}

    bluetooth() {
	 # Sjekker om laptopen har støtte for Bluetooh

	if dmesg | grep -ic  --color "Bluetooth" >/dev/null
		then
		echo "---------------------------------------------------------------------"
		echo "Installere Bluetooth pakkker" && sudo apt-get install $BLUETOOTHPAKKER -yyq
		echo "---------------------------------------------------------------------"
		else
		echo "---------------------------------------------------------------------"
	    echo -e "\e[1;31m  Du har IKKE Bluetooth \e[0m" && sudo apt-get purge $BLUETOOTHPAKKER -yyq >/dev/null
		echo "---------------------------------------------------------------------"

	     fi
	exit
	}
}

if  [ "$1" == "--laptop" ];then
laptop
batteri
GNOME3LAPTOP
tlp
bluetooth
exit
fi


csv(){
echo "----------------------------------------------------------------------------------"	
echo "Installer pakker for å lage en bedre med Markdown CSV med luke smith sitt script" 
echo "-----------------------------------------------------------------------------------"
sudo apt-get install $CSVPAKKER -yyq 
}

if  [ "$1" == "--CSV" ];then
	    csv
		exit
fi



amazon() {
# Fjerner  Amazon.dekstop snarveien til Amazon.com fra standard Ubuntu 
echo "Sjekker om Amazon.com snarveien er i installasjonen...."  >/dev/null
if [ ! -f $AMAZON ]
then echo "file " >/dev/null  $AMAZON " Amazon.com snarveien finnes ikke," 
else "file " $AMAZON " finnes."; echo "Fjerner Amazon.com snarveien...." && sudo rm -rf $AMAZON  2>/dev/null
fi
}

gamlepakker() {
# Fjerner gamlepakker som ikke lenger er i Ubuntu 18.10 cosmic sitt repo
if echo $KODENAVN | grep "cosmic"
then
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
echo "Fjerner pakker som browser-plugin-vlc siden det ikke er lenger i Ubuntu 18.10 cosmic sitt repo"
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
sudo apt-get purge browser-plugin-vlc -yyq 
else
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
echo -e "\e[1;31m Du bruker IKKE Ubuntu 18.10 cosmic \e[0m"
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
fi
}

canonicalpakker() {
# Sjekker om Canonical sin pakker er tilstede. Hvis de er tilstede fjernes de
if dpkg -l gstreamer1.0-fluendo-mp3 ubuntu-web-launchers 1>/dev/null
then
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
echo "Fjerner pakker som Canonical putter i standard installasjonen av Ubuntu"
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
sudo apt-get purge gstreamer1.0-fluendo-mp3 ubuntu-web-launchers -yyq 
else
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
echo  -e "\e[1;31m Du bruker IKKE vanlig Ubuntu distro med pakker som Canonical putter i som standard \e[0m"
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
fi
}


canonicalfirefox() {
echo "----------------------------------------"
echo "Sjekker om Mozilla Firefox er installert" && dpkg --get-selections | grep -qw firefox
echo "----------------------------------------"
while true;  do
read -r -p  "Vil du ta å reste Firefox til sånn som Firefox er når den kommer fra Mozilla eller vil du forsatte å bruke Canonical sin?, Det vil fjerne alle ting du har endret på i firefox så ta backup av $HOME/.mozilla/firefox/ $HOME/.mozilla/firefox/profiles.ini  (j/n)?" valgfirefox
case "$valgfirefox" in
  [Jj]* ) echo "Tilbakestiler Firefox"; rm  "$HOME"/.mozilla/firefox/*.default -r >/dev/null && rm "$HOME"/.mozilla/firefox/profiles.ini >/dev/null;
	echo "-------------------------------------------------------------------"
	echo "Åpner Firefox igjen for å lage en ny profil og lukkes etter 20 sek"
	echo "-------------------------------------------------------------------"
    firefox & sleep 20 && killall firefox; exit ;;
  [Nn]* ) echo "nei"; exit;;
  * ) echo "ikke et svar";;
esac
done
	}


if  [ "$1" == "--resetfirefox" ];then
	canonicalfirefox
	exit
fi

ubuntugnome(){

# Sjekker om det nåværende skrivebordsmiljøet er GNOME eller Ubuntu GNOME 

if echo "$XDG_CURRENT_DESKTOP" | grep -E"GNOME|ubuntu:GNOME"
then
echo "----------------------------------------------------------------------------------------------------------------------------------------------"	
echo "Vil du IKKE rappotere feil til Ubuntu dette kommer til å ødlegge sånn at du ikke får logget inn på GNOME 3,hvis ja fjern den pakken $VALGFRIT" 
echo "----------------------------------------------------------------------------------------------------------------------------------------------"		
	sudo apt-get remove $VALGFRIT
else 
echo "----------------------------------------------------------------------------------------------------------------------------------------------"	
echo "Avhengig av du har valgt kommer du til å enten få logge inn på Ubuntu med GNOME 3 eller ikke " 
echo "----------------------------------------------------------------------------------------------------------------------------------------------"	
fi
}

gnome3() {
# Sjekker om skrivebordsmiljø ditt er GNOME hvis GNOME er skrivebordsmiljø kjører scripet funksjonene nedenfor 	
echo "---------------------------------------------------"
echo "Sjekker skrivebordsmiljø ditt"
echo "---------------------------------------------------"
if echo "$XDG_CURRENT_DESKTOP" | grep -qw "GNOME"
	then
	echo "---------------------------------------------------"
	echo "Fjerner disse $FJERNVISGNOME siden de finnes alt i GNOME"
	sudo apt-get purge $FJERNVISGNOME -yyq 
		echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	echo "Installere GNOME 3 pakker fordi Skrivebordsmiljø er GNOME" && sudo apt-get install $TEMA $IKONER $GNOME $GNOMEDIGTALIVET $GNOMENETTVERK $GNOMETILPASS $GNOMEPROGRAMMER  $GNOMESIKKERHET -yyq
	echo "Installere GNOME 3 shell disse "$GNOMEEXTENSION" extensions pakker fordi Skrivebordsmiljø er GNOME" && sudo apt-get install $GNOMEEXTENSION -yyq
	echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	echo "Installere Canonical sitt nye GTK tema og vanlig GTK temaer som snap" && sudo snap install $SNAPBIONIC $SNAPGTK
    echo "---------------------------------------------------------------------------------------------------------------"
    echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Installere disse "$GNOMEVPN" pakkene for å få støtte sett opp en VPN-er på flere måtter i GNOME 3" && sudo apt-get install $GNOMEVPN -yyq
    echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Vil du å installere "$HELSE" for å en pause fra skjermen?" && sudo apt-get install $HELSE
    echo "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Ønsker du og søke etter filer med gnome 3 sånn som windows utforsker?" && sudo apt-get install tracker
    echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"

gnomeshellextensions() {

# Aktiver forskjellige GNOME shell extensions
if echo "$XDG_CURRENT_DESKTOP" | grep -qw "GNOME"
	then
    echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	echo "Sjekke ut "$GNOMESHELLINFO" for oppdateringer til GNOME 3 shell extensions. NB krever nettleser utvidelse"
    echo "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	sleep 2
    echo "---------------------------------------------------------------------------------------------------------------"
    echo "Aktivere dash-to-dock extension for GNOME shell" && gnome-shell-extension-tool --enable-extension /usr/share/gnome-shell/exentesions/"$DASHTODOCK" 
    echo "---------------------------------------------------------------------------------------------------------------" 
    echo "-------------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Aktivere minimize siden for dash-to-dock extension siden det ikke er normalt i GNOME når du klikker på et ikonet til et program"
    echo "--------------------------------------------------------------------------------------------------------------------------------------------------------"
    gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
    echo "---------------------------------------------------------------------------------------------------------------"
    echo "Aktivere openweather-extension for tilgang til været GNOME shell" && gnome-shell-extension-tool --enable-extension /usr/share/gnome-shell/exentesions/"$OPENWEATHER" 
    echo "---------------------------------------------------------------------------------------------------------------" 
else 
    echo "-------------------------------------------------------------------------"
echo -e "\e[1;31m Du bruker ikke GNOME \e[0m"
    echo "-------------------------------------------------------------------------"	
fi 
}    

tracker(){
# Sjekker om tracker er installert
if dpkg -l tracker | grep -qw "installert" 2>/dev/null
    then    	
    echo "-------------------------------------------------------------------"
    echo "Oppdatere tracker sin database for å gjøre GNOME 3 sitt søk bedre"
    echo "------------------------------------------------------------------"
    	sudo /usr/bin/updatedb 
    	else
    echo "-------------------------------------------------------------------------"
echo -e "\e[1;31m tracker er ikke installert så får IKKE oppdatere databasen nå \e[0m"
    echo "-------------------------------------------------------------------------"
fi
}


kdeconnectserver(){
echo "---------------------------------------------------"
echo "Sjekker om kdeconnectd prossensen kjører"
echo "---------------------------------------------------"
if pidof kdeconnectd
then
# Dreper kdecoonnet for å få bort feil meldingen GSConnnect Network Error i GNOME 3 	
echo "-----------------------------------------------------------------------"
echo "kdeconnect prosessen kjører dreper den"
echo "-----------------------------------------------------------------------" 
killall -9 kdeconnectd
else 
echo "-----------------------------------------------------------------------"
echo "kdeconnect prosessen kjører IKKE"
echo "-----------------------------------------------------------------------" 
fi 
}

# Setter opp utseende GNOME 3 og GNOME shell med hjelp av gsettings 
echo "--------------------------------------------------------------------------------------------------------------------------"
echo "Setter $GNOMEIKON $TEMA som ikon tema og GTK+ tema det kan endres tilbake med gnome-tweaks eller dconf vis du er hardcore"
echo "--------------------------------------------------------------------------------------------------------------------------"
    gsettings set org.gnome.desktop.interface gtk-theme $GTK
    gsettings set org.gnome.desktop.interface icon-theme $GNOMEIKON
    gsettings set org.gnome.desktop.wm.preferences theme $GTK
    gsettings set org.gnome.shell.extensions.user-theme name $GTK
    gsettings set org.gnome.desktop.interface cursor-theme $MUSIKON
else
    echo "---------------------------------------------------------"
    echo "Skrivebordsmiljø ditt er IKKE GNOME"
    echo "---------------------------------------------------------"

fi
}

gnomeshell() {

# Sjekker om du har GNOME shell 3.24 og oppover sånn at man kan aktivere GNOME Night Mode som gir skjermenrødaktive farger

echo "---------------------------------------------"
echo "Sjekker om du har GNOME shell 3.24 og oppover"
echo "--------------------------------------------"
if echo "$XDG_CURRENT_DESKTOP" | grep -E "GNOME|ubuntu:GNOME" && gnome-shell --version | grep -E "$GNOMESHELLVERSJON"
	then
	echo "--------------------------"
	echo "Aktivere GNOME Night mode" && gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
	echo "--------------------------"
	echo "--------------------------------------"
    echo "\e[1;31m Fjener redshift siden du bruker GNOME 3 \e[0m" && sudo apt-get purge $REDSHIFTGNOME -yyq 
    echo "--------------------------------------"
else
    echo "------------------------------------------------------------------------------------------------------------------------"
	echo "Installere gnome-shell-extension-redshift fordi du ikke har night mode i GNOME shell 3.24 eller så bruker du ikke gnome" && sudo apt-get install gnome-shell-extension-redshift  redshift redshift-gtk  -yyq
	echo "------------------------------------------------------------------------------------------------------------------------"
fi
}

# Setter opp bedre støtte for QT apper i GNOME 3
utseende() {

# Sjekker om export QT_QPA_PLATFORMTHEME=gtk er satt .profile filen
if  cat $HOME/.profile | grep -qw "export QT_QPA_PLATFORMTHEME=gtk2"
	then
echo "---------------------------------------------"
echo "Du har alt satt QT tema variabelen"
echo "--------------------------------------------"
else 
# Legger til export QT_QPA_PLATFORMTHEME=gtk .profile filen	i Hjemme mappen
echo "--------------------------------------------------------------------------------"
echo "Setter opp QT tema variabelen
 og krever omstart av session for å bli tatt i bruk"
echo "---------------------------------------------------------------------------------"	
echo "$XDG_CURRENT_DESKTOP" | grep -E "GNOME|ubuntu:GNOME" && echo export QT_QPA_PLATFORMTHEME=gtk2 >> "$HOME/.profile"	
fi 
}


grafikkkort() {
# Installer NVIDIA sin proprietær driver 
echo "---------------------------------------------"
echo "Sjekker om du har et NVIDIA grafikkkort"
echo "---------------------------------------------"
if  lspci | grep -ic --color "NVIDIA" 2>/dev/null
then
# Installer nvidia-settings for å kunne endre på Hz og Vsync på PC skjermen	
 echo "------------------------------------------------------"
 echo "Du har et NVDIA grafikkkort installere nvidia-settings " && sudo apt-get install nvidia-settings nvidia-driver-390 -yyq
 echo "------------------------------------------------------"
else

# Fjerner NVIDA sin proprietær driver siden det ikke er noen NVDIA grafikkkort i datamaskin
echo "---------------------------------------------"
echo -e "\e[1;31m Du har IKKE et NVDIA grafikkkort \e[0m" && sudo apt-get purge nvidia-settings nvidia-driver-390 -yyq 
echo "----------------------------------------------"
fi
}

virtualisering() {
echo "----------------------------------------------------------------------------------------------------------------"
echo "Sjekker om Virtualisering er aktivert eller ikke i BIOS for å kunne sjekke må $VIRTUALTERMINAL være installert"
echo "----------------------------------------------------------------------------------------------------------------"
if  sudo kvm-ok | grep --color "can be used" >/dev/null
echo "-------------------------------------------------"
then
# Virtualisering aktivert i BIOS	
echo "-------------------------------"
echo "Du har Virtualisering aktivert"
echo "-------------------------------"
else
echo "---------------------------------------------------------------------------------------------------"
echo -e "\e[1;31m Du har ikke Virtualisering aktivert sjekk om du kan aktivere Virtualisering i UEFI/BIOS \e[0m" sudo apt-get purge virtualbox virtualbox-ext-pack libqt5opengl5 gnome-boxes -yyq
echo "-----------------------------------------------------------------------------------------------------"
fi
}

checkvirtualbox() {
echo "---------------------------------------"
if echo "Sjekker om virtualbox er installert" && dpkg --get-selections | grep -qw virtualbox
echo "---------------------------------------------------------------"
then
# Fjerner GNOME-boxes på grunn av at Virtualbox er installert
echo "---------------------------------------"
echo -e "\e[1;31m Fjener gnome-boxes \e[0m"
echo "---------------------------------------"
sudo apt-get purge gnome-boxes -yyq
 echo "---------------------------------------"
 echo "gnome-boxes er fjernet"
 echo "---------------------------------------"
else
echo "---------------------------------------------------------------"
echo -e "\e[1;31m gnome-boxes er ikke installert \e[0m"
echo "---------------------------------------------------------------"
fi
}

virtualbox() {
echo "---------------------------------------"
if echo "Sjekker om virtualbox er installert" && dpkg --get-selections | grep -qw virtualbox
echo "---------------------------------------------------------------"
then
# Sjekker om brukeren din er medlem av gruppen vboxusers	
groups | grep -ic "vboxusers" > /dev/null
 echo "---------------------------------------"
 echo "$USER er alt i vboxusers"
 echo "---------------------------------------"
else
echo "---------------------------------------------------------------"
echo "Legger til brukeren din i vboxusers" && sudo adduser "$USER" vboxusers
echo "---------------------------------------------------------------"
fi
}

appimagepakker()  {
echo "---------------------------------------------------------------"
echo "Laster ned KeePassXC som Appimage i mappen $Nedlastingermappe"
echo "---------------------------------------------------------------"
mkdir -p "$HOME/Appimage"
cd $Nedlastingermappe || exit
wget -O KeePassXC.AppImage "$KEEPASSXCAPPIMAGE" -P "$Nedlastingermappe"
}

pakkerformater()  {
echo "---------------------------------------------------------------------------------------------"
echo "Oppdater snap pakker" && sudo snap refresh
echo "---------------------------------------------------------------------------------------------"
# Fjerner snapper som Canonical putter i standard installasjon av Ubuntu som jeg syns er unødvendige 
echo -e "\e[1;31m Fjerner disse "$CANONICALSNAP" pakkene \e[0m" && sudo snap remove $CANONICALSNAP
# Installer nå bare spotify fra $SNAPPAKKER men kommer nok til å legge til flere i fremtiden 
echo "Installer disse "$SNAPPAKKER" pakkene" &&  sudo snap install $SNAPPAKKER
echo "---------------------------------------------------------------------------"
echo "Legger til flathub støtte for å kunne last ned flatpak pakker fra flathub"
echo "---------------------------------------------------------------------------"
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Oppdater flatpak"
sudo flatpak update -y 
}

flatpakgtktema() {
echo "---------------------------------------------------------------------------------------------"
echo "Installere Ubuntu 18.04 Bioic Beaver LTS sitt GTK tema for flatpak apper også"
echo "---------------------------------------------------------------------------------------------"
sudo flatpak install flathub $FLATPAKCOMMUNITHEME $FLATPAKYARUDARK $FLATPAKYARU -y 
echo "---------------------------------------------------------------------------------------------"
echo "Installere Arc GTK tema for flatpak apper også"
echo "---------------------------------------------------------------------------------------------"
sudo flatpak install flathub $FLATPAKARC $FLATPAKARCDARK $FLATPAKARCDARKSOLID $FLATPAKARCDARKERSOLID $FLATPAKARCSOLID -y 
}

skjermer(){
echo "--------------------------------------------------------------"
echo "Sjekker om det er koblet til to skjermer"
echo "--------------------------------------------------------------"
if
# Bruker xrander for å avgjøre om flere skjermer er koblet til	
xrandr | grep " connected " | awk '{ print$1 }' | wc -l | grep "2"
then
# Installere Hydrapaper flatpak fra flathub å kunne ha to forskjelige bakgrunner på 2 skjermer siden det ikke er mulig i standard GNOME 3	
echo "-------------------------------------------------------------------------------"
echo "Installere Hydrapaper for å kunne ha to forskjelige bakgrunner på 2 skjermer"
echo "--------------------------------------------------------------------------------"
sudo flatpak install flathub org.gabmus.hydrapaper -y
else
echo "--------------------------------------------------------------"
echo -e "\e[1;31m Du har IKKE to skjermer koblet til nå \e[0m"
echo "--------------------------------------------------------------"
fi
}

gnome3flatpak(){
echo "----------------------------------------------------------------------------"
echo "Sjekker om du bruker GNOME 3 for å kunne isntallere DynamicWallpaperEditor"
echo "---------------------------------------------------------------------------"
if echo "$XDG_CURRENT_DESKTOP" | grep -qw "GNOME"
	then
echo "-------------------------------------------------------------------------------------------------------"
echo "Installere DynamicWallpaperEditor for GNOME sånn at man slipper å redigere XML filen med tekstedtioren"
echo "-------------------------------------------------------------------------------------------------------"	
sudo flatpak install flathub com.github.maoschanz.DynamicWallpaperEditor -y
else 
echo "--------------------------------------------------------------"
echo -e "\e[1;31m Du bruker ikke GNOME 3 \e[0m"
echo "--------------------------------------------------------------"
fi
}




temperatur-setup() {
if 	
echo "--------------------------------------------------------------"
echo "Sjekker om det er satt opp målig av temp på PC-en"
echo "--------------------------------------------------------------"
then
echo "--------------------------------------------------------------"
echo "Tempertatue målig er alt satt opp med tjenesten kmod"
echo "--------------------------------------------------------------"
systemctl --type=service --state=active | grep  -qw "kmod" 
else
	echo "--------------------------------------------------------------"
	echo "Setter opp muligheten for å sjekke temperatur på datamaskinen"
	echo "--------------------------------------------------------------"
	sudo sensors-detect && sensors | grep "Adapter"
    echo "--------------------------------------------------------------"
	echo "Starter tjenesten kmod får kunne bruke sensors å må temperaturen"
	echo "--------------------------------------------------------------"	
	/etc/init.d/kmod start	
fi
}


FJERNDVD() {
echo "----------------------------------------------------------------------------------------------------------------"	
echo -e "\e[1;31m Ønsker du å fjerne støtte for å kunne spille av DVD-er?  \e[0m" && sudo apt-get remove $DVDSUPPORT
echo "----------------------------------------------------------------------------------------------------------------"
}



avslutter()  {
echo "----------------------------------------------------------------------------------------------------"
echo "Følgende pakker ble automatisk installert og er ikke lenger påkrevet" && sudo apt-get autoremove -yyq && sudo apt-get check  
echo "Reinstallsjon script for Ubuntu $VER ER FERDIG PC-EN DIN BURDE STARTES OMIGJEN SNAREST"
echo "---------------------------------------------------------------------------------------------"
echo "Vil du restarte PC-en din nå?"
while true;  do
read -p "Vil du ta omstart av PC-EN (j/n)?" $valg
case "$valg" in
  [Jj]* ) echo "Omstart om 30 sek" & sleep 30 && reboot ;;
  [Nn]* ) echo "nei"; exit;;
  * ) echo "ikke et svar"; exit;;
esac
done
}


# Scripet starter

reinstallsjon-script-for-ubuntu ()  {
echo "----------------------------------------------------"
echo "SCRITPET MÅ BLI KJØRT MED SUDO(Admin) RETTIGHETER!!!"
echo "---------------------------------------------------"
echo "Reinstallsjon script for Ubuntu $VER"
echo "$OS"
echo "$NYTT i $VER"
echo "Endringer i $VER $ENDRINGER"
echo "$FJERNET fra $VER"
echo "Sist endret $SISTENDRET"
echo "----------------------------------------------------------------------------------"
echo "Legger til 32 bit støtte for deb pakker i apt som er nyttig for steam og wine..."
echo "-----------------------------------------------------------------------------------"
sudo dpkg --add-architecture i386
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Aktiver Canonical-partnere repo som er progrmvarer pakket av Canonical for samarbeidspartnere"
echo "-------------------------------------------------------------------------------------------------------------------"
sudo add-apt-repository --update "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner" -y
echo "----------------------------------------------------"
echo "Starter en full system oppdatering..."
echo "----------------------------------------------------"
sudo apt-get update -yyq
sudo apt-get full-upgrade -yyq
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har en laptop?, legg til --laptop for å installere anbefalt pakker til laptopen som støtte for bluetooth osv"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "Vil du kun fjern styre denne PC-en og sync ting til skyen med rclone,Hvis ja installer disse "$FJERNSTRYING" pakkene" && sudo apt-get install $FJERNSTRYING
echo "--------------------------------------------------------------------------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------------------"
echo "Vil du å installere disse "$BACKUPPROGRAMMER" pakkene for å kunne ta backup fra GUI" && sudo apt-get install $BACKUPPROGRAMMER --install-suggests
echo "---------------------------------------------------------------------------------------------------------------"
echo "Vil du bruke PC-en din på norsk?,Hvis ja installer disse pakkene" && sudo apt-get install $NORSK --install-suggests
echo "--------------------------------------------------------------------------------------------------------------------"
echo "Fjerner disse "$CANONICAL" Ubuntu pakkene jeg IKKE liker..."  && sudo apt-get purge $CANONICAL -yyq
echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Du må godta EULA/Lisensen til disse "$EULA" for å kun installere alle av dem for virtualbox kan det også være lurt og sjekke "$VIRTALBOXURL" for nyere versjoner av virtualbox" && sudo apt-get install $EULA $VIRTALBOXEULA
echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Ønsker du og installer "$SPILL" for å kunne spille PS2 spill og last ned spill fra GOG med terminalen og støtte for xbox kontrollere" && sudo apt-get install $SPILL --install-suggests
echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"	
echo "DVD support EULA/Lisensen er ikke mulig å avbryte enkelt men du får muligheten til å fjerne disse "$DVDSUPPORT" pakkene på slutten av scripet hvis du skulle ønske det " && sleep 5
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
# Installer $DVDSUPPORT for å få muligheten til å spille DVD-er
sudo apt-get install $DVDSUPPORT
sleep 5
sudo dpkg-reconfigure libdvd-pkg
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"	
echo "Ønsker du å ha støtte fo Apple sitt HEIC bilde format. Du kan få søtte for HEIC med å installer disse "$HEICSUPPORT" pakkene" && sudo apt-get install $HEICSUPPORT 
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "NB: for å kunne bruke Steam sin Proton må disse kravene være oppfylt sjekke ut "$PROTONINFO" for mer info" && sleep 5
echo "------------------------------------------------------------------------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Hvis du ønsker et free software til alternativ virtualbox kan du installere "$FREEVIRTUAL"" && sudo apt-get install $FREEVIRTUAL 
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Installer alle pakken som er free software fra Ubuntu repo"
sudo apt-get install $BASIC $ENGELSK $FONTS $BIONICBEAVER $SIKKERHET $FILSYSTEMSUPPORT $HARDDISK $HARDDISKCRYPT $MEDIA $OPPTAK $METADATA $IKONER $TEMA $UTSEENDE $PROGRAMVARERTEMA $VIRTUALTERMINAL $ANDROID $UTVIKLING $TILLEGG $TERMINAL $TERMINALNETTVERK $TERMINALEPOST $PAKKESYSTEMER  $TEMPERATUR $MASKINVARE -yyq
echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
}


sjekkbios()  {
# Sjekker om man kan installere BIOS oppdateringer fra Ubuntu eller ikke	
if fwupdate -s | grep  -qw "are supported"
then
# BIOS-en din har støtte for å kunne installere firmware fra Ubuntu med fwupdate  	
echo "-------------------------------------------------------------------------------------------------------------------"
echo "UEFI/BIOS-en firmware din kan oppdaters med help av fwupdate fra Ubuntu"
echo "------------------------------------------------------------------------------------------------------------------"
echo "Sjekke ut "$FWUPSUPPORTETURL" for mer info om oppdateringer rundt firmware fra forskjelige produsenter"
echo "------------------------------------------------------------------------------------------------------------------"
sleep 2
else	
fwupdate -s | grep -qw "not supported"	
echo "-------------------------------------------------------------------------------------------------------------------"
echo -e "\e[1;31m Du kan IKKE oppdatere UEFI/BIOS-en firmware din fra Ubuntu \e[0m"
echo "------------------------------------------------------------------------------------------------------------------" 
echo "------------------------------------------------------------------------------------------------------------------"
echo "Sjekke ut "$FWUPSUPPORTETURL" for mer info om oppdateringer rundt firmware"
echo "------------------------------------------------------------------------------------------------------------------"
sleep 2
sudo apt-get purge $MASKINVARE -yyq
fi
}


setupzsh() {
# Sjekker om bash er standard shell

if echo "$0" | grep "bash"
then
# Setter zsh som standard shell i sted for bash	
echo "-----------------------------"
echo "Setter zsh som standard shll" && chsh -s $(which zsh)
echo "-----------------------------"
else
echo "$0" | grep "zsh"
echo "----------------------------------"
echo "zsh er alt satt som standard shell"
echo "----------------------------------"
fi
}

setupssh() {
# Sjekker om Secure Shell (SSH) er satt opp 

if test -d $HOME/.ssh/
then
echo "--------------------" 
echo "SSH er alt satt opp"
echo "--------------------" 
else 
echo "--------------------" 
echo "Setter opp SSH"
echo "--------------------"	
mkdir -p "$HOME/.ssh" && ssh-keygen
fi
} 

# Sjekker for ikke gyldig argument
if  [ -n "$1"  ]; then

echo "reinstallsjon-script-for-ubuntu Feil: ikke gyldig argument. Prøv reinstallsjon-script-for-ubuntu-hjelp' for mer info."
    exit 1
fi





reinstallsjon-script-for-ubuntu
sjekkbios
setupzsh
setupssh
amazon
canonicalpakker
gamlepakker
ubuntugnome
gnome3
gnomeshellextensions
tracker
kdeconnectserver
gnomeshell
utseende
grafikkkort
virtualisering
checkvirtualbox
virtualbox
appimagepakker
pakkerformater
flatpakgtktema
skjermer
gnome3flatpak
temperatur-setup
FJERNDVD
avslutter


# Må fikses opp i 

#&& wget -O KeePassXC.DIGEST "$KEEPASSXCAPPIMAGESHA" -P "$Nedlastingermappe"
#echo "---------------------------------------------------------------"
#echo "Sjekker sha256sum for KeePassXC.Appimage"
#echo "---------------------------------------------------------------"
#if sha256sum -c KeePassXC.AppImage KeePassXC.DIGEST 2>1 | grep --color=always  "OK"
#then 
#echo "---------------------------------------------------------------"
#echo "sha256sum for KeePassXC.Appimage er riktig"
#echo "---------------------------------------------------------------"
#else 
#echo "---------------------------------------------------------------"
#echo "sha256sum for KeePassXC.Appimage er IKKE riktig"
#echo "---------------------------------------------------------------"	
#fi
