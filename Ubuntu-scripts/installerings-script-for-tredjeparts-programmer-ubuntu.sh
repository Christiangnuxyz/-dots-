#!/bin/bash

# Set BASH til å avslutte scripet og avslutter

#set -e

# Variabler
SISTENDRET="21.mai.2018"
NYTT="Lagt til muligheten for oppdatere discord lettere og fikset på små ting"
VER="Versjon 1.7.5"
OS="Testet sist på Ubuntu 17.04 17.10 18.04"


# Mapper
Nedlastingermappe=$(xdg-user-dir DOWNLOAD)

# Ikke i bruk 
#cyptomappe="$HOME/Dokumenter/Kryptovaluta-klienter"

# Pakker
OHMYZSHPAKKER="zsh curl"
I3PAKKER="chromium-browser"
PAKKER="libcurl4 libc++1 git wget tar"
MINECRAFTPAKKER="java-common default-jre default-jre-headless openjdk-8-jre"
GNOME="gnome-tweak-tool" 
# URL-er
DISCORD="https://discordapp.com/api/download?platform=linux&format=deb"
# Må endres når ny versjon kommer 
DISCORDVERSJON="0.0.5" 

# URL-ene endre seg ikke 

CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" 
VSCODE="https://go.microsoft.com/fwlink/?LinkID=760868"


# Trezor URL-er 
TREZORWALLET="https://wallet.trezor.io/#/bridge"
TREZORBRIDGE="https://wallet.trezor.io/data/bridge/2.0.13/trezor-bridge_2.0.13_amd64.deb"
TREZORUDV="https://wallet.trezor.io/data/udev/trezor-udev_1_all.deb"

# Virtualbox URL-er 
VIRTUALBOX="https://download.virtualbox.org/virtualbox/5.2.10/virtualbox-5.2_5.2.10-122088~Ubuntu~bionic_amd64.deb"
VIRTUALBOXEXT="https://download.virtualbox.org/virtualbox/5.2.10/Oracle_VM_VirtualBox_Extension_Pack-5.2.10.vbox-extpack"

# Spill URL-er
MINECRAFT="https://launcher.mojang.com/mc-staging/download/Minecraft_staging.deb"
MINECRAFTJAVA="http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar"
POKEMMO="https://pokemmo.eu/download_file/?id=4"
TECHNICLAUNCHER="http://launcher.technicpack.net/launcher4/349/TechnicLauncher.jar"
FTBLAUNCHER="http://ftb.cursecdn.com/FTB2/launcher/FTB_Launcher.jar"
ATLAUNCHER="https://www.atlauncher.com/download/jar"

# Deb URL-er
LANSHARE="https://github.com/abdularis/LAN-Share/releases/download/1.2.1/lanshare_1.2.1-1_amd64.deb"

# Appimage URL-er 
ETCHER="https://github.com/resin-io/etcher/releases/download/v1.4.4/etcher-electron-1.4.4-linux-x64.zip"

#  Sletter nå pakken er ferdig nedlastet
EULADEBINNSTALLERINGSPAKKEN="trezor-bridge.deb trezor-udev.deb"

# GTKtheme 
XARCPLUS="https://github.com/LinxGem33/X-Arc-Plus/releases/download/v1.4.7/osx-arc-collection_1.4.7_amd64.deb"
ELEMENTARYOSPLUS="https://github.com/mank319/elementaryPlus.git"
ANT="https://github.com/EliverLara/Ant/archive/master.zip"
ANTDRACULA="https://github.com/EliverLara/Ant-Dracula/archive/master.zip"


# GTKtheme tar filer 

UNTIEDGNOME="https://github.com/godlyranchdressing/United-GNOME/raw/master/United-Latest.tar.gz"
LACAPITAINEICONETHEME="https://github.com/keeferrourke/la-capitaine-icon-theme.git"
SURUPLUS="https://github.com/Magog64/SURU-PLUS.git"
ARC="https://github.com/horst3180/arc-icon-theme"
# Sublimetheme 
MATERIALTHEME="https://github.com/equinusocio/material-theme/archive/v4.1.5.zip"

# GNOME Gsettings 

# Mac liknede GTK theme 

MACGTK="OSX-Arc-White"
MACIKON="la-capitaine-icon-theme"



# Ubuntu 

UBUNTUGTK="United-Ubuntu-Dark"
UBUNTUIKON="SURU-PLUS"

# Funskjoner

i3() {
echo "------------------------------"
echo "Sjekker om Skrivebordsmiljø ditt er i3wm"
echo "-----------------------------"
if  echo "$XDG_CURRENT_DESKTOP" | grep "i3"
then
	echo "--------------------------------------------------"
	echo "Installere $I3PAKKER fordi i3wm ikke liker discord" && sudo apt-get install $I3PAKKER -yyq
    echo "--------------------------------------------------"
    echo "Lager en .desktop fil for Discord for i3wm"
    echo "--------------------------------------------------"
 cd "$(xdg-user-dir DESKTOP)"  || exit 
 touch "discord-i3wm.desktop" 
 { 
echo "#!/usr/bin/env xdg-open"
echo "[Desktop Entry]"
echo "Version=1.0"
echo "Encoding=UTF-8"
echo "Terminal=false"
echo "Type=Application"
echo "Name[nb]=Discord for i3wm"
echo "Comment=Discord for i3wm" 
echo "URL=https://discordapp.com/channels/@me"
echo "Exec=chromium-browser --app=https://discordapp.com/channels/@me"
echo "Icon=chrome-ccoilgnipdhfigboifpklcjlgmicnkmb-Default"
} >> discord-i3wm.desktop
chmod +x discord-i3wm.desktop
else 
echo "-----------------------------------"
echo "Skrivebordsmiljø ditt er IKKE i3wm"
echo "----------------------------------"
fi
} 

mac() {
	echo "----------------------------------------------------------------"
	echo "Ønsker du gtk som matcher the Apple følesen og Brave netteseren"
	echo "----------------------------------------------------------------"
cd $HOME || exit 
mkdir .themes 
sleep 2  
cd "$Nedlastingermappe" || exit 
wget -O Ant.zip $ANT && wget -O Antdracula.zip $ANTDRACULA 
unzip Ant.zip && unzip Antdracula.zip
mv Ant-master Ant && mv Ant-Dracula-master Ant-Dracula
mv Ant Ant-Dracula ~/.themes  
sleep 10
cd $HOME || exit 
mkdir .icons  
sleep  
cd ~/.icons || exit 
git clone $LACAPITAINEICONETHEME 
    
echo "--------------------------------------------------------------------------------"
echo "xarchplus har blitt avslutt så skulle tema ikke funke må du finne et annet tema"
echo "--------------------------------------------------------------------------------"
cd "$Nedlastingermappe" || exit 
if dpkg --get-selections | grep -qw "osx-arc-collection"
    then 
        echo "----------------------------------------"
        echo "Du har alt osx-arc-collection installert"
        echo "----------------------------------------"
else 
echo "---------------------------------------------------"
echo "Laster ned og osx-arc-collection og installere"
echo "----------------------------------------------------"     
wget -O osx-arc-collection_1.4.7_amd64.deb $XARCPLUS && sudo dpkg -i osx-arc-collection_1.4.7_amd64.deb 
rm $Nedlastingermappe/osx-arc-collection_1.4.7_amd64.deb
fi  
}	

macgnome3() {
echo "---------------------------------------------------"
echo "Sjekker Skrivebordsmiljø ditt"
echo "---------------------------------------------------"
if  echo "$XDG_CURRENT_DESKTOP" | grep "GNOME" 
	then 
    echo "---------------------------------------------------------------------------------------------------------------------"
    echo "Setter ikon tema og GTK+ tema det kan endres tilbake med gnome-tweaks eller dconf vis du er hardcore" 
    echo "---------------------------------------------------------------------------------------------------------------------"
    sudo apt-get install $GNOME -yyq
    gsettings set org.gnome.desktop.interface gtk-theme $MACGTK
    gsettings set org.gnome.desktop.interface icon-theme $MACIKON
    gsettings set org.gnome.desktop.wm.preferences theme $MACGTK
    gsettings set org.gnome.shell.extensions.user-theme name $MACGTK
    else 
    echo "---------------------------------------------------------"
    echo "Skrivebordsmiljø ditt er IKKE GNOME"
    echo "---------------------------------------------------------"
fi 
   }	



if  [ "$1" == "--apple" ];then
	mac
	macgnome3 
	exit 
fi

bionicbeaver-setup() { 
echo "-------------------------------------"
echo "Sjekker om dette er Ubuntu 18.04"
echo "-------------------------------------"
if lsb_release -d | grep  -q -ic --color "Ubuntu 18.04 LTS"
    then  
    echo "----------------------------------------------"
    echo "Laster ned SURU-PLUS ikon tema for Ubuntu 18.04"     
    echo "----------------------------------------------"
    sudo apt-get install file-roller suru-icon-theme $GNOME -yyq
    cd  "$HOME" || exit 
	mkdir .icons 
    cd "$HOME/.icons/" || exit 
git clone $SURUPLUS
    echo "-------------------------------------------------------"
    echo "SURU-PLUS er ferdig pakket ut" 
    echo "-------------------------------------------------------"
    sleep 5 
    echo "----------------------------------------------------"
    echo "Laster ned United-GNOME GTK thema for Ubuntu 18.04"     
    echo "----------------------------------------------------"
    cd "$HOME" || exit 
    mkdir .themes
    cd "$HOME/.themes/"  || exit
    wget $UNTIEDGNOME -O United-GNOME.tar.gz
    tar xvf United-GNOME.tar.gz >/dev/null
    echo "-------------------------------------------------------"
    echo " United-GNOME er ferdig pakket ut" 
    echo "-------------------------------------------------------"
else 
 echo "-----------------------------"
 echo  "Du bruker IKKE Ubuntu 18.04"
 echo "-----------------------------"
fi
} 

gnome3() {
echo "---------------------------------------------------"
echo "Sjekker Skrivebordsmiljø ditt"
echo "---------------------------------------------------"
if  echo "$XDG_CURRENT_DESKTOP" | grep "GNOME" 
    then 
    echo "---------------------------------------------------------------------------------------------------------------------"
    echo "Setter ikon tema og GTK+ tema det kan endres tilbake med gnome-tweaks eller dconf vis du er hardcore" 
    echo "---------------------------------------------------------------------------------------------------------------------"
    sudo apt-get install $GNOME -yyq
    gsettings set org.gnome.desktop.interface gtk-theme $UBUNTUGTK
    gsettings set org.gnome.desktop.interface icon-theme $UBUNTUIKON
    gsettings set org.gnome.desktop.wm.preferences theme $UBUNTUGTK
    gsettings set org.gnome.shell.extensions.user-theme name $UBUNTUGTK
    else 
    echo "---------------------------------------------------------"
echo -e "\e[1;31m  "Skrivebordsmiljø ditt er IKKE GNOME" \e[0m"
    echo "---------------------------------------------------------"
fi 
   }    




Utseende() {
echo "-----------------------------------------------------------"
echo "Installere Arc ikon tema hvis du har arc-theme installert"
echo "------------------------------------------------------------" 
if  dpkg -l | grep -E "arc-theme|moka-icon-theme"
	then 
	cd "$HOME" || exit 
	mkdir .icons 
	cd ~/.icons || exit 
	git clone $ARC --depth 1 && cd "arc-icon-theme" || exit
	mv Arc ~/.icons 
else 
 echo "-----------------------------------"
 echo  "Du har ikke arc-theme installert"
 echo "-----------------------------------"
fi
} 	 



spill-og-mods() {
cd "$Nedlastingermappe" || exit 
echo "-------------------------------------------------------------------------------------"
echo "Installere PokeMMO"
wget -O PokeMMO.deb "$POKEMMO" && sudo dpkg -i PokeMMO.deb
echo "-------------------------------------------------------------------------------------"
}

minecraft()  {
sudo apt-get install $MINECRAFTPAKKER -yyq
cd "$Nedlastingermappe" || exit 
echo "Minecraft fra Deb og Java versjonen" && wget -O Minecraft.deb $MINECRAFT  && sudo dpkg -i Minecraft.deb && wget -O Minecraft.jar $MINECRAFTJAVA
echo "-----------------------------------"
echo "Installere Minecraft Modpacker"
echo "-------------------------------------------------------------------------------------"
	wget -O technic-launcher.jar $TECHNICLAUNCHER && wget -O ftb-launcher.jar $FTBLAUNCHER
	mkdir "$HOME"/at-launcher/ && cd "$HOME"/at-launcher/ || exit 
	wget -O at-launcher.jar $ATLAUNCHER
	}

	spill-og-mods-avslutt()  {
	echo "-------------------------------------------------------------------------------------"
	echo "Da er alt for spill-og-mods"
	echo "-------------------------------------------------------------------------------------"
	exit
	}

if  [ "$1" == "--spill-og-mods" ];then
	spill-og-mods
	minecraft
	spill-og-mods-avslutt
	exit
fi

LAN() {
    echo "---------------------------------------------"
    echo "Installere programmer praktisk for LAN party"
    echo "---------------------------------------------"
    cd "$Nedlastingermappe" || exit 
    echo "---------------------------------------------"
    echo "Laster ned og installere lanshare"
    echo "---------------------------------------------"
    wget -O lanshare.deb $LANSHARE && sudo dpkg -i lanshare.deb
}
if  [ "$1" == "--lan" ];then
    LAN


# Fikse senere
EULA()  {
cd "$Nedlastingermappe" || exit 
echo "---------------------------------------------------------"
echo "Du må ha kjøpt EULA/Lisensen til for disse programvarene"
echo "---------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Laster ned trezor sin udev pakke for trezor installere den og sjekk ut $TREZORWALLET for en oppdatering til bridge"
echo "-------------------------------------------------------------------------------------------------------------------"
wget -O trezor-udev.deb $TREZORUDV && sudo dpkg -i trezor-udev.deb
wget -O trezor-bridge.deb $TREZORBRIDGE  && sudo dpkg -i trezor-bridge.deb
echo "-----------------------------------------------------------------------"
sublimetext() {
if dpkg --get-selections | grep -qw "sublime-text"
    then echo "Du har alt sublime-text installert"
else      
echo "------------------------------"
echo "Installere Sublime text stable"
echo "------------------------------"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get install apt-transport-https sublime-text -yyq
echo "------------------------------------------------------------------------------------"
fi 

echo "Laster ned Material Theme for sublime-text-3"
cd "$HOME"/.config/sublime-text-3/Packages || exit 
wget -O Material-Theme.zip $MATERIALTHEME
unzip Material-Theme.zip >/dev/null && mv material-theme-4.1.5 Material\ Theme/ >/dev/null
echo "--------------------------------------------------------"
echo "HUSK og Preferences > Browse packages... i Sublime Text"
echo "-------------------------------------------------------"
rm Material-Theme.zip
} 
cd "$Nedlastingermappe" || exit 
echo "Fjener disse deb pakkene $EULADEBINNSTALLERINGSPAKKEN" 
rm "$EULADEBINNSTALLERINGSPAKKEN"
echo "-----------------------------------------------------------------------"
}

if  [ "$1" == "--EULA" ];then
	EULA
	sublimetext
	exit
fi

virtualboxsetup() {
cd "$Nedlastingermappe" || exit 
echo "-------------------------------------------------"	
echo "Laster ned Virtualbox & VirtualBox Extension Pack"
echo "-------------------------------------------------"
wget -O virtualbox.deb "$VIRTUALBOX" && wget -O virtualbox-ext.vbox-extpack "$VIRTUALBOXEXT"
sudo dpkg -i virtualbox.deb && echo "Installere virtualbox"
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
echo "----------------------------------------------------------------------------------------------------" 
echo -e "\e[1;31m  Du har ikke Virtualisering aktivert sjekk om du kan aktivere Virtualisering i UEFI/BIOS \e[0m" &&  sudo apt-get purge virtualbox virtualbox-ext-pack -yyq
echo "-----------------------------------------------------------------------------------------------------"
fi 
} 

sjekk-virtualbox() {
echo "----------------------------------------------------------------"
if echo "Sjekker om virtualbox er installert" && dpkg --get-selections | grep -qw "virtualbox"
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

virtualbox-avslutt()  {
cd "$Nedlastingermappe" || exit 
echo "-------------------------------------------------------------------------------------"
echo "Da er alt med Virtualbox ferdig"
echo "-------------------------------------------------------------------------------------"
rm virtualbox.deb 
exit
} 

if  [ "$1" == "--virtualbox" ];then
virtualboxsetup
virtualisering
sjekk-virtualbox
virtualbox-avslutt	
exit
fi

snarveier() {
echo "----------------------------------------------------------------------"
echo "Lager snarvei til ProtonMail & PocketCasts på $(xdg-user-dir DESKTOP)" 
echo "----------------------------------------------------------------------"
 cd "$(xdg-user-dir DESKTOP)"  || exit 
 touch "ProtonMail.desktop"
  {  
echo "#!/usr/bin/env xdg-open"
echo "[Desktop Entry]"
echo "Version=1.0"
echo "Terminal=false"
echo "Type=Application"
echo "Name=ProtonMail"
echo "Exec=/opt/google/chrome/google-chrome --profile-directory=Default --app-id=dnfhhlehgfipnnanmnahfkhmebmdpkef"
echo "Icon=chrome-dnfhhlehgfipnnanmnahfkhmebmdpkef-Default"
echo "StartupWMClass=crx_dnfhhlehgfipnnanmnahfkhmebmdpkef"
} >> ProtonMail.desktop
chmod +x ProtonMail.desktop

 cd "$(xdg-user-dir DESKTOP)"  || exit 
 touch "PocketCasts.desktop"
  {   
echo "#!/usr/bin/env xdg-open"
echo "[Desktop Entry]"
echo "Version=1.0"
echo "Terminal=false"
echo "Type=Application"
echo "Name=Pocket Casts"
echo "Exec=/opt/google/chrome/google-chrome --profile-directory=Default --app-id=dppcknkccigcbaebaeocblgghikhadgc"
echo "Icon=chrome-dppcknkccigcbaebaeocblgghikhadgc-Default"
echo "StartupWMClass=crx_dppcknkccigcbaebaeocblgghikhadgc"
} >> PocketCasts.desktop
chmod +x PocketCasts.desktop
cd "$Nedlastingermappe" || exit 
echo "--------------------------------------------"
}


avslutter()  {
echo "-------------------------------------------------------------------------------------"
cd "$Nedlastingermappe" || exit 
echo "-------------------------------------------------------------------------------------"
echo  "FULLFØRT Reinstallasjon script for tredjeparts programmer Ubuntu $VER"
echo "-------------------------------------------------------------------------------------"
exit
}


# installerings  script for tredjeparts programmer Debian/Ubuntu
installerings-script-for-tredjeparts-programmer-ubuntu ()  {
echo "-------------------------------------------------------------------------------------------------------------------------"
echo "Reinstallasjon script for tredjeparts programmer Ubuntu $VER"
echo "Lagt til $NYTT i $VER"
echo "$OS"
echo "Sist endret $SISTENDRET"
echo "Legg til EULA og spill-og-mods for å last ned spill-og-mods og programvarer som krever lisener og virtualbox"
echo "Legg til lan for å laste ned programvarer som er praktisk på LAn party"
echo "Hvor havner filene du laster ned de havner i $Nedlastingermappe og ikoner og themes havner i $HOME/.icons $HOME/.themes"
echo "------------------------------------------------------------------------------------------------------------------------"

echo "----------------------------------------------------"
echo "Starter en full system oppdatering..."
echo "----------------------------------------------------"
sudo apt-get update -yyq
sudo apt-get full-upgrade -yyq
echo "------------------------------------------------------------------------"
echo "Installere disse pakkene $PAKKER for at scripet skal funke"
echo "-----------------------------------------------------------------------"
sudo apt-get install $PAKKER -yyq

echo "-----------------------------------------------------------------------"
echo "Installere oh-my-zsh"
sudo apt-get install $OHMYZSHPAKKER -yyq
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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
echo "------------------------------------------------------------------------------------------------"


# Installering av deb pakkker sånn som Minecraft osv med Wget
# Wget -O ender filnavn til du setter før URL-en
echo "-------------------"
echo "Installere pakkene"
echo "------------------"
cd "$Nedlastingermappe" || exit 
echo "----------------------------------------------------"

if dpkg --get-selections | grep -qw "google-chrome-stable"
    then echo "Du har alt google-chrome installert"
else  
echo "Laster ned google-chrome og installere google-chrome"
wget -O google-chrome.deb $CHROME && (sudo dpkg -i google-chrome.deb)
echo "Setter Google Chrome til standard nettleser" && xdg-settings set default-web-browser google-chrome.desktop
fi 

echo "-------------------------------------------------------------"
if dpkg --get-selections | grep -qw "discord"
    then
    echo "Åpner Discord for å sjekke hvilken verson discord er på" 
     discord | grep $DISCORDVERSJON & sleep 5 >> /dev/null 
      killall -9 Discord  >> /dev/null 
   echo "-----------------------------------------------------------------------------------"    
   echo "Du har alt den nyesteversjon av discord som er versjon $DISCORDVERSJON installert" 
   echo "-----------------------------------------------------------------------------------"
    else 
echo "--------------------------------"        
echo "Laster ned og installere Discord" && wget -O Discord.deb "$DISCORD" && sudo dpkg -i Discord.deb
echo "--------------------------------"
fi

if dpkg --get-selections | grep -qw "code"
    then 
        echo "Du har alt VSCODE som installert"
    else      
echo "--------------------------------"
echo "Laster ned og installere VSCode" && wget -O VSCode.deb "$VSCODE" && sudo dpkg -i VSCode.deb
echo "-------------------------------------"
echo "Installere Linux Themes for VS Code"
code --install-extension solarliner.linux-themes
echo "--------------------------------------"
fi 

echo "---------------------------------------------------------------------"
echo "Laster ned Etcher som er et Appimage for å lage bootbare minnepinner" && wget -O Etcher.zip $ETCHER && unzip Etcher.zip
echo "---------------------------------------------------------------------"
}


installerings-script-for-tredjeparts-programmer-ubuntu
snarveier
i3
bionicbeaver-setup
gnome3
elementaryOS
Utseende
avslutter


# Alt som ligger her ned er enten ikke bruk fordi det er bugs i koden eller at det ikke funker i ubuntu 18.04

#Vivaldi
#wget -O vivaldi.deb https://downloads.vivaldi.com/stable/vivaldi-stable_1.12.955.38-1_amd64.deb
#sudo dpkg -i vivaldi.deb

# Nyerepakker ligger i repoet
#VIRTUALBOXPAKKER="libcurl3 libsdl-ttf2.0-0"
#VIRTUALBOXEXT="https://download.virtualbox.org/virtualbox/5.2.6/Oracle_VM_VirtualBox_Extension_Pack-5.2.6-120293.vbox-extpack"
#echo "Installere pakken som trenges for Virtualbox" && sudo apt-get install $VIRTUALBOXPAKKER -yyq
#then 
#groups | grep -ic "vboxusers" > /dev/null 
 #echo "---------------------------------------"
 #echo "$USER er alt i vboxusers"  
 #echo "---------------------------------------"
#else 
#echo "---------------------------------------------------------------"	
#echo "Legger til brukeren din" && sudo adduser "$USER" vboxusers
#echo "---------------------------------------------------------------"

# Nyerepakker ligger i repoet
#VIRTUALBOXPAKKER="libcurl3 libsdl-ttf2.0-0"
#VIRTUALBOXEXT="https://download.virtualbox.org/virtualbox/5.2.6/Oracle_VM_VirtualBox_Extension_Pack-5.2.6-120293.vbox-extpack"
#echo "Installere pakken som trenges for Virtualbox" && sudo apt-get install $VIRTUALBOXPAKKER -yyq
#echo "Laster ned Virtualbox & VirtualBox Extension Pack"
#wget -O virtualbox.deb $VIRTUALBOX && wget -O virtualbox-ext.vbox-extpack $VIRTUALBOXEXT
#sudo dpkg -i virtualbox.deb && echo "Installere virtualbox"
#echo "-----------------------------------------------------------------------------"
#echo "Legger til brukeren din i vboxusers gruppen" && (sudo adduser $USER vboxusers)
#echo "----------------------------------------------------------------------------"

#cypto() {
#echo "-------------------------------------------------------------------------------------"
#echo "Installere VERGE kryptovaluta sin lommebok"
#echo "-------------------------------------------------------------------------------------"
#cd "$cyptomappe" || exit	
#sudo apt-get -y install git && cd ~ && \
  #       git clone --recurse-submodules https://github.com/vergecurrency/VERGE \
 #        && cd VERGE && sh go.sh
#}         

#if  [ "$1" == "--cypto" ];then
#	cypto
#	exit
#fi