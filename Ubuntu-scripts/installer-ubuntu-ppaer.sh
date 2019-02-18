#!/bin/bash
# Legger til Ubuntu PPAS

# Variabler:
SISTENDRET="19.jan.2019"
ENDRINGER="Fjernet libreoffice fra PROGRAMVARERTEMA siden pakken ikke er tilgjenlig lenger "
TINGFJERNET="Fjernet sudo apt-get update etter at UTSEENDEPPAS og laptop er lagt til oppdater heller cachen når ppa-en er lagt til "
NYTT="Lagt til piper for å kunne konfigure PC-Mus i GNOME 3"
VER="Versjon 1.0.9"
OS="Testet på Ubuntu 18.10"
KODENAVN="$(lsb_release -sc)"



# Grafikkort ppa
NVIDIAPPA="ppa:graphics-drivers/ppa"

# NVIDA graikkort ppa pakker
VERSJON="415"
NVIDIAPROBLEMER="med nvidia-driver-$VERSJON er det problemer med GetThreadContext Failed i spill som bruker Untiy med Steamplay Proton så midlertig fix er å bruke PROTON_USE_WINED3D11=1 %command% i som oppstart flag"


# Nødvendige pakker for at scripet skal funke

# TEMA ppa og Pakker
UBUNTUPAKKER="software-properties-gtk ubuntu-drivers-common"

# GNOME ppa og pakker
LOLLYPOP="ppa:gnumdk/lollypop"
GNOMEPROGRAMVARER="lollypop piper"
PIPER="ppa:libratbag-piper/piper-libratbag-git"

PIPERDEB="liblur3 libratbag-tools lur-command ratbagd"

# Nødvendige pakker for at --laptop skal funke
GAMLELAPTOPPAKKER="laptop-mode-tools tlp tlp-rdw"

# Laptop ppa-er og pakker
LAPTOP="ppa:linrunner/tlp"
TLP="tlp tlp-rdw"

# Nødvendige pakker for at GNOME skal kunne endre team og ikoner 

GNOME="gnome-tweak-tool gsettings-desktop-schemas"

# GTK THEME

PLATATHEME=ppa:tista/plata-theme
ADAPTA="ppa:tista/adapta"

# IKONE THEME

PAPIRUS="ppa:papirus/papirus" 

UTSEENDEPPAS="ppa:papirus/papirus ppa:tista/adapta ppa:tista/plata-theme"
UTSEENDE="papirus-icon-theme adapta-gtk-theme plata-theme papirus-folders"

# Programvarer med støtte for Papirus som ikone theme

PROGRAMTEMA="filezilla-theme-papirus"
PROGRAMVARER="filezilla-common"

# Pakker fra Ubuntu repo for Plata og Adpata
FONTER="fonts-roboto fonts-noto fonts-noto-color-emoji"

# For --spill


#  Wine Spill pakker for Battle.net fra Ubuntu repo
BATTLENET="ttf-mscorefonts-installer libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libsqlite3-0:i386"
BATTLENETWINE="winbind"

# For Wine generelt
WINEPAKKER="wine-staging-amd64 wine-staging-i386"

# GNOME Gsettings
GTK="Plata-Noir-Compact"
IKON="Papirus-Dark"
ADPTAFONT="Roboto"

# URL-er

# Spill URL-er for --spill 

PCSX2INFO="https://launchpad.net/~gregory-hainaut/+archive/ubuntu/pcsx2.official.ppa/+packages"
PROTONINFO="https://github.com/ValveSoftware/Proton#runtime-config-options"


# GTK TEMA URL-er 
PLATATHEMEURL="https://gitlab.com/tista500/plata-theme#plata-theme"
ADAPTATHEMEURL="https://github.com/adapta-project/adapta-gtk-theme#-adapta-gtk-theme"

# IKONER URL-er
PAPIRUSIKONTEMAURL="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme#contents"

# Info 
FONTS="Roboto og Noto-Sans"

# For -vm 
VIRTUALBOXPID="15316 15645"

# For -vm 
VIRTUALBOXDEP="libqt5opengl5"

# For --vm URL
# Må prøve og finne ut av hvorfor jeg ikke får installert virtualbox-6.0 fra apt der for er VIRTUALBOXDEB her
VIRTUALBOXDEB="https://download.virtualbox.org/virtualbox/6.0.0/virtualbox-6.0_6.0.0-127566~Ubuntu~bionic_amd64.deb"
VIRTUALBOXEXT="https://download.virtualbox.org/virtualbox/6.0.0/Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack"

# Filer for --vm
VBOXEXTPACK="Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack"

# Hashes for --vm
VIRTUALBOXSUMS="https://www.virtualbox.org/download/hashes/6.0.0/SHA256SUMS"

# Pakken nedfor er ikke i bruk 

#WINEDEPBIONIC="libavcodec57 libavcodec57:i386" 
#WINEDEPCOSMIC="libavcodec58 libavutil56 libvkd3d1  libavcodec58:i386 libavutil56:i386 libc6:i386 ibvkd3d1:i386"

# Funksjoner
installer-ubuntu-ppaer-hjelp() {

cat << _EOF_


 Kommandoer:

Legger til ppa-er til Ubuntu og Ubuntu baserte distroer som Linux Mint osv
Legger til ppa-er som Christian bruker på sine Ubuntu maskinere

    Kjøring av "installer-ubuntu-ppaer"  Installer ppa-er for Ubuntu.

    Med å legg til "--laptop" valget installere du disse pakkene "$TLP" og legger til ppa-en "$LAPTOP"
    Med å legg til "--grafikkkort" Får du muligheten til å velge om du vil ha en nyere nvida driver installert eller ikke. Den legger da til denne ppa-en "$NVIDIAPPA"
    Med å legg til "--spill" Installere Lutris en spill plattform for spill på Linux
   installer-ubuntu-ppaer-hjelp "--hjelp" Denne siden


_EOF_

}

    if
    [ "$1" == "--hjelp" ]; then
installer-ubuntu-ppaer-hjelp
    exit
    fi

installer-ubuntu-ppaer-help() {
cat << _EOF_

Legger til ppa-er til Ubuntu og Ubuntu baserte distroer som Linux Mint osv
Legger til ppa-er som Christian bruker på sine Ubuntu maskinere

 Kommandoer:

    Kjøring av "installer-ubuntu-ppaer"  Installer ppa-er for Ubuntu.

    Med å legg til "--laptop" valget installere du disse pakkene $TLP og legger til ppa-en $LAPTOP
    Med å legg til "--grafikkkort" Får du muligheten til å velge om du vil ha en nyere nvida driver installert eller ikke. Den legger da til denne ppa-en $NVIDIAPPA"
    Med å legg til "--spill" Installere Lutris en spill plattform for spill på Linux
   installer-ubuntu-ppaer-help "--help" Denne siden


_EOF_

}

    if
    [ "$1" == "--help" ]; then
    installer-ubuntu-ppaer-help
    exit
    fi



laptop() {
    echo "------------------------------------------------------------------------------------------------"
    echo "Installer pakker som er anbefalt for nyere i repo for Bærbar PC/Laptop som for eksemple batteri"
    echo "------------------------------------------------------------------------------------------------"
    }
    batteri()  {
    echo "---------------------------------"
    echo "Sjekker om laptop-en har batteri"
    echo "---------------------------------"
    if upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"
        then echo "Legger til $LAPTOP ppa-en" && sudo add-apt-repository --update $LAPTOP -y && sudo apt-get install $TLP -yyq
        echo "---------------------------------------------------------"
        echo "Ferdig med å installere disse pakkene $TLP"
        echo "---------------------------------------------------------"
    else
    echo "------------------------------------------------"
    echo -e "\e[1;31m Du har IKKÈ batteri i datamaskinen \e[0m" && sudo apt-get purge $GAMLELAPTOPPAKKER $TLP -yyq  >/dev/null
    echo "------------------------------------------------"
    exit
    fi

}
if  [ "$1" == "--laptop" ];then
laptop
batteri
exit
fi

gnome3 () {

    #gsettings set org.gnome.desktop.interface font-name $ADPTAFONT må fikses mer på 

echo "---------------------------------------------------"
echo "Sjekker Skrivebordsmiljø ditt"
echo "---------------------------------------------------"
if echo "$XDG_CURRENT_DESKTOP" | grep "GNOME"
	then
	echo "----------------------------------------------------------------"
    echo "Legger til disse pakkene $GNOMEPROGRAMVARER $GNOME for GNOME 3"
    echo "-----------------------------------------------------------------"
    echo "------------------------------------------------------------------------------------"
    echo "Legger til lollypop musikkspiller sin ppa og piper for kunne å konfigurere sin ppa"
    echo "-------------------------------------------------------------------------------------"
    sudo add-apt-repository --update $LOLLYPOP -y && sudo add-apt-repository --update $PIPER -y
    echo "-------------------------------------------------------------------------------"
    echo "Installer $GNOMEPROGRAMVARER $GNOME for GNOME 3"
    echo "-------------------------------------------------------------------------------"
    sudo apt-get install $PIPERDEB $GNOMEPROGRAMVARER $GNOME -yyq
    echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Setter $UTSEENDE som ikon tema og GTK+ tema det kan endres tilbake med gnome-tweaks eller dconf vis du er hardcore"
    echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    gsettings set org.gnome.desktop.interface gtk-theme $GTK
    gsettings set org.gnome.desktop.interface icon-theme $IKON
    gsettings set org.gnome.desktop.wm.preferences theme $GTK
    gsettings set org.gnome.shell.extensions.user-theme name $GTK
else
    echo "---------------------------------------------------------"
    echo "Skrivebordsmiljø ditt er IKKE GNOME"
    echo "---------------------------------------------------------"
fi
}


oppdaterpakker() {
echo "------------------------------------------------------"
echo "Oppdater pakkene før oppsett av grafikkkort skal skje"
echo "------------------------------------------------------"
sudo apt-get update && sudo apt-get upgrade -yyq
}

grafikkkort() {
echo "---------------------------------------------"
echo "Sjekker om du har et NVIDIA grafikkkort"
echo "---------------------------------------------"
if lspci | grep -ic --color "NVIDIA" 2>/dev/null
then
 echo "------------------------------------------------------"
 echo "Du har et NVDIA grafikkkort installere nvidia-settings" && sudo apt-get install software-properties-gtk nvidia-settings flatpak -yyq 
 echo "------------------------------------------------------"
else
 echo "----------------------------------..........."
 echo "\e[1;31m  Du har IKKE et NVDIA grafikkkort \e[0m" && sudo apt-get purge nvidia-settings -yyq
 echo "---------------------------------------------"
 exit
fi
}

nvidadriverversjon() {
echo "---------------------------------------------"
echo "Sjekker om du har et NVIDIA grafikkkort"
echo "---------------------------------------------"
if  lspci | grep -ic --color "NVIDIA" 2>/dev/null
then
echo "------------------------------------------------"    
echo "Du har et NVIDIA kort se versjon infoen nedfor"
echo "------------------------------------------------"
nvidia-smi | grep --color "Driver Version:"  
else
 echo "---------------------------------------------"
 echo "\e[1;31m  Du har IKKE et NVDIA grafikkkort \e[0m" 
 echo "---------------------------------------------"
 exit
fi
}


nvdia-ppa() {
while true;  do
read -r -p "Vil du legg til $NVIDIAPPA for å få nyere graikk driver oppdateringer. ADVARSEL NVIDIA DRIVERNE KAN VÆRE VELDIG USTABLI & KREVER OMSTASTART ETTER INSTALLASJOEN (j/n)?" valgnvdia
case "$valgnvdia" in
  [Jj]* ) echo "Legger til denne ppa $NVIDIAPPA og installer den versjon av nvidia-driver-$VERSJON" && sudo add-apt-repository --update $NVIDIAPPA -y && sudo apt-get install xserver-xorg-video-nvidia-$VERSJON nvidia-driver-$VERSJON libnvidia-cfg1-$VERSJON libnvidia-gl-$VERSJON:i386 libnvidia-common-415:i386 libnvidia-decode-$VERSJON:i386 libnvidia-decode-$VERSJON:i386 -yyq && sudo apt-get autoremove -yyq  
 exit;;
  [Nn]* ) echo "Nei legger IKKE til ppa til $NVIDIAPPA"; exit;;
  * ) echo "Ikke et svar";;
esac
done
}


flatpak-nvidia() {
echo "-------------------------------------------------------------------------"    
echo "Sjekker om flatpak er installert for å legge til NVIDIA flatpak driverne"
echo "--------------------------------------------------------------------------" 
if dpkg -l | grep -E "flatpak|nvidia-driver-$VERSJON" > /dev/null
then
sudo flatpak install flathub org.freedesktop.Platform.GL.nvidia-$VERSJON-18/x86_64/1.4 -y 
else
echo "-------------------------------------------------------------------------------------------------------------------"    
echo "\e[1;31m Flatpak eller nvidia-driveren er ikke installert så flatpak nvidia-driveren-$VERSJON blir ikke lagt til \e[0m"
echo "-------------------------------------------------------------------------------------------------------------------"    
fi
}

nvidaproblemer() {
if lspci | grep -qw "NVIDIA" && dpkg -l steam 2>/dev/null
then
echo "--------------------------------------------------------------------------"    
echo "\e[1;31m Det er nå $NVIDIAPROBLEMER så gå videre om du kan fikse dette \e[0m"
echo "--------------------------------------------------------------------------"   
echo "Sjekke ut $PROTONINFO for mer tips om feilsøking av Steamplay"
echo "--------------------------------------------------------------------------"
sleep 5
else 
echo "---------------------------------------------------------------------"    
echo "Du bruker ikke NVIDIA grafikkkort så det problemet gjelder ikke deg"
echo "-----------------------------------------------------------------------"   
fi 
}

if  [ "$1" == "--grafikkort" ];then
grafikkkort
nvidadriverversjon
nvidaproblemer
oppdaterpakker
flatpak-nvidia
nvdia-ppa
exit
fi




spill()  {
echo "-------------------------------------------------------"
echo "Installere Lutris en spill plattform for spill på Linux"
echo "--------------------------------------------------------"
ver=$(lsb_release -sr); if [  $ver != "18.04" -a  $ver != "17.10" -a $ver != "17.04" -a $ver != "16.04" ]; then ver=16.04; fi
echo "deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
wget -q http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/Release.key -O- | sudo apt-key add -
sudo apt-get update -yyq
sudo apt-get install lutris -yyq

blizzard(){
echo "-------------------------------------------------------"
echo "Pakker for Ubuntu at Battle.net skal funke med lutris"
echo "--------------------------------------------------------"
sudo apt-get install $BATTLENET $BATTLENETWINE -yyq
echo "-------------------------------------------------------"
echo "Installere WineHQ for battle.net"
echo "--------------------------------------------------------"
sudo dpkg --add-architecture i386
cd "/tmp/" || exit
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
if echo "$KODENAVN" | grep -qw "cosmic"
then
echo "---------------------------------------------"
echo "Legger til wine i apt for Ubuntu 18.10"
echo "---------------------------------------------"    
sudo apt-add-repository  'deb https://dl.winehq.org/wine-builds/ubuntu/ cosmic main'
sudo apt update -yqq
sudo apt-get install --install-recommends winehq-staging -yyq
sudo apt-get upgrade -yyq 
else 
   echo "$KODENAVN" | grep -qw "bionic"
echo "---------------------------------------------"
echo "Legger til wine i apt for Ubuntu 18.04"
echo "---------------------------------------------"
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
sudo apt update -yqq
sudo apt-get install --install-recommends winehq-staging -yyq
sudo apt-get upgrade -yyq 
fi

echo "---------------------------------------------"
echo "Sjekker om du har et NVIDIA grafikkkort"
echo "---------------------------------------------"
if  lspci | grep -ic --color "NVIDIA" >/dev/null
then
 echo "---------------------------------------------------------------"
 echo "Du har et NVDIA grafikkkort installere Vulkan for DXVK støtte" && sudo apt-get install libvulkan1 libvulkan1:i386  -yyq 
 echo "--------------------------------------------------------------"
else
 echo "----------------------------------------------"
 echo -e "\e[1;31m  Du har IKKE et NVDIA grafikkkort \e[0m" && sudo apt-get purge libvulkan1 libvulkan1:i386 -yyq
 echo "---------------------------------------------"
 exit
fi
}


renser(){
cd /etc/apt/sources.list.d  || exit 
echo "Fjerner pcsx2 sin ppa" 
sudo rm gregory-hainaut-ubuntu-pcsx2_official_ppa-cosmic.list  gregory-hainaut-ubuntu-pcsx2_official_ppa-cosmic.list.save 2>/dev/null
sudo apt-get -yyq    
echo "Følgende pakker ble automatisk installert og er ikke lenger påkrevet" 2>/dev/null && sudo apt-get autoremove -yyq 
exit 
 }
}


if  [ "$1" == "--spill" ];then
    spill
    blizzard
    renser
    
fi

vmrunning(){  
if pgrep "VirtualBox" | grep "$VIRTUALBOXPID"
then
echo "--------------------------------------------------------------------------------"
echo "Virtualbox kjører forsatt"
echo "--------------------------------------------------------------------------------"		
kill $VIRTUALBOXPID
else 
echo "--------------------------------------------------------------------------------"
echo "Virtualbox kjører ikke"
echo "--------------------------------------------------------------------------------"		
fi 
}


# kommandoen sed -i '$ d' navnpåtekst.txt sletter den siste linjen i en fil 

qtvm () {  
if  cat $HOME/.profile | grep -qw "export QT_QPA_PLATFORMTHEME=gtk2"
	then
sed -i '$ d' $HOME/.profile		
echo "------------------------------------------------------------------------------------------------------------------------"
echo "Fjerner QT tema variablen på grunn av problemer med gtk2 tema i virtualbox-6.0 og krever omstart for å bli tatt i bruk"
echo "-------------------------------------------------------------------------------------------------------------------------"
else 
echo "--------------------------------------------------------------------------------"
echo "Du har ikke gtk2 tema satt i "$HOME/.profile""
echo "--------------------------------------------------------------------------------"	
fi
}

#  VBoxManage extpack install kan også brukes for å installer virtualbox ext pack fra terminalen  

vm() {   
echo "-------------------------------------------------"
echo "Sjekker om Virtualisering er aktivert eller ikke"
echo "-------------------------------------------------"
sudo apt-get install cpu-checker  -yyq  >/dev/null
if sudo kvm-ok | grep "can be used" >/dev/null
echo "-------------------------------------------------"
then
echo "----------------------------------------------------------------"
echo "Fjerner Virtualbox som er installert fra  Ubuntu repositories"
echo "------------------------------------------------------------------" 	
sudo apt-get purge virtualbox virtualbox-qt virtualbox-ext-pack -yyq	
echo "----------------------------------------------------------------"
echo "NB Krever sudo for å ta backup av /etc/apt/sources.list"
echo "------------------------------------------------------------------" 
cd /etc/apt || exit 
sudo cp sources.list sources.list.save 
echo "----------------------------------------------------------------"
echo "Legger til Orcal Virtualbox i /etc/apt/sources.list filen"
echo "------------------------------------------------------------------"   
sudo echo deb https://download.virtualbox.org/virtualbox/debian $KODENAVN contrib /etc/apt/sources.list
echo "----------------------------------------------------------------"
echo "Later ned og legger til Oracle vbox nøkkeler "
echo "------------------------------------------------------------------"  
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt update
sudo apt-get install $VIRTUALBOXDEP -yyq 
sudo apt-get autoremove -yyq
echo "-------------------------------------------------"
echo "Installer Virtualbox 6.0 fra deb filen til Oracle"
echo "-------------------------------------------------"
cd /tmp/ || exit 
wget -O virtualbox-6.0.deb "$VIRTUALBOXDEB" -P /tmp/ && sudo dpkg -i /tmp/virtualbox-6.0.deb	
else
echo "----------------------------------------------------------------------------------------------------"
echo -e "\e[1;31m  Du har ikke Virtualisering aktivert sjekk om du kan aktivere Virtualisering i UEFI/BIOS \e[0m" &&  sudo apt-get purge cpu-checker virtualbox-6.0 $VIRTUALBOXDEP -yyq
echo "-----------------------------------------------------------------------------------------------------"
fi
}



installext(){   
echo "----------------------------------------------------------------"
echo "Later ned VirtualBox 6.0.0 Oracle VM VirtualBox Extension Pack"
echo "------------------------------------------------------------------"
cd /tmp/ || exit 
echo "----------------------------------------------------------------------------------"
echo "Putter VirtualBox 6.0.0 Oracle VM VirtualBox Extension Pack i /tmp/"
echo "----------------------------------------------------------------------------------"
wget "$VIRTUALBOXEXT" -P /tmp/ && wget -O SHA256SUMS "$VIRTUALBOXSUMS" -P /tmp/ 
echo "----------------------------------------------------------------"
echo "Sjekker om sha256sum til $VBOXEXTPACK er riktig"
echo "------------------------------------------------------------------"
cd /tmp/ || exit 
sha256sum -c $VBOXEXTPACK SHA256SUMS  2>&1 | grep --color=always  "OK"
sleep 10	
echo "----------------------------------------------------------------------------------"
echo "Installer VirtualBox 6.0.0 Oracle VM VirtualBox Extension Pack "
echo "----------------------------------------------------------------------------------"
if  cat $HOME/.profile | grep -qw "export QT_QPA_PLATFORMTHEME=gtk2"
	then
sed -i '$ d' $HOME/.profile	&&	vboxmanage extpack install /tmp/$VBOXEXTPACK 
echo "------------------------------------------------------------------------------------------------------------------------"
echo "Fjerner QT tema variablen på grunn av problemer med gtk2 tema i virtualbox-6.0 og krever omstart for å bli tatt i bruk"
echo "-------------------------------------------------------------------------------------------------------------------------"
else 
echo "--------------------------------------------------------------------------------"
echo "Du har ikke gtk2 tema satt i "$HOME/.profile""
echo "--------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------"
echo "Derfor blir Virtualbox extpack installert med hjelp av gui"
echo "--------------------------------------------------------------------------------"	
chmod +x $VBOXEXTPACK && virtualbox /tmp/$VBOXEXTPACK 
fi
}




sjekk-virtualbox() {
echo "----------------------------------------------------------------"
if echo "Sjekker om virtualbox er installert" && dpkg --get-selections | grep -qw "virtualbox-6.0"
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


if  [ "$1" == "--vm" ];then
	vmrunning
    vm
    installext
    sjekk-virtualbox
    exit
    fi

# Scripet starter
installer-ubuntu-ppaer() {
echo "--------------------------------------------------------------"
echo "SCRITPET MÅ BLI KJØRT MED SUDO RETTIGHETER!!!"
echo "-------------------------------------------------------------"
echo "Installer $UBUNTUPAKKER som lar deg legg til ppas i Ubuntu"
echo "-------------------------------------------------------------"
dpkg -l software-properties-common && sudo apt-get install software-properties-common -yyq
echo "-------------------------------------------------------"
echo "Legger til Ubuntu PPAS $VER"
echo "$NYTT i $VER"
echo "$ENDRINGER i $VER"
echo  "$TINGFJERNET fra $VER"
echo "$OS"
echo "Sist endret $SISTENDRET"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har en laptop?, legg til --laptop for å installere de anbefalt pakkene"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har et nvida grafikkkort?, legg til --grafikkkort for å installere nyere nvida driver versjon"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har lyst til å spille på Windows PC-spill med wine legg til --spill"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------"
echo "Legger til $UTSEENDEPPAS"
echo "----------------------------------------------------"
sudo add-apt-repository --update $ADAPTA -y && sudo add-apt-repository $PAPIRUS --update -y
sudo add-apt-repository --update $PLATATHEME -y
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Sjekk ut disse URL-ene $ADAPTATHEMEURL $PLATATHEMEURL for mer info om GTK"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Sjekk ut den URL-en $PAPIRUSIKONTEMAURL for mer info om ikon tema et"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
sleep 5
echo "----------------------------------------------------------------"
echo "Installere $FONTS som er anbefalt å bruke sammen med $UTSEENDE"
echo "Installer $UTSEENDE $PROGRAMTEMA $FONTER"
echo "---------------------------------------------------------------"
sudo apt-get install $UTSEENDE $FONTER -yqq
sleep 5
if dpkg --get-selections | grep -qw "$PROGRAMVARER"
    then
        echo "-----------------------------------------------------------------------"
        echo "Du har alt $PROGRAMVARER installert så $PROGRAMTEMA vil bli installert"
        sudo apt-get install $PROGRAMTEMA -yyq
        echo "-----------------------------------------------------------------------"
else
echo "---------------------------------------------------------------------------------------------"
echo -e "\e[1;31m  Du har IKKE $PROGRAMVARER installert så $PROGRAMTEMA blir IKKE installert \e[0m"
echo "----------------------------------------------------------------------------------------------"
fi
}

avslutter()  {
echo "---------------------------------------------------------------------------------------------"
echo "Følgende pakker ble automatisk installert og er ikke lenger påkrevet" 2>/dev/null && sudo apt-get autoremove -yyq 
echo "FERDIG MED INSTALLASJOEN AV PPAS PÅ UBUNTU"
echo "---------------------------------------------------------------------------------------------"
exit
}

installer-ubuntu-ppaer
gnome3
avslutter


#echo "----------------------------------------------------------------------------------------------------------"
#echo "'deb https://dl.winehq.org/wine-builds/ubuntu/ distrokodenavnet stå main' må oppdaters manuelt midlertig"
#echo "-----------------------------------------------------------------------------------------------------------"


# IKKE i bruk fra og med 06 jan 2019 

#pcsx2setup()  {
#if dpkg -l | grep -qw "pcsx2"
#then
#echo "----------------------------------------------------------------"
#echo "Legger til $PCSX2 pcsx2 sin ppa"
#echo "------------------------------------------------------------------"
#sudo add-apt-repository $PCSX2 -y
#sudo apt-get update && sudo apt-get install $PCSX2PAKKER -yyq
#else
# echo "----------------------------------------------------------------------------------------------------------------------------"
#echo "\e[1;31m PCSX2 er ikke støtte i den versjon av Ubuntu 18.04 \e[0m"
# echo  "Sjekk her om PCSX2 har blitt oppdatert $PCSX2INFO"
# echo "---------------------------------------------------------------------------------------------------------------------------"
#fi
 # }

 # Spill ppa og spill pakker
#PCSX2="ppa:gregory-hainaut/pcsx2.official.ppa"
#PCSX2PAKKER="pcsx2 libusb-0.1-4:i386"
