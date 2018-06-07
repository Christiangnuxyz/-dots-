#!/bin/bash

# Reinstallsjon script for Ubuntu

# Set BASH til avslutte scripet hvis feil er funnet
#set-e
#
# laptop-mode-tools powertop

# Må se opp det litt mer 
 
# Variabler:

# Reinstallsjon script for Ubuntu

# Set BASH til avslutte scripet hvis feil er funnet
#set-e
#
# laptop-mode-tools powertop

# Må se opp det litt mer 
 


# Variabler:
SISTENDRET="2.juni.2018"
NYTT="Lagt til muligheten for å sjekke temperatur på datamaskinen sin" 
VER="Versjon 1.8.5"
OS="Testet sist på Ubuntu 18.04 LTS"

# Pakker 

NORSK="language-pack-nb-base language-pack-gnome-nb-base libreoffice-l10n-nb firefox-locale-nb"
CANONICAL="thunderbird* cheese simple-scan gnome-mines aisleriot gnome-sudoku gnome-mahjongg brasero orca gksu"
BIONICBEAVER="suru-icon-theme gnome-usage mkchromecast"
BASIC="gnome-system-monitor pavucontrol synaptic software-properties-common xboxdrv terminator transmission-gtk snap snapd flatpak apparmor gnome-font-viewer"
SIKKERHET="gufw chkrootkit rkhunter keepassxc gpgv2 gtkhash kleopatra seahorse"
HARDDISK="bleachbit gparted gnome-disk-utility exfat-utils exfat-fuse hfsprogs testdisk"
MEDIA="vlc browser-plugin-vlc libvlc-bin youtube-dl gimp audacity geary libreoffice shutter gnome-todo tomboy"
TILLEGG="caffeine alarm-clock-applet"
UTSEENDE="gtk-chtheme qt4-qtconfig qt5-style-plugins qt5ct"
IKONER="moka-icon-theme pocillo-icon-theme"
TEMA="arc-theme"
UTVIKLING="filezilla zeal gnome-boxes grsync sqlitebrowser"
TERMINAL="neofetch htop zsh powerline unzip shellcheck curl git buku openssh-client rsync net-tools"
FJERNSTRYING="openssh-server remmina"
EULA="ubuntu-restricted-extras steam libsdl2-2.0-0 libdvd-pkg virtualbox virtualbox-ext-pack"
CSV="latexila pandoc wkhtmltopdf"
APPLE="pommed"
VALGFRIT="apport-gtk ubuntu-report"
SPILL="pcsx2"
FONTS="fonts-firacode"
TEMPERATUR="lm-sensors hddtemp psensor"


# Laptop pakker

LAPTOP="cheese simple-scan qtqr"
LAPTOPBATTERI="tlp tlp-rdw gnome-power-manager"
BLUETOOTHPAKKER="bluez bluez-tools bluetooth"

# Telefon pakker

ANDROID="adb"
ANDROIDSTUDIO="qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils" 

# GNOME 3 pakker 

GNOME="gnome-session gnome-session-wayland gnome-control-center gnome-tweak-tool gnome-shell-extensions dconf-editor dconf-cli chrome-gnome-shell gnome-software-plugin-flatpak  gnome-software-plugin-snap seahorse-nautilus"
GNOMEEXTENSION="gnome-shell-extension-weather gnome-shell-extension-dashtodock gnome-shell-extension-mediaplayer gnome-shell-extension-caffeine"
GNOMEVPN="network-manager-openvpn-gnome network-manager-pptp-gnome network-manager-l2tp-gnome"

# Sjekker versjon av GNOME shell 


GNOMESHELLVERSJON="3.28|3.27|3.26|3.25|3.24"

# GNOME Gsettings 
GTK="Arc-Dark"
GNOMEIKON="Pocillo"

# Mapper
AMAZON="/usr/share/applications/ubuntu-amazon-default.desktop" 

# URL-er
VIRTALBOXURL="https://www.virtualbox.org/wiki/Downloads" 


# Funksjoner
 reinstallsjon-script-for-ubuntu-hjelp() {

cat << _EOF_

 Reinstallsjon script for Ubuntu og Ubuntu baserte distroer som Linux Mint osv
 Reinstallere pakker som Christian bruker på sine Ubuntu maskinere 

 Kommandoer:
    Reinstallsjon = reinstallere alt utenom om Firefox.

    Kjøring av "Reinstallsjon script for Ubuntu" reinstallere alt utenom om Firefox.

    Med å legg til "--laptop" valget installere du disse pakkene $LAPTOP
    Med å legg til "--spill"  valget installere du disse pakkene $SPILL
    Med å legg til "--androidtelefon" valget installere du disse pakkene $ANDROID for avanserte brukere
    Med å legg til "--resetfirefox" tilbakestiler du firefox til sånn firefox kommer fra Mozilla
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
    Med å legg til "--spill"  valget installere du disse pakkene $SPILL
    Med å legg til "--androidtelefon" valget installere du disse pakkene $ANDROID for avanserte brukere
    Med å legg til "--resetfirefox" tilbakestiler du firefox til sånn firefox kommer fra Mozilla
    reinstallsjon-script-for-ubuntu-help "--help"


_EOF_

}

    if
	[ "$1" == "--help" ]; then
	reinstallsjon-script-for-ubuntu-help
	exit
	fi

apple() {
echo "---------------------------------------------------------------------------------------------"
echo "Installer pakker for dine Apple produkter" 
echo "---------------------------------------------------------------------------------------------"
sudo apt-get install $APPLE -yyq 
 }

if  [ "$1" == "--apple" ];then
	apple
	exit
fi 

laptop() {
	echo "---------------------------------------------------------------------------------------------"
	echo "Installer pakker som er anbefalt for Bærbar PC/Laptop"
	echo "---------------------------------------------------------------------------------------------"
	sudo apt-get install $LAPTOP -yyq  
	batteri()  {
	echo "---------------------------------"
	echo "Sjekker om laptop-en har batteri"
	echo "---------------------------------"
	if  upower -i /org/freedesktop/UPower/devices/battery_BAT0 grep -E "state|to\ full|percentage"
		then echo "Installere $LAPTOPBATTERI pakker" && sudo apt-get install $LAPTOPBATTERI -yyq
	else 
	echo "------------------------------------------------"
	echo -e "\e[1;31m  Du har IKKE batteri på datamaskinen \e[0m" && sudo apt-get purge $LAPTOPBATTERI -yyq  >/dev/null 
	echo "-------------------------------------------------"
    fi 
    }

	tlp() {
	echo "--------------------------------------------------------------------------------------------------------------"
	if echo "Hvis laptop-mode-tools er instalert ersatt det med tlp" && dpkg --get-selections | grep -qw laptop-mode-tools 
	echo "--------------------------------------------------------------------------------------------------------------"
		then 
		sudo apt-get purge laptop-mode-tools -yyq  >/dev/null 
	else
		echo "---------------------------------------------------------------------"
	    echo "Du har IKKE laptop-mode-tools installert derfor blir den ikke fjernet"
		echo "---------------------------------------------------------------------"
	fi 
	} 

    bluetooth() {
	 # Sjekker om laptopen har bluetooh 

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
tlp
bluetooth
exit
fi

androidtelefon() {
    echo "---------------------------------------------------------------------------------------------"
	echo "Installer pakker for avanserte Android brukere"
	echo "---------------------------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------------------------"
	echo "Installer disse pakkene $ANDROID $ANDROIDSTUDIO"
	echo "---------------------------------------------------------------------------------------------"
    sudo apt-get install $ANDROID $ANDROIDSTUDIO  -yyq 
exit
}

if  [ "$1" == "--androidtelefon" ];then
	androidtelefon
	exit
    fi

spill()  {
    echo "---------------------------------------------------------------------------------------------"
	echo "Installer pakker for forskjelige spill"
	echo "---------------------------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------------------------"
	echo "Installer disse $SPILL pakkene"
	echo "---------------------------------------------------------------------------------------------"
    sudo apt-get install $SPILL -yyq 
exit
}

if  [ "$1" == "--spill" ];then
	spill
	exit
    fi


canonicalfirefox() {
echo "Sjekker om firefox er installert" && dpkg --get-selections | grep -qw firefox
while true;  do
read -r -p  "Vil du ta å reste firefox til sånn som firefox er når den kommer fra Mozilla eller vil du forsatte å bruke Canonical sin?, Det vil fjerne alle ting du har endret på i firefox så ta backup av $HOME/.mozilla/firefox/ $HOME/.mozilla/firefox/profiles.ini  (j/n)?" valgfirefox
case "$valgfirefox" in 
  [Jj]* ) echo "Rester firefox"; rm  "$HOME"/.mozilla/firefox/*.default -r >/dev/null && rm "$HOME"/.mozilla/firefox/profiles.ini >/dev/null;
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


amazon() {
echo "Fjerner AMAZON-ikonet...."  >/dev/null
if [ ! -f $AMAZON ]
then echo "file " >/dev/null  $AMAZON " AMAZON-ikonet finnes ikke," >/dev/null
else "file " $AMAZON " finnes."; echo "Fjerner AMAZON-ikonet...." && sudo rm -rf $AMAZON  >/dev/null
fi
} 

canonicalpakker() {
# Sjekker om du Canonical sin pakker er i Ubuntu disotren din

if dpkg -l | grep -E  "gstreamer1.0-fluendo-mp3|gnome-shell-extension-ubuntu-dock|ubuntu-web-launchers"
then 
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
echo "Fjerner pakker som Canonical putter i Ubuntu som standard og erstatter gnome-shell-extension-ubuntu-dock med gnome-shell-extension-dashtodock"
echo "----------------------------------------------------------------------------------------------------------------------------------------------"	
sudo apt-get purge gstreamer1.0-fluendo-mp3 gnome-shell-extension-ubuntu-dock ubuntu-web-launchers -yyq >/dev/null
else 
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
echo -e "\e[1;31m Du bruker IKKE en Ubuntu distro med pakker som Canonical putter i som standard \e[0m"
echo "----------------------------------------------------------------------------------------------------------------------------------------------"	

fi 

}




gnome3() {
echo "---------------------------------------------------"
echo "Sjekker Skrivebordsmiljø ditt"
echo "---------------------------------------------------"
if echo "$XDG_CURRENT_DESKTOP" | grep "GNOME" 
	then
	echo "---------------------------------------------------------"
	echo "Installere GNOME 3 pakker fordi Skrivebordsmiljø er GNOME" && sudo apt-get install $TEMA $IKONER $GNOME $GNOMEEXTENSION -yyq
    echo "---------------------------------------------------------------------------------------------------------------"
    echo "Aktivere minimize siden det ikke er aktivert som standard i GNOME når du klikker på et ikonet til et program"
    gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
    echo "---------------------------------------------------------------------------------------------------------------"
    echo "Installere støtte for VPN i GNOME 3" && sudo apt-get install $GNOMEVPN -yyq
    echo "------------------------------------------------------------------------------------------------------"
    echo "Ønsker du og søke etter filer med gnome 3 sånn som windows utforsker?" && sudo apt-get install tracker
if dpkg -l | grep -E "metadata database, indexer and search tool" > /dev/null
    then
    echo "-------------------------------" 
    echo "Oppdatere tracker sin database"
    echo "-------------------------------"
    	sudo updatedb
    	else
    echo "-----------------------------------------------------------------"	 
    echo "tracker er ikke installert så ingen vist å oppdatere databasen nå"
    echo "-----------------------------------------------------------------"
fi
    echo "------------------------------------------------------------------------------------------------------"
    echo "---------------------------------------------------------------------------------------------------------------------"
    echo "Setter $GNOMEIKON $TEMA som ikon tema og GTK+ tema det kan endres tilbake med gnome-tweaks eller dconf vis du er hardcore" 
    echo "---------------------------------------------------------------------------------------------------------------------"
    gsettings set org.gnome.desktop.interface gtk-theme $GTK
    gsettings set org.gnome.desktop.interface icon-theme $GNOMEIKON
    gsettings set org.gnome.desktop.wm.preferences theme $GTK
    gsettings set org.gnome.shell.extensions.user-theme name $GTK
else
    echo "---------------------------------------------------------"
    echo "Skrivebordsmiljø ditt er IKKE GNOME"
    echo "---------------------------------------------------------"

fi
} 

gnomeshell() {
echo "-----------------------------------------------"	
echo "Sjekker om du har GNOME shell 3.24 og oppvoer"
echo "--------------------------------------------"
if gnome-shell --version | grep -E "$GNOMESHELLVERSJON"
	then 
	echo "--------------------------"
	echo "Aktivere GNOME Night mode" && gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true 
	echo "--------------------------------------"
	echo "Fjener redshift siden du bruker GNOME 3" && sudo apt-get remove gnome-shell-extension-redshift redshift redshift-gtk -yyq  >/dev/null 
    echo "--------------------------------------"
else
    echo "------------------------------------------------------------------------------------------" 
	echo "Installere gnome-shell-extension-redshift fordi du ikke har night mode i GNOME shell 3.24" && sudo apt-get install gnome-shell-extension-redshift  redshift redshift-gtk  -yyq 
	echo "-----------------------------------------------------------------------------------------" 
fi 
} 


bionicbeaver() { 
echo "-------------------------------------"
echo "Sjekker om dette er Ubuntu 18.04"
echo "-------------------------------------"
if lsb_release -d | grep  -q -ic --color "Ubuntu 18.04 LTS"
	then  
	echo "-----------------------------------"
	echo "Installere pakker for Ubuntu 18.04" && sudo apt-get install $BIONICBEAVER -yqq 	
    echo "-----------------------------------"
else 
 echo "---------------------------------------------"
 echo -e "\e[1;31m Du bruker IKKE Ubuntu 18.04 \e[0m"
 echo "----------------------------------------------"
fi
} 

grafikkkort() {
echo "---------------------------------------------"
echo "Sjekker om du har et NVIDIA grafikkkort" 
echo "---------------------------------------------"
if  lspci | grep -ic --color "NVIDIA" >/dev/null
then
 echo "------------------------------------------------------"
 echo "Du har et NVDIA grafikkkort installere nvidia-settings" && sudo apt-get install nvidia-settings -yyq
 echo "------------------------------------------------------"
else 
 echo "---------------------------------------------"
 echo -e "\e[1;31m Du har IKKE et NVDIA grafikkkort \e[0m" && sudo apt-get purge nvidia-settings -yyq >/dev/null 
 echo "----------------------------------------------"
fi
} 

virtualisering() {
echo "-------------------------------------------------"
echo "Sjekker om Virtualisering er aktivert eller ikke"
if sudo kvm-ok | grep "can be used" >/dev/null
echo "-------------------------------------------------"	
then 
echo "-------------------------------"
echo "Du har Virtualisering aktivert" 
echo "-------------------------------"
else
echo "---------------------------------------------------------------------------------------" 
echo -e "\e[1;31m Du har ikke Virtualisering aktivert sjekk om du kan aktivere Virtualisering i UEFI/BIOS \e[0m" sudo apt-get purge virtualbox virtualbox-ext-pack gnome-boxes -yyq
echo "----------------------------------------------------------------------------------------"
fi 
} 

virtualbox() {
echo "---------------------------------------"
if echo "Sjekker om virtualbox er installert" && dpkg --get-selections | grep -qw virtualbox
echo "---------------------------------------------------------------"
then 
groups | grep -ic "vboxusers" > /dev/null 
 echo "---------------------------------------"
 echo "$USER er alt i vboxusers"  
 echo "---------------------------------------"
else 
echo "---------------------------------------------------------------"	
echo "Legger til brukeren din" && sudo adduser "$USER" vboxusers
echo "---------------------------------------------------------------"
fi
} 

temperatur-setup() { 
    echo "--------------------------------------------------------------"
if echo "Setter opp muligheten for å sjekke temperatur på datamaskinen"
	echo "--------------------------------------------------------------"
then
	sudo sensors-detect && sensors 
    echo "--------------------------------------------------------------"
	echo "Starter kmod for sensors"
	echo "--------------------------------------------------------------"
	/etc/init.d/kmod start
else 
	sudo sensors | grep "Adapter"
	sudo sensors
fi
} 


avslutter()  {
echo "---------------------------------------------------------------------------------------------"
echo "Oppdater snap" && snap refresh
echo "---------------------------------------------------------------------------------------------"
echo "Legger til flathub støtte"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Oppdater flatpak"
flatpak update
echo "----------------------------------------------------------------------------------------------------"
echo "Følgende pakker ble automatisk installert og er ikke lenger påkrevet" && sudo apt-get autoremove -yyq >/dev/null
echo "Reinstallsjon script for Ubuntu $VER ER FERDIG PC-EN DIN BURDE STARTES OMIGJEN SNAREST"
echo "---------------------------------------------------------------------------------------------"
echo "Vil du restarte PC-en din nå?"  
while true;  do
read -r -p  "Vil du ta omstart av PC-EN (j/n)?" valg
case "$valg" in 
  [Jj]* ) echo "Omstart om 30 sek" & sleep 30 && reboot ;; 
  [Nn]* ) echo "nei"; exit;; 
  * ) echo "ikke et svar";;
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
echo "Sist endret $SISTENDRET"
echo "----------------------------------------------------"
echo "Starter en full system oppdatering..."
echo "----------------------------------------------------"
sudo apt-get update -yyq
sudo apt-get full-upgrade -yyq
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har en laptop?, legg til --laptop for å installere de anbefalt pakkene"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "Vil du IKKE rappotere feil til Ubuntu,hvis ja fjern den pakken $VALGFRIT" && sudo apt-get remove $VALGFRIT
echo "Vil du kun fjern styre denne PC-en,hvis ja installer disse pakkene" && sudo apt-get install $FJERNSTRYING
echo "--------------------------------------------------------------------------------------------------------------------"
echo "Vil du bruke PC-en din på norsk?,hvis ja installer disse pakkene" && sudo apt-get install $NORSK
echo "--------------------------------------------------------------------------------------------------------------------"
echo "Fjerner disse $CANONICAL Ubuntu pakkene jeg IKKE liker..."  && sudo apt-get purge $CANONICAL -yqq
echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Du må godta EULA/Lisensen til disse $EULA for å kun installere alle av dem for virtualbox kan det være lurt og sjekke $VIRTALBOXURL for nyere versjoner av virtualbox" && sudo apt-get install $EULA
echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Installer alle pakken som er free software... " && sudo apt-get install $FONTS $BASIC $SIKKERHET $HARDDISK $MEDIA $IKONER $TEMA $UTSEENDE $CSV $UTVIKLING $TILLEGG $TERMINAL $TEMPERATUR -yqq
echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
}

setupzsh() {
if echo "$0" | grep "bash" 
then
echo "-----------------------------"
echo "Setter zsh som standard shll" && chsh -s $(which zsh)
echo "-----------------------------"
else
echo "$0" | grep "zsh" 
echo "---------------------------------"
echo "zsh er alt satt som standard shell"
echo "----------------------------------"
fi
}

# Sjekker for ikke gyldig argument
if  [ -n "$1"  ]; then

echo "reinstallsjon-script-for-ubuntu Feil: ikke gyldig argument. Prøv reinstallsjon-script-for-ubuntu-hjelp' for mer info."
    exit 1
fi

reinstallsjon-script-for-ubuntu
setupzsh
amazon
canonicalpakker
gnome3
gnomeshell
bionicbeaver
grafikkkort
virtualisering
virtualbox
temperatur-setup
avslutter
