#!/bin/bash

# Set BASH til å avslutte scripet og avslutter


#set -e

# Variabler
SISTENDRET="31.aug.2019"
NYTT="Lagt til todoist under --EULA"
VER="Versjon 1.8.1.2"
OS="Testet sist på Ubuntu 18.04"
ENDRINGER="Fikset bugs og del opp i flere Funskjoner"
FJERNET="i3wm funskjonen som lagde en snarvei til discord og ersattet brave med Vivaldi"
KODENAVN="$(lsb_release -sc)"



# Mapper
Nedlastingermappe=$(xdg-user-dir DOWNLOAD)

# Hvor prosjekter installert fra Github/Gitlab havner 
GIT="$HOME/git/"



# Pakker som trenges for at scripet skal funke
OHMYZSHPAKKER="zsh fonts-powerline"
I3PAKKER="chromium-browser"
PAKKER="wget curl git unzip tar libcurl4 libc++1"

# Pakker for ekstrerne programmvarer for non freesoftware og non free pakker fra tredjepart repo


# Pakker for ekstrerne programmvarer for free software fra Ubuntu repo
WOEUSBPAKKER="p7zip-full grub-pc-bin libwxbase3.0-0v5 libwxgtk3.0-0v5"
VORTADEP="python3-pip borgbackup"
PEAZIPPAKKER="libpango1.0-0"

# Pakker for ekstrerne programmvarer for non free software fra Ubuntu repo
DISCORDPAKKER="libgconf-2-4 libappindicator1"

# Eksterne pakker fra Ubuntu repo som brukes i spill. For --spill 

JAVAPAKKER="ca-certificates-java default-jre default-jre-headless fonts-dejavu-extra java-common libatk-wrapper-java libatk-wrapper-java-jni libpango1.0-0 libpangox-1.0-0 openjdk-11-jre openjdk-11-jre-headless openjdk-8-jre openjdk-8-jre-headless"
ITCHDEP="libgtk-3-0"
GAMEMODEPAKKER="meson libsystemd-dev pkg-config ninja-build git"

# Eksterne pakker fra Ubuntu repo som brukes i spill. For --spill at PS4 kontrollen skal funke
BLUETOOTHPAKKER="bluez bluez-tools bluetooth"
PS4DEP="python3-dev"


# GNOME 3 pakker for funskjonen --gnome 
GNOME="gnome-tweak-tool"
VPNPAKKER="network-manager-openvpn-gnome"
GNOMEDONOTDISTURBPAKKER="libglib2.0-bin gjs"


# Direkte linker til Deb URL-er
ZOTERODEBURL="https://github.com/retorquere/zotero-deb/releases/download/apt-get/install.sh"
LANSHARE="https://github.com/abdularis/LAN-Share/releases/download/1.2.1/lanshare_1.2.1-1_amd64.deb"
WOEUSBDEB="https://launchpad.net/~nilarimogard/+archive/ubuntu/webupd8/+files/woeusb_3.2.12-1~webupd8~cosmic0_amd64.deb"
PEAZIPDEB="https://osdn.net/frs/redir.php?m=rwthaachen&f=peazip%2F71496%2Fpeazip_6.9.1.LINUX.GTK2-2_all.deb"
PEAZIPVERSJONUMMER="6.9.1"

# non free tjenester men fri programvare 
PCLOUDCCURL="https://my.pcloud.com/publink/show?code=XZvLyi7Zsz7t1H0aYIFiawL4LSgN3uxLBUJX"


# non free programvarer direkte linker til Deb filen
TODOISTDEB="https://github.com/KryDos/todoist-linux/releases/download/1.17/Todoist_1.17.0_amd64.deb"
TODOISTLINUXURL="https://github.com/KryDos/todoist-linux/releases"
TEAMVIEWERURL="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
VIVALDIURL="https://vivaldi.com/download/"
VIVALDIDEB="https://downloads.vivaldi.com/stable/vivaldi-stable_2.7.1628.33-1_amd64.deb"
# Må fikse på discord 
DISCORDDEB="https://discordapp.com/api/download?platform=linux&format=deb"



# Må endres når ny versjon av Discord kommer
DISCORDCURRENT="0.0.8|0.0.9"
DISCORDVERSJON="0.0.9"



# Info Deb URL-er 
WOEUSBINFO="https://launchpad.net/~nilarimogard/+archive/ubuntu/webupd8/+packages?field.name_filter=woeusb&field.status_filter=published&field.series_filter="
PEAZIPURLINFO="https://www.peazip.org/peazip-linux.html"

# Spill som er pakket inn som Deb filer URL-er
POKEMMO="https://pokemmo.eu/download_file/?id=4"
MINECRAFT="https://launcher.mojang.com/mc-staging/download/Minecraft_staging.deb"
MULTIMC="https://files.multimc.org/downloads/multimc_"${MULTIMCVERSJONUMMER}".deb"
MULTIMCVERSJONUMMER="1.2-1"


# URL-enesom endre seg ikke

CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"


# Må få satt opp en enkler måtte å oppdatere versjons nummer til PIA sin VPN klient på. 

# VPN URL-er for --VPN
PIAVPNURL="https://installers.privateinternetaccess.com/download/pia-linux-1.1.1-02545.run"
PIADOWNLOADURL="https://www.privateinternetaccess.com/pages/download"
PIASHA256="54658fa3d9b1e85a97a854b9fe120bc27644734df509cd49f555a603dd7cb399"
# OPENVPN URL-er for --VPN 
PIAOPENVPN="https://www.privateinternetaccess.com/installer/pia-nm.sh"


# Trezor URL-er for kryptovaluta
TREZORWALLET="https://wallet.trezor.io/#/bridge"
TREZORBRIDGEVERSJONUMMER="2.0.26"
TREZORBRIDGE="https://wallet.trezor.io/data/bridge/"${TREZORBRIDGEVERSJONUMMER}"/trezor-bridge_"${TREZORBRIDGEVERSJONUMMER}"_amd64.deb"
TREZORUDV="https://wallet.trezor.io/data/udev/trezor-udev_1_all.deb"


# Spill maskinvare URL-er
PS4KONTROLLERURL="https://github.com/RetroPie/RetroPie-Setup/wiki/PS4-Controller"

# Spill som bruker Java URL-er. Sånn som Mincraft og Minecraft modpacks
MINECRAFTJAVA="http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar"
TECHNICLAUNCHER="http://launcher.technicpack.net/launcher4/349/TechnicLauncher.jar"
FTBLAUNCHER="http://ftb.cursecdn.com/FTB2/launcher/FTB_Launcher.jar"
ATLAUNCHER="https://www.atlauncher.com/download/jar"



# Spill URL-er
ITCHIO="http://nuts.itch.zone/download"
GAMEMMODEURL="https://github.com/FeralInteractive/gamemode#gamemode"

# Spill versjoner 

GAMEMODEVERSJON="1.4"



#  Sletter nå pakken er ferdig nedlastet
EULADEBINNSTALLERINGSPAKKEN="trezor-bridge.deb trezor-udev.deb"


# Github linker til prosjekter på Github som script osv
OHMYZSHINSTALLURL="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
POWERLINEFONTURL="https://github.com/powerline/fonts.git"

# GTK theme tar filer

UNTIEDGNOME="https://github.com/godlyranchdressing/United-GNOME/raw/master/United-Latest.tar.gz"

# GTK theme på GTK tema

SURUPLUS="https://github.com/Magog64/SURU-PLUS.git"
suruplus="https://github.com/gusbemacbe/suru-plus.git"
ARC="https://github.com/horst3180/arc-icon-theme"

# Sublimetheme 
MATERIALTHEME="https://github.com/equinusocio/material-theme/archive/v4.1.5.zip"

# Sublime-text 3 pakker mappe
SUBLIMEPAKKER=""$HOME"/.config/sublime-text-3/Packages"

# GNOME Gsettings

# Bruk dconf watch / i terminalen  for å test endinger av programmer som tar i bruk dconf registeret/gsettings,
#for mer info sjekk ut URL-en https://askubuntu.com/questions/971067/how-can-i-script-the-settings-made-by-gnome-tweak-tool


# Ubuntu
UBUNTUGTK="United-Ubuntu-Dark"
UBUNTUIKON="SURU-PLUS"

# Funskjoner

info(){
echo "Lagt til $NYTT i $VER"
echo "Endringer i $VER $ENDRINGER"
echo "$FJERNET fra $VER"
echo "$OS"
echo "Sist endret $SISTENDRET"
}




bionicbeaver-setup() {
if test ! -d $HOME/.icons/SURU-PLUS/ && test ! -d $HOME/.icons/suru-plus/ 
   then  
    echo "-----------------------------------------------------"
    echo "Laster ned SURU-PLUS ikon tema for Ubuntu 18.04/19.04"
    echo "-----------------------------------------------------"
    sudo apt install file-roller suru-icon-theme $GNOME -yyq
	mkdir -p "$HOME/.icons/" && cd "$HOME/.icons/" || exit
git clone $SURUPLUS && git clone $suruplus
    echo "-------------------------------------------------------"
    echo "SURU-PLUS er ferdig pakket ut"
    echo "-------------------------------------------------------"
    sleep 5
    echo "----------------------------------------------------"
    echo "Laster ned United-GNOME GTK thema for Ubuntu 18.04"
    echo "----------------------------------------------------"
    mkdir -p "$HOME/.themes/" && cd "$HOME/.themes/"  || exit
    wget $UNTIEDGNOME -O United-GNOME.tar.gz && tar xvf United-GNOME.tar.gz >/dev/null
    echo "-------------------------------------------------------"
    echo " United-GNOME er ferdig pakket ut"
    echo "-------------------------------------------------------"
else 
echo "-----------------------------------------------------"
echo "SURU-PLUS ikon tema for Ubuntu 18.04 er instllaert"
echo "------------------------------------------------------"
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
    sudo apt install $GNOME -yyq
    gsettings set org.gnome.desktop.interface gtk-theme $UBUNTUGTK
    gsettings set org.gnome.desktop.interface icon-theme $UBUNTUIKON
    gsettings set org.gnome.desktop.wm.preferences theme $UBUNTUGTK
    gsettings set org.gnome.shell.extensions.user-theme name $UBUNTUGTK
    echo "---------------------------------------------------------------------------------------------------------------------"
    echo "Installer Do Not Disturb Gnome Shell Extension lokalt"
    echo "---------------------------------------------------------------------------------------------------------------------"
    cd $HOME/.local/share/gnome-shell/extensions/ || exit
    sudo apt install $GNOMEDONOTDISTURBPAKKER -yyq 
    git clone https://github.com/pop-os/gnome-shell-extension-do-not-disturb
    cd gnome-shell-extension-do-not-disturb || exit
    make
    make install
    sleep 5
    echo "---------------------------------------------------------------------------------------------------------------------"
    echo "Aktiver Do Not Disturb Gnome Shell Extension"
    echo "---------------------------------------------------------------------------------------------------------------------"
    gnome-shell-extension-tool --enable-extension $HOME/.local/share/gnome-shell/extensions/donotdisturb@kylecorry31.github.io/ 
    echo "---------------------------------------------------------------------------------------------------------------------"
    echo "Aktiver ikon for Do Not Disturb Gnome Shell Extension"
    echo "---------------------------------------------------------------------------------------------------------------------"
   dconf write /org/gnome/shell/extensions/kylecorry31-do-not-disturb/show-icon true
    echo "---------------------------------------------------------------------------------------------------------------------"
    echo "Aktiver teller for Do Not Disturb Gnome Shell Extension"
    echo "---------------------------------------------------------------------------------------------------------------------"
    dconf write /org/gnome/shell/extensions/kylecorry31-do-not-disturb/show-count true
    else
    echo "---------------------------------------------------------"
  echo    "\e[1;31m  Skrivebordsmiljø ditt er IKKE GNOME \e[0m"
    echo "---------------------------------------------------------"
fi
   }




Utseende() {
echo "------------------------------------------------------------------------------"
echo "Sjekker om arc-theme er installert for å installer arc-icon-theme"
echo "-------------------------------------------------------------------------------"
if  dpkg -l | grep -Eq "arc-theme|moka-icon-theme|pocillo-icon-theme"
	then
echo "------------------------------------------------------------------------------"
echo "Laster ned Arc ikon tema fra github hvis du har arc-theme installert fra repo"
echo "-------------------------------------------------------------------------------"   
	mkdir -p  ~/.icons 
	cd ~/.icons || exit ;  rm ~/.icons/arc-icon-theme -rf
	git clone $ARC --depth 1 && cd "arc-icon-theme" || exit
echo "-----------------------------------------------------------"
echo "Flytter over Arc ikon tema til ~/.icons"
echo "------------------------------------------------------------"
	mv Arc ~/.icons 2>/dev/null
else
 echo "-----------------------------------"
 echo  "Du har ikke arc-theme installert"
 echo "-----------------------------------"
fi
}


gnome3-cosmic(){
echo "---------------------------------------------------"
echo "Sjekker om du har bruker Ubuntu 18.10/19.04"
echo "---------------------------------------------------"    
if echo "$KODENAVN" | grep -E "cosmic|disco"
then 
    echo "---------------------------------------------------------------------------------------------------------------------"
    echo "Yaru-dark som Programmer tema (GTK-theme) siden dette er Ubuntu 18.10/19.04"
    echo "---------------------------------------------------------------------------------------------------------------------" 
    gsettings set org.gnome.desktop.interface gtk-theme Yaru-dark
    else 
    echo "---------------------------------------------------------------------------------------------------------------------"
    echo "Beholder "$UBUNTUGTK" som Programmer tema (GTK-theme)"
    echo "---------------------------------------------------------------------------------------------------------------------"        
fi
   }    



if  [ "$1" == "--gnome" ];then
info
bionicbeaver-setup
gnome3
Utseende
gnome3-cosmic
exit
fi   


spill-install() {
echo "-------------------------------------------------------------------------------------"
echo "Installer spill"
echo "-------------------------------------------------------------------------------------"
cd "$Nedlastingermappe" || exit
echo "-------------------------------------------------------------------------------------"
echo "Installere Java pakker fordi flere av av Minecraft og PokeMMO krever java"
echo "-------------------------------------------------------------------------------------"
sudo apt install $JAVAPAKKER -yyq
echo "-------------------------------------------------------------------------------------"
echo "Installere PokeMMO"
wget -O PokeMMO.deb "$POKEMMO" && sudo apt install ./PokeMMO.deb -yyq
echo "-------------------------------------------------------------------------------------"
sleep 5
echo "----------------------------" 
echo "Installere itch.io klienten"
echo "----------------------------" 
sudo apt install $ITCHDEP -yyq
wget -O itch-setup "$ITCHIO" -P "$Nedlastingermappe"
echo "----------------------------" 
echo "Starter opp itch.io klienten"
echo "----------------------------" 
chmod +x itch-setup && ./itch-setup
echo "---------------------------------"
echo "Avslutter itch.io klienten"
echo "---------------------------------"
sleep 15 && killall itch
echo "-------------------------------------------------------------------------------------------------------------------------------------------"
echo "Installer "$GAMEMODEPAKKER" som trengs for Feral Interactive sin GameMode som optimaliser spill"
echo "-------------------------------------------------------------------------------------------------------------------------------------------"
sudo apt install $GAMEMODEPAKKER -yyq
echo "-------------------------------------------------------------------------------------"
echo "Klar gjør installasjonen av Feral Interactive sin GameMode"
echo "-------------------------------------------------------------------------------------" 
mkdir -p "$GIT"
cd "$GIT" || exit 
git clone https://github.com/FeralInteractive/gamemode.git
cd gamemode
git checkout "$GAMEMODEVERSJON" || exit
echo "-------------------------------------------------------------------------------------"
echo "Installer Feral Interactive sin GameMode som optimaliser spill"
echo "-------------------------------------------------------------------------------------" 
./bootstrap.sh
sleep 5 
echo "---------------------------------------------------------------------------------------------------------------------------------------------------"
echo "For bruke Feral Interactive sin GameMode kjører du gammoderun ./spill fra terminalen eller gamemoderun %command% Steam  launch options"
echo "----------------------------------------------------------------------------------------------------------------------------------------------------" 
echo "--------------------------------------------------------------------------------------------------------------------------------------------------"
echo "For mer info om Feral Interactive sin GameMode sjekk ut "$GAMEMMODEURL""
echo "----------------------------------------------------------------------------------------------------------------------------------------------------" 
sleep 5
}


minecraft()  {
cd "$Nedlastingermappe" || exit
echo "------------------------------------"
echo "Minecraft fra Deb og Java versjonen" && wget -O Minecraft.deb $MINECRAFT  && sudo dpkg -i Minecraft.deb && wget -O Minecraft.jar $MINECRAFTJAVA
echo "------------------------------------"
mkdir -p ~/Games && cd ~/Games || exit
echo "---------------------------------------------------------------------------------------"
echo "Lager mappe for Minecraft Modpacker"
echo "-------------------------------------------------------------------------------------"
mkdir -p ~/Games/Minecraft-Modpacker
cd  ~/Games/Minecraft-Modpacker || exit
echo "---------------------------------------------------------------------------------------"
echo "Laster ned  Minecraft Modpacker Java versjoner"
echo "-------------------------------------------------------------------------------------"
wget -O technic-launcher.jar $TECHNICLAUNCHER && wget -O ftb-launcher.jar $FTBLAUNCHER &&  wget -O at-launcher.jar $ATLAUNCHER
echo "-------------------------------------------------------------------------------------------------"
echo "Installere Minecraft Modpacker Deb pakker sånn som MultiMC for en nyere versjon av FTB Launcher"
echo "------------------------------------------------------------------------------------------------"
wget -O MultiMC.deb $MULTIMC && sudo dpkg -i MultiMC.deb
}



ps4kontroller() {  
echo "-----------------------------------------------------------------------------------------"
echo "Installer støtte for PS4 kontrolleren"
echo "----------------------------------------------------------------------------------------"
sudo apt install  $PS4DEP -yyq 
sudo -H pip3 install ds4drv
echo "----------------------------------------------------------------------------------"
echo "Sjekke ut "$PS4KONTROLLERURL"for mer info om oppsette av PS4 kontrolleren "
echo "----------------------------------------------------------------------------------"
}    

	spill-avslutt()  {
	echo "-------------------------------------------------------------------------------------"
	echo "Da er installasjonen av forskjellige spill ting ferdig installert"
	echo "-------------------------------------------------------------------------------------"
	exit
	}

if  [ "$1" == "--spill" ];then
    info
	spill-install
    minecraft
    steamproton
    ps4kontroller
    spill-avslutt
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
    exit
fi

# Fikse senere
EULA()  {
echo "------------------------------------------------------------------------------------------"
echo "Du må ha kjøpt EULA/Lisensen eller at det er personal lisens til for disse programvarene"
echo "----------------------------------------------------------------------------------------------"
trezorprogramvarer() {
cd "/tmp/" || exit        
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Laster ned trezor sin udev pakke for trezor installere den og sjekk ut $TREZORWALLET for en oppdatering til bridge"
echo "-------------------------------------------------------------------------------------------------------------------"
wget -O trezor-udev.deb $TREZORUDV && sudo dpkg -i trezor-udev.deb
wget -O trezor-bridge.deb $TREZORBRIDGE  && sudo dpkg -i trezor-bridge.deb
echo "-----------------------------------------------------------------------"
}


sublimetext() {
        echo "---------------------------------------------------------------------------"
        echo "Sjekker om du har installert sublime-text med snap eller med hjelp av apt"
        echo "---------------------------------------------------------------------------"    
if dpkg --get-selections | grep -qw "sublime-text" && snap list | grep "sublime-text"
    then
        echo "----------------------------------"
        echo "Du har alt sublime-text installert"
        echo "----------------------------------"
else
echo "-----------------------------------------------------"
echo "Installere Sublime text stable fra apt"
echo "----------------------------------------------------"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https -yyq
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update -yyq 
sudo apt install sublime-text -yyq
fi
}

sublimetexttema(){
if dpkg --get-selections | grep -qw "sublime-text"
    then    
echo "------------------------------------------------------------------------------------"
echo "Laster ned Material Theme for sublime-text-3 i mappen $SUBLIMEPAKKER"
echo "------------------------------------------------------------------------------------"
cd "$SUBLIMEPAKKER" || exit
wget -qO Material-Theme.zip $MATERIALTHEME
unzip Material-Theme.zip >/dev/null && mv material-theme-4.1.5 Material\ Theme/ 2>/dev/null
echo "--------------------------------------------------------"
echo "HUSK og Preferences > Browse packages... i Sublime Text"
echo "-------------------------------------------------------"
rm Material-Theme.zip 2>/dev/null
else 
        echo "----------------------------------------------"
        echo "Du har ikke sublime-text fra apt installert"
        echo "-----------------------------------------------" 
fi           
} 

teamviewersetup() {
        echo "---------------------------------------------------------------------------"
        echo "Sjekker om du har installert TeamViewer eller ikke"
        echo "---------------------------------------------------------------------------"    
if dpkg --get-selections | grep -qw "teamviewer"
        then
        echo "----------------------------------"
        echo "Du har alt TeamViewer installert"
        echo "----------------------------------"
    else        
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Laster ned og installer TeamViewer pakken"
echo "-------------------------------------------------------------------------------------------------------------------"
cd "/tmp/" || exit   
wget -O TeamViewer.deb $TEAMVIEWERURL  && sudo dpkg -i TeamViewer.deb 
echo "--------------------------------------------------------------------------------------"
echo "Fikser dependencies problemer for TeamViewer"
echo "-------------------------------------------------------------------------------------"
sudo apt --fix-broken install -yyq
fi
}
}

pcloudccsetup() {
        echo "---------------------------------------------------------------------------"
        echo "Sjekker om du har installert pcloudcc eller ikke"
        echo "---------------------------------------------------------------------------"    
if dpkg --get-selections | grep -qw "pcloudcc"
        then
        echo "----------------------------------"
        echo "Du har alt pcloudcc installert"
        echo "----------------------------------"
    else        
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Laster ned og installer pcloudcc pakken"
echo "-------------------------------------------------------------------------------------------------------------------"
cd "/tmp/" || exit   
wget -O pcloudcc.deb $PCLOUDCCURL  && sudo dpkg -i pcloudcc.deb 
fi
}

todoistsetup(){
# Laster ned og installer todoist
cd "$Nedlastingermappe" || exit 
  if dpkg -l "todoist"
  then
       echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
        echo "Du har alt todoist installert og sjekk ut "$TODOISTLINUXURL" for nyere versjoner av eletron versjon som todoist uoffisel"
        echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
else
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Laster ned og installerer todoist og sjekk ut "$TODOISTLINUXURL" for mer info"
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" 
sleep 5
wget -O todoist.deb "$TODOISTDEB" && sudo dpkg -i todoist.deb
fi
}


if  [ "$1" == "--EULA" ];then
    info
	EULA
    trezorprogramvarer
	sublimetext
    sublimetexttema
    teamviewersetup
    pcloudccsetup
	exit
fi


vpnsetup() {
echo "-------------------------------------------------------------------------------------"
echo "Laster ned PIA VPN klienten"
echo "-------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------"
echo "Sjekke "$PIADOWNLOADURL" for oppdatering av klienten"
echo "-------------------------------------------------------------------------------------"
cd "/tmp/" || exit   
wget $PIAVPNURL 
echo "-------------------------------------------------------------------------------------"
echo "Sjekker PIA nedlasting ikke har blitt tullet med hjelp av sha256sum"
echo "-------------------------------------------------------------------------------------"
if sha256sum pia-linux-1.1.1-02545.run | grep "$PIASHA256"
then
echo "-------------------------------------------------------------------------------------"
echo "Installere PIA sin klienten med .run"
echo "-------------------------------------------------------------------------------------"    
sh pia-linux-1.1.1-02545.run
else 
echo "-------------------------------------------------------------------------------------"
echo "Fjerner PIA sin klienten med .run"
echo "-------------------------------------------------------------------------------------"        
rm *.run
fi
}

openvpnsetup(){
echo "-------------------------------------------------------------------------------------"
echo "Setter opp OpenVPN med PIA"
echo "-------------------------------------------------------------------------------------"
sudo apt update -yyq
sudo apt install $PAKKER $VPNPAKKER -yyq 
cd "/tmp/" || exit   
echo "-------------------------------------------------------------------------------------"
echo "Laster ned OpenVPN setup bash script fra PIA "
echo "-------------------------------------------------------------------------------------"
wget $PIAOPENVPN 
echo "-------------------------------------------------------------------------------------"
echo "Skriv inn PIA brukernavnet ditt"
echo "-------------------------------------------------------------------------------------"
sudo bash pia-nm.sh 
}

if  [ "$1" == "--VPN" ];then
    info
    vpnsetup
    openvpnsetup
    exit
fi



woeusb(){ 
echo "----------------------------------------------------"
echo "Sjekker om WOEUSB er installert" 
echo "----------------------------------------------------"    
if echo "$KODENAVN" | grep -Eq "bionic|disco" && dpkg --get-selections | grep -qw "woeusb" 
    then
echo "------------------------------------"
echo "Du har alt WOEUSB installert"
echo "------------------------------------"
else    
echo "----------------------------------------------------------------------------------"
echo "Installer WOEUSB deb pakken"
echo "----------------------------------------------------------------------------------"
cd $Nedlastingermappe || exit
sudo apt install $WOEUSBPAKKER -yyq && wget -O WOEUSB.deb $WOEUSBDEB -P $Nedlastingermappe && sudo dpkg -i WOEUSB.deb
fi
}	


if  [ "$1" == "--USB" ];then
    info
    woeusb
    exit
fi



# installerings  script for tredjeparts programmer Debian/Ubuntu
ubuntutredjeparts ()   {
echo "------------------------------------------------------------------------------------------------------------------------------------------"
echo "Reinstallasjon script for tredjeparts programmer Ubuntu $VER"
echo "Lagt til $NYTT i $VER"
echo "Endringer i $VER $ENDRINGER"
echo "$FJERNET fra $VER"
echo "$OS"
echo "Sist endret $SISTENDRET"
echo "Legg til --EULA og --spill for å last ned spill og mods og programvarer som krever lisener"
echo "Legg til --lan for å laste ned programvarer som er praktisk på LAN party"
echo "Legg til --VPN for å sette opp VPN-en"
echo "Hvor havner filene du laster ned de havner i $Nedlastingermappe/ eller i /tmp/ mappen og ikoner og themes havner i $HOME/.icons $HOME/.themes"
echo "-----------------------------------------------------------------------------------------------------------------------------------------"

echo "----------------------------------------------------"
echo "Starter en full system oppdatering..."
echo "----------------------------------------------------"
sudo apt update -yyq
sudo apt full-upgrade -yyq
echo "------------------------------------------------------------------------"
echo "Installere disse pakkene "$PAKKER" for at scripet skal funke"
echo "-----------------------------------------------------------------------"
sudo apt install $PAKKER -yyq

echo "-----------------------------------------------------------------------"    
echo "Sjekker om Zotero er installert fra "$ZOTERODEBURL"" 
echo "-----------------------------------------------------------------------"
if dpkg -l | grep -qw  "zotero"  
then 
echo "-----------------------------------------------------------------------"    
echo "Zotero er alt  installert"
echo "-----------------------------------------------------------------------"
else
echo "--------------------------------------------------------------------------------------------------------"
echo "Installer Zotero" 
echo "--------------------------------------------------------------------------------------------------------"
cd "/tmp/" || exit
wget -qO- $ZOTERODEBURL | sudo bash
fi 

# Installer Vorta for å ta snapshot med Borg backup
echo "-----------------------------------------------------------------------"    
echo "Sjekker om vorta er installert fra pip3" 
echo "-----------------------------------------------------------------------"
if pip3 show "vorta" -q 
then
echo "-----------------------------------------------------------------------"    
echo "Du har alt innstallert vorta fra pip3" 
echo "-----------------------------------------------------------------------"
else
echo "--------------------------------------------------------------------------------------------------------"
echo "Installer Vorta som er en gui for Borg backup med pip3 og andre pakker som trenges for vorta skal funke" 
echo "--------------------------------------------------------------------------------------------------------"
sudo apt install $VORTADEP -yyq 
pip3 install vorta 
fi 
}

tredjepartscli (){
# Setter standard shell for terminalen på Linux

echo "-------------------------------------------------------------------------"
echo "Sjekker om bash eller zsh shell er standard"
echo "-------------------------------------------------------------------------"
if echo "$0" | grep "bash"
then
echo "-----------------------------"
echo "Setter zsh som standard shell" 
echo "-----------------------------"
chsh -s $(which zsh)
else
echo "$0" | grep "zsh"
echo "-----------------------------------"
echo "zsh er alt satt som standard shell"
echo "----------------------------------"
fi

# Setter opp oh-my-zsh

echo "-------------------------------------------------------------------------"
echo "Sjekker om oh-my-zsh plugien er installert til ZSH"
echo "-------------------------------------------------------------------------"
if test -d ~/.oh-my-zsh/
then    
echo "-------------------------------------------------------------------------"
echo "Oppdatere oh-my-zsh siden oh-my-zsh plugien til ZSH er installert"
echo "-------------------------------------------------------------------------"
cd ~/.oh-my-zsh/tools/ || exit
bash upgrade.sh
else
echo "-----------------------------------------------------------------------"
echo "Installere oh-my-zsh plugien for zsh shell"
echo "-----------------------------------------------------------------------"
sudo apt install $OHMYZSHPAKKER -yyq
sh -c "$(curl -fsSL $OHMYZSHINSTALLURL)"
fi 

# Powerline patch for forskjelige fonter
if test ! -d $GIT/powerlinefonts
then
echo "-------------------------------------------------------------------------"
echo "Setter opp powerline fonts for ZSH fra github"
echo "-------------------------------------------------------------------------"
mkdir -p "$GIT"
cd "$GIT" || exit 
git clone $POWERLINEFONTURL
cd $PWD/fonts || exit 
bash install.sh
sleep 5
cd .. 
echo "-------------------------------------------------------------------------"
echo "Endre navn fra fonst til powerlinefonts sånn at man vet hva mappen er for"
echo "-------------------------------------------------------------------------"
mv fonts powerlinefonts
else 
echo "-------------------------------------------------------------------------"
echo "Mappen powerlinefonts fra github for ZSH finnes alt"
echo "-------------------------------------------------------------------------"
fi 
}

# Installering av deb pakkker sånn som Minecraft osv med Wget
# Wget -O ender filnavn til du setter før URL-en
# Wget -P så /home/christian


tredjepartsprogrammer(){

# Sjekker om Discord er installert eller ikke
echo "-------------------------------------------------------------------------------------"
echo  "Sjekker om Discord er installert eller ikke"
echo "-------------------------------------------------------------------------------------"
if dpkg -l discord | grep -E "$DISCORDCURRENT|All-in-one voice and text chat for gamers"
then
    echo "----------------------------------------------------------------------------------"
    echo "Du har Discord installert"
    echo "-----------------------------------------------------------------------------------"
    else 
echo "--------------------------------"
sudo apt install $DISCORDPAKKER -yyq
echo "--------------------------------------------------"
echo "Laster ned og installere Discord $DISCORDVERSJON" && wget -O Discord-$DISCORDVERSJON.deb "$DISCORDDEB" && sudo dpkg -i Discord-$DISCORDVERSJON.deb
echo "--------------------------------------------------" 
fi




# Laster ned og installer PeaZip

cd "$Nedlastingermappe" || exit 
  if dpkg -l peazip | grep "$PEAZIPVERSJONUMMER"
  then
       echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
        echo "Du har alt PeaZip "$PEAZIPVERSJONUMMER" GTK2-2 installert og sjekk ut "$PEAZIPURLINFO" for nyere versjoner"
        echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
else
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Laster ned og installerer PeaZip "$PEAZIPVERSJONUMMER" GTK2-2 som er som 7zip på windows og sjekk ut "$PEAZIPURLINFO" for mer info"
echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" 
sleep 5
wget -O PeaZip.deb "$PEAZIPDEB" && sudo dpkg -i PeaZip.deb
echo "--------------------------------------------------------------------------------------"
echo "Fikser dependencies problemer for PeaZip"
echo "-------------------------------------------------------------------------------------"
sudo apt --fix-broken install -yyq
fi
}


nettlesere() {
echo "-------------------"
echo "Installere pakkene"
echo "------------------"
cd "$Nedlastingermappe" || exit
echo "----------------------------------------------------"
if dpkg --get-selections | grep -qw "google-chrome-stable"
    then
echo "------------------------------------"
echo "Du har alt google-chrome installert"
echo "------------------------------------"
else
echo "----------------------------------------------------"   
echo "Laster ned google-chrome og installere google-chrome"
echo "----------------------------------------------------"
wget -O google-chrome.deb $CHROME && (sudo dpkg -i google-chrome.deb)
sudo apt update -yyq
fi

# Vivaldi nettleseren 
cd "$Nedlastingermappe" || exit
echo "----------------------------------------------------"
if dpkg --get-selections | grep -qw "vivaldi"
    then
echo "------------------------------------"
echo "Du har alt vivaldi installert"
echo "------------------------------------"
else
echo "----------------------------------------------------"   
echo "Laster ned vivaldi og installere vivaldi"
echo "----------------------------------------------------" 
wget -O Vivaldi.deb "$VIVALDIDEB" && sudo dpkg -i Vivaldi.deb 
sudo apt update -yyq 
echo "----------------------------------------------------"
echo "Setter Vivaldi til standard nettleser" && xdg-settings set default-web-browser vivaldi-stable.desktop
echo "----------------------------------------------------"
echo "--------------------------------------------------------------------------------------------------------------------------------------------------"
echo "NB om det står at Vivaldi og Chrome dukker opp flere ganger /etc/apt/sources.list.d så bare bruk  sudo rm Vivaldi.list for å fikse problemet"
echo "--------------------------------------------------------------------------------------------------------------------------------------------------"
sleep 5
fi 
}

avslutter()  {
echo "-------------------------------------------------------------------------------------"
cd "$Nedlastingermappe" || exit
echo "-------------------------------------------------------------------------------------"
echo  "FULLFØRT Reinstallasjon script for tredjeparts programmer Ubuntu $VER"
echo "-------------------------------------------------------------------------------------"
exit
}
    


ubuntutredjeparts
tredjepartscli
tredjepartsprogrammer
nettlesere
i3
avslutter


# ikke i bruk fra å med 15 desember 2018


# Alt som ligger her ned er enten ikke bruk fordi det er bugs i koden eller at det ikke funker i ubuntu 18.04

#Vivaldi
#wget -O vivaldi.deb https://downloads.vivaldi.com/stable/vivaldi-stable_1.12.955.38-1_amd64.deb
#sudo dpkg -i vivaldi.deb

# Nyerepakker ligger i repoet
#VIRTUALBOXPAKKER="libcurl3 libsdl-ttf2.0-0"
#VIRTUALBOXEXT="https://download.virtualbox.org/virtualbox/5.2.6/Oracle_VM_VirtualBox_Extension_Pack-5.2.6-120293.vbox-extpack"
#echo "Installere pakken som trenges for Virtualbox" && sudo apt install $VIRTUALBOXPAKKER -yyq
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
#echo "Installere pakken som trenges for Virtualbox" && sudo apt install $VIRTUALBOXPAKKER -yyq
#echo "Laster ned Virtualbox & VirtualBox Extension Pack"
#wget -O virtualbox.deb $VIRTUALBOX && wget -O virtualbox-ext.vbox-extpack $VIRTUALBOXEXT
#sudo dpkg -i virtualbox.deb && echo "Installere virtualbox"
#echo "-----------------------------------------------------------------------------"
#echo "Legger til brukeren din i vboxusers gruppen" && (sudo adduser $USER vboxusers)
#echo "----------------------------------------------------------------------------"




#snarveier() {
#echo "----------------------------------------------------------------------"
#echo "Lager snarvei til ProtonMail & PocketCasts på $(xdg-user-dir DESKTOP)"
#echo "----------------------------------------------------------------------"
# cd "$(xdg-user-dir DESKTOP)"  || exit
# touch "ProtonMail.desktop"
#  {
#echo "#!/usr/bin/env xdg-open"
#echo "[Desktop Entry]"
#echo "Version=1.0"
#echo "Terminal=false"
#echo "Type=Application"
#echo "Name=ProtonMail"
#echo "Exec=/opt/google/chrome/google-chrome --profile-directory=Default --app-id=dnfhhlehgfipnnanmnahfkhmebmdpkef"
#echo "Icon=chrome-dnfhhlehgfipnnanmnahfkhmebmdpkef-Default"
#echo "StartupWMClass=crx_dnfhhlehgfipnnanmnahfkhmebmdpkef"
#} >> ProtonMail.desktop
#chmod +x ProtonMail.desktop

 #cd "$(xdg-user-dir DESKTOP)"  || exit
 #touch "PocketCasts.desktop"
 # {
#echo "#!/usr/bin/env xdg-open"
#echo "[Desktop Entry]"
#echo "Version=1.0"
#echo "Terminal=false"
#echo "Type=Application"
#echo "Name=Pocket Casts"
#echo "Exec=/opt/google/chrome/google-chrome --profile-directory=Default --app-id=dppcknkccigcbaebaeocblgghikhadgc"
#echo "Icon=chrome-dppcknkccigcbaebaeocblgghikhadgc-Default"
#echo "StartupWMClass=crx_dppcknkccigcbaebaeocblgghikhadgc"
#} >> PocketCasts.desktop
#chmod +x PocketCasts.desktop
#cd "$Nedlastingermappe" || exit
#echo "--------------------------------------------"
#}
