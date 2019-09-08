#!/bin/bash

# Legger til Ubuntu PPAS

# Variabler:
SISTENDRET="31.aug.2019"
ENDRINGER="Ingen endinger"
TINGFJERNET=""
NYTT="Lagt til libreoffice-style-papirus"
VER="Versjon 1.1.3.1"
OS="Sist testet på Ubuntu 18.04"
KODENAVN="$(lsb_release -sc)"



# NVIDIA Grafikkort ppa
NVIDIAPPA="ppa:graphics-drivers/ppa"

# NVIDA grafikkort ppa info
VERSJON="430"
NVIDAFLATPAKVERJON="14"
NVIDIAPROBLEMER="Sjekker her https://www.nvidia.com/download/driverResults.aspx/145182/en-us om nvidia grafikkort ditt støtter nvidia-driver-$VERSJON"


# NVIDA grafikkort ppa pakker
NVIDIAPAKKER="xserver-xorg-video-nvidia-$VERSJON nvidia-driver-$VERSJON libnvidia-cfg1-$VERSJON"
NVIDIA32BITPAKKER="libnvidia-gl-$VERSJON:i386 libnvidia-common-$VERSJON:i386 libnvidia-decode-$VERSJON:i386 libnvidia-decode-$VERSJON:i386" 


# NVIDIA sine Vulkan pakker
NVIDIAVULKANPAKKER="libvulkan1 libvulkan1:i386"

# Nødvendige pakker for at scripet skal funke
# TEMA ppa og Pakker
UBUNTUPAKKER="software-properties-gtk ubuntu-drivers-common"

# Synciting pakker 
SYNCTHINGDEB="curl"

#  cryptomator ppa 
CRYPTOMATORPPA="ppa:sebastian-stenzel/cryptomator"


# GNOME ppaer
LOLLYPOP="ppa:gnumdk/lollypop"
PIPER="ppa:libratbag-piper/piper-libratbag-git"

# GNOME ppa pakker
GNOMEPROGRAMVARER="lollypop piper"
PIPERDEB="liblur3 libratbag-tools lur-command ratbagd"

# Nødvendige pakker for at --laptop skal funke
GAMLELAPTOPPAKKER="laptop-mode-tools tlp tlp-rdw"

# Laptop ppa-er og pakker
LAPTOP="ppa:linrunner/tlp"
TLP="tlp tlp-rdw"

INTELGRAFIKKORT="ppa:paulo-miguel-dias/pkppa"
MESA="libgl1-mesa-glx:i386 libgl1-mesa-dri:i386"

# Nødvendige pakker for at GNOME skal kunne endre team og ikoner 
GNOME="gnome-tweak-tool gsettings-desktop-schemas"

# GTK THEME

PLATATHEME=ppa:tista/plata-theme
ADAPTA="ppa:tista/adapta"

# IKONE THEME

PAPIRUS="ppa:papirus/papirus" 

UTSEENDEPPAS="ppa:papirus/papirus  ppa:tista/plata-theme"
UTSEENDE="papirus-icon-theme plata-theme papirus-folders"

# Programvarer med støtte for Papirus som ikone theme

PROGRAMTEMA="filezilla-theme-papirus libreoffice-style-papirus"
PROGRAMVARER="filezilla-common libreoffice"

# Pakker fra Ubuntu repo for Plata og Adpata
FONTER="fonts-roboto fonts-noto fonts-noto-color-emoji"

# PPA for --spill

LUTRIS="ppa:lutris-team/lutris"

# Pakker som installers med bruke av --spill

#  Wine Spill pakker for Battle.net fra Ubuntu repo
BATTLENET="ttf-mscorefonts-installer libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libsqlite3-0:i386"
BATTLENETWINE="winbind"

# For Wine generelt
WINEPAKKER="winehq-staging wine-staging wine-staging-i386 libasound2-plugins:i386 winetricks"
# For DXVK generelt
DXVKPAKKER="dxvk dxvk-wine32-development dxvk-wine64-development"
LUTRISEXTRAWINEPAKKER="libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386"

# URL-er

# Spill URL-er for --spill 

PCSX2INFO="https://launchpad.net/~gregory-hainaut/+archive/ubuntu/pcsx2.official.ppa/+packages"
PROTONINFO="https://github.com/ValveSoftware/Proton#runtime-config-options"
BATTLENETINFO="https://github.com/lutris/lutris/wiki/Game:-Blizzard-App"

SCCONTROLLERINFO="https://github.com/kozec/sc-controller"


# DXVK Deb pakke URL-er for --spill 
DXVK096DEB="http://ftp.br.debian.org/debian/pool/main/d/dxvk/dxvk_0.96+ds1-1_all.deb"
DXVKWINE64DEB="http://ftp.br.debian.org/debian/pool/main/d/dxvk/dxvk-wine64-development_0.96+ds1-1_amd64.deb"

# GTK TEMA URL-er 
PLATATHEMEURL="https://gitlab.com/tista500/plata-theme#plata-theme"
ADAPTATHEMEURL="https://github.com/adapta-project/adapta-gtk-theme#-adapta-gtk-theme"

# IKONER URL-er
PAPIRUSIKONTEMAURL="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme#contents"

# Info 

# GNOME Gsettings
GTK="Plata-Noir-Compact"
IKON="Papirus-Dark"
ADPTAFONT="Roboto"

FONTS="Roboto og Noto-Sans"

# For -vm 
VIRTUALBOXPID="15316 15645"

# For -vm 
VIRTUALBOXDEP="libqt5opengl5"

# For --vm URL
# Må prøve og finne ut av hvorfor jeg ikke får installert virtualbox-6.0 fra apt der for er VIRTUALBOXDEB her
VIRTUALBOXDEB="https://download.virtualbox.org/virtualbox/6.0.6/virtualbox-6.0_6.0.6-130049~Ubuntu~bionic_amd64.deb" 
VIRTUALBOXEXT="https://download.virtualbox.org/virtualbox/6.0.6/Oracle_VM_VirtualBox_Extension_Pack-6.0.6.vbox-extpack"
VIRTUALBOXVERSJON="6.0.6"
# Filer for --vm
VBOXEXTPACK="Oracle_VM_VirtualBox_Extension_Pack-$VIRTUALBOXVERSJON.vbox-extpack"

# Hashes for --vm
VIRTUALBOXSUMS="https://www.virtualbox.org/download/hashes/6.0.6/SHA256SUMS"

FJERNINGVIRTUALBOXREPO="virtualbox virtualbox-qt virtualbox-ext-pack virtualbox-guest-additions-iso virtualbox-dkms"

# $ADAPTA støtter ikke disco enda

#sudo add-apt-repository --update $ADAPTA -y

# Funksjoner
installer-ubuntu-ppaer-hjelp() {

cat << _EOF_


 Kommandoer:

Legger til ppa-er som Christian bruker på sine Ubuntu og Ubuntu baserte distroer som Linux Mint osv maskinere

    Kjøring av "installer-ubuntu-ppaer"  Installer ppa-er for Ubuntu.

    Med å legg til "--laptop" valget installere du disse pakkene "$TLP" og legger til ppa-en "$LAPTOP" som forbedrer batteriet på laptoper
    Med å legg til "--grafikkkort" Får du muligheten til å velge om du vil ha en nyere NVIDIA-driver installert eller ikke. Den legger da til denne ppa-en $NVIDIAPPA"
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

Legger til ppa-er som Christian bruker på sine Ubuntu og Ubuntu baserte distroer som Linux Mint osv maskinere

 Kommandoer:

    Kjøring av "installer-ubuntu-ppaer"  Installer ppa-er for Ubuntu.

    Med å legg til "--laptop" valget installere du disse pakkene "$TLP" og legger til ppa-en "$LAPTOP" som forbedrer batteriet på laptoper
    Med å legg til "--grafikkkort" Får du muligheten til å velge om du vil ha en nyere NVIDIA-driver installert eller ikke. Den legger da til denne ppa-en $NVIDIAPPA"
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
    echo "Installer nyere pakker som er anbefalt for Bærbar PC/Laptop som for eksemple batteri fra PPAS"
    echo "------------------------------------------------------------------------------------------------"
    }
    batteri()  {
    echo "---------------------------------"
    echo "Sjekker om laptop-en har batteri"
    echo "---------------------------------"
    if upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"
        then echo "Legger til "$LAPTOP" ppa-en" && sudo add-apt-repository --update $LAPTOP -y && sudo apt install $TLP -yyq
        echo "---------------------------------------------------------"
        echo "Ferdig med å installere disse pakkene "$TLP""
        echo "---------------------------------------------------------"
    else
    echo "------------------------------------------------"
    echo -e "\e[1;31m Du har IKKÈ batteri i laptop-en \e[0m" && sudo apt purge $GAMLELAPTOPPAKKER $TLP -yyq && sudo apt --purge autoremove -yyq 
    echo "------------------------------------------------"
    fi
   } 

   laptopgrafikkort() { 
   if lspci  | grep -qw "Intel Corporation HD Graphics 620"
   then
    echo "----------------------------------------------------------------------------------------------"
    echo "Legger til "$INTELGRAFIKKORT" ppa-en nyere versjon av Mesa driverne for Intel sitt grafikkkort"
    echo "------------------------------------------------------------------------------------------------"
     sudo add-apt-repository --update $INTELGRAFIKKORT -y 
      sudo apt update -yyq && sudo apt upgrade -yyq
     sudo apt install $MESA -yyq
else
echo "------------------------------------------------"
echo -e "\e[1;31m Du har IKKE Intel grafikkkort i laptop-en \e[0m" && sudo apt purge $MESA -yyq && sudo apt --purge autoremove -yyq 
echo "------------------------------------------------" 
fi 
} 


if  [ "$1" == "--laptop" ];then
laptop
batteri
laptopgrafikkort
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
    echo "Installer "$GNOMEPROGRAMVARER" "$GNOME" for GNOME 3"
    echo "-------------------------------------------------------------------------------"
    sudo apt install $PIPERDEB $GNOMEPROGRAMVARER $GNOME -yyq
    echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Setter "$UTSEENDE" som ikon tema og GTK+ tema det kan endres tilbake med gnome-tweaks eller dconf vis du er hardcore"
    echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    gsettings set org.gnome.desktop.interface gtk-theme $GTK
    gsettings set org.gnome.desktop.interface icon-theme $IKON
    gsettings set org.gnome.desktop.wm.preferences theme $GTK
    gsettings set org.gnome.shell.extensions.user-theme name $GTK
else
    echo "---------------------------------------------------------"
    echo -e "\e[1;31m Skrivebordsmiljø ditt er IKKE GNOME \e[0m"
    echo "---------------------------------------------------------"
fi
}


oppdaterpakker() {
echo "------------------------------------------------------"
echo "Oppdater pakkene før oppsett av grafikkkort skal skje"
echo "------------------------------------------------------"
sudo apt update && sudo apt upgrade -yyq
}

nvidiagrafikkkort() {
# Sjekker om det finnes en eller flere NVIDIA enheter på datamaskien 
# Fjern q fra grep -icq --color "NVIDIA" da kan du se antall NVIDIA enheter
echo "---------------------------------------------"
echo "Sjekker om du har et NVIDIA grafikkkort"
echo "---------------------------------------------"
if lspci | grep -icq --color "NVIDIA"
then
 echo "-------------------------------------------------------------------"
 echo "Du har et NVDIA grafikkkort installere nvidia-settings og flatpak"  
 echo "-------------------------------------------------------------------"
 sudo apt install software-properties-gtk nvidia-settings flatpak -yyq 
else
 echo "----------------------------------..........."
 echo "\e[1;31m  Du har IKKE et NVDIA grafikkkort \e[0m" 
 echo "---------------------------------------------"
 sudo apt purge nvidia-settings -yyq
 exit
fi
}

nvidadriverversjon() {
# Sjekker om det finnes en eller flere NVIDIA enheter på datamaskien 
# Fjern q fra grep -icq --color "NVIDIA" da kan du se antall NVIDIA enheter
echo "---------------------------------------------"
echo "Sjekker om du har et NVIDIA grafikkkort"
echo "---------------------------------------------"
if lspci | grep -icq --color "NVIDIA" 
then
echo "------------------------------------------------"    
echo "Du har et NVIDIA kort se versjon infoen nedfor"
echo "------------------------------------------------"
# nvidia-smi sjekker hvilken NVIDIA Drvier versjon som er installert
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
  [Jj]* ) echo "Legger til denne ppa $NVIDIAPPA og installer den versjon av nvidia-driver-$VERSJON" && sudo add-apt-repository --update $NVIDIAPPA -y && sudo apt install $NVIDIAPAKKER $NVIDIA32BITPAKKER -yyq && sudo apt autoremove -yyq  
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
if dpkg -l | grep -Eq "flatpak|nvidia-driver-$VERSJON" 
then
sudo flatpak install flathub org.freedesktop.Platform.GL.nvidia-$VERSJON-$NVIDAFLATPAKVERJON/x86_64/1.4 -y 
else
echo "-------------------------------------------------------------------------------------------------------------------"    
echo "\e[1;31m Flatpak eller nvidia-driveren er ikke installert så flatpak nvidia-driveren-$VERSJON blir ikke lagt til \e[0m"
echo "-------------------------------------------------------------------------------------------------------------------"    
fi
}

nvidaproblemer() {
if lspci | grep -qw "NVIDIA" 
then
echo "------------------------------------------------------------------------------------------------------------------------------------------"    
echo -e "\e[1;31m "$NVIDIAPROBLEMER"  \e[0m"
echo "-------------------------------------------------------------------------------------------------------------------------------------------"   
else 
echo "---------------------------------------------------------------------"    
echo "Du bruker ikke NVIDIA grafikkkort så det problemet gjelder ikke deg"
echo "-----------------------------------------------------------------------"   
fi 
}

if  [ "$1" == "--grafikkort" ];then
nvidiagrafikkkort
nvidadriverversjon
nvidaproblemer
oppdaterpakker
flatpak-nvidia
nvdia-ppa
exit
fi




spill()  {
echo "--------------------------------------------------------"
echo "Installere Lutris en spill plattform for spill på Linux"
echo "--------------------------------------------------------"
sudo add-apt-repository --update $LUTRIS -y 
sudo apt install lutris -yyq
echo "-----------------------------------------------------------------------------"
echo "Installere SC-controller lar deg endre på DS4 kontroll,Steam kontroller osv"
echo "----------------------------------------------------------------------------"
cd /tmp/ || exit 
wget -nv https://download.opensuse.org/repositories/home:kozec/xUbuntu_18.10/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/kozec/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:kozec.list"
sudo apt update -yqq
sudo apt install sc-controller -yyq 
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Sjekke ut "$SCCONTROLLERINFO" for mer info om sc-controller"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------"

blizzard(){
# Installer alt wine pakker som skal til for at Battle.net launcheren funker i Lutris på Ubuntu
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Legger til disse "$BATTLENET" "$BATTLENETWINE" pakkene  til Ubuntu for at Blizzard Battle.net skal funke med lutris"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "---------------------------------------------------------------------"
sudo apt install $BATTLENET $BATTLENETWINE -yyq
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Sjekke ut "$BATTLENETINFO" for mer info om det skulle oppstå problemer med Blizzard Battle.net"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------"
sleep 5
echo "-------------------------------------------------------"
echo "Installere WineHQ for battle.net"
echo "--------------------------------------------------------"
# Legger til 32 bit støtte for Ubuntu sånn at kan wine brukes 32-bit programvarer
sudo dpkg --add-architecture i386
cd "/tmp/" || exit
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
if echo "$KODENAVN" | grep -qw "disco"
then
echo "---------------------------------------------"
echo "Legger til wine i apt for Ubuntu 19.04"
echo "---------------------------------------------"    
sudo apt-add-repository  'deb https://dl.winehq.org/wine-builds/ubuntu/ disco main'
sudo apt update -yqq
sudo apt install --install-recommends $WINEPAKKER $LUTRISEXTRAWINEPAKKER -yyq
sudo apt upgrade -yyq 
else 
echo "$KODENAVN" | grep -qw "bionic"
echo "---------------------------------------------"
echo "Legger til wine i apt for Ubuntu 18.04 LTS"
echo "---------------------------------------------"
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
sudo apt update -yqq
sudo apt install --install-recommends $WINEPAKKER $LUTRISEXTRAWINEPAKKER -yyq
sudo apt upgrade -yyq 
fi
}

setupdxvk(){
echo "-----------------------------------------------------------------------------------"
echo "Setter opp DXVK"
echo "-------------------------------------------------------------------------------------"    
if echo "$KODENAVN" | grep -qw "disco"   
then 
echo "-----------------------------------------------------------------------------------"
echo "Installer DXVK fra Ubuntu disco sitt repo"
echo "-------------------------------------------------------------------------------------" 
sudo apt install $DXVKPAKKER -yyq 
else
echo "$KODENAVN" | grep -qw "bionic"
echo "-----------------------------------------------------------------------------------"
echo "Setter opp DXVK for Ubuntu siden DXVK ikke er Ubuntu repo for cosmic/bionic"
echo "-------------------------------------------------------------------------------------" 
cd "/tmp/" || exit
echo "-----------------------------------------------------------------------------------"
echo "Laster ned DXVK 0.96 deb pakkene"
echo "-------------------------------------------------------------------------------------"      
wget $DXVK096DEB && wget $DXVKWINE64DEB
echo "-----------------------------------------------------------------------------------"
echo "Installer DXVK 0.96 fikser dependencies problemer"
echo "-------------------------------------------------------------------------------------"  
sudo dpkg -i dxvk* 
sleep 5
echo "--------------------------------------------------------------------------------------"
echo "Fikser dependencies problemer etter å ha installert dxvk"
echo "-------------------------------------------------------------------------------------"
sudo apt --fix-broken install -yyq
sleep 5
echo "--------------------------------------------------------------------------------------"
echo "Setter WINEPREFIX for DXVK"
echo "-------------------------------------------------------------------------------------"
cd /usr/lib/dxvk/wine64-development/ || exit 
./setup_dxvk.sh install -y
fi
}

nvidiavulkan(){
# Fjern q fra grep -icq --color "NVIDIA" da kan du se antall NVIDIA enheter    
echo "---------------------------------------------"
echo "Sjekker om du har et NVIDIA grafikkkort"
echo "---------------------------------------------"
if  lspci | grep -icq --color "NVIDIA" 
then
 echo "---------------------------------------------------------------"
 echo "Du har et NVDIA grafikkkort installere Vulkan for DXVK støtte" && sudo apt install $NVIDIAVULKANPAKKER -yyq 
 echo "--------------------------------------------------------------"
else
 echo "----------------------------------------------"
 echo -e "\e[1;31m  Du har IKKE et NVDIA grafikkkort \e[0m" && sudo apt purge $NVIDIAVULKANPAKKER  -yyq
 echo "---------------------------------------------"
 exit
fi
}


renser(){
echo "Følgende pakker ble automatisk installert og er ikke lenger påkrevet" 2>/dev/null && sudo apt autoremove -yyq 
exit 
 }
}


if  [ "$1" == "--spill" ];then
    spill
    blizzard
    setupdxvk
    nvidiavulkan
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
sudo apt install cpu-checker -yyq  
if sudo kvm-ok | grep -qw "can be used"
echo "-------------------------------------------------"
then
echo "----------------------------------------------------------------"
echo "Fjerner Virtualbox som er installert fra  Ubuntu repositories"
echo "------------------------------------------------------------------" 	
sudo apt purge $FJERNINGVIRTUALBOXREPO-* -yyq	
echo "----------------------------------------------------------------"
echo "NB Krever sudo for å ta backup av /etc/apt/sources.list"
echo "------------------------------------------------------------------" 
cd /etc/apt || exit 
sudo cp sources.list sources.list.save 
echo "----------------------------------------------------------------"
echo "Legger til Orcal Virtualbox i /etc/apt/sources.list filen"
echo "------------------------------------------------------------------"   
sudo echo deb https://download.virtualbox.org/virtualbox/debian $KODENAVN contrib /etc/apt/sources.list
echo "---------------------------------------------------------------------------------------"
echo "Later ned og legger til Oracle vbox nøkkeler for Virtualbox "$VIRTUALBOXVERSJON""
echo "---------------------------------------------------------------------------------------"  
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt update -yyq 
sudo apt install --install-recommends  $VIRTUALBOXDEP -yyq 
sudo apt autoremove -yyq
echo "--------------------------------------------------------------------"
echo "Installer Virtualbox "$VIRTUALBOXVERSJON" fra deb filen til Oracle"
echo "-------------------------------------------------------------------"
cd /tmp/ || exit 
wget -O virtualbox-"$VIRTUALBOXVERSJON".deb "$VIRTUALBOXDEB" -P "/tmp/" && sudo dpkg -i virtualbox-"$VIRTUALBOXVERSJON".deb
sleep 2	
sudo apt --fix-broken install -yyq
sleep 2
echo "----------------------------------------------------------------"
echo "Setter opp virtualbox-dkms for virtualbox-"$VIRTUALBOXVERSJON""
echo "------------------------------------------------------------------" 
sudo /sbin/vboxconfig
else
echo "----------------------------------------------------------------------------------------------------"
echo -e "\e[1;31m  Du har ikke Virtualisering aktivert sjekk om du kan aktivere Virtualisering i UEFI/BIOS \e[0m" &&  sudo apt purge cpu-checker virtualbox-6.0 $VIRTUALBOXDEP -yyq
echo "-----------------------------------------------------------------------------------------------------"
fi
}



installext(){   
echo "------------------------------------------------------------------------------"
echo "Later ned VirtualBox "$VIRTUALBOXVERSJON" Oracle VM VirtualBox Extension Pack"
echo "-------------------------------------------------------------------------------"
cd /tmp/ || exit 
echo "----------------------------------------------------------------------------------"
echo "Putter VirtualBox "$VIRTUALBOXVERSJON" Oracle VM VirtualBox Extension Pack i /tmp/"
echo "----------------------------------------------------------------------------------"
wget "$VIRTUALBOXEXT" -P /tmp/ && wget -O SHA256SUMS "$VIRTUALBOXSUMS" -P /tmp/ 
echo "----------------------------------------------------------------"
echo "Sjekker om sha256sum til "$VBOXEXTPACK" er riktig"
echo "------------------------------------------------------------------"
sha256sum -c $VBOXEXTPACK SHA256SUMS  2>&1 | grep --color=always "OK"
sleep 10	
echo "----------------------------------------------------------------------------------"
echo "Installer VirtualBox "$VIRTUALBOXVERSJON" Oracle VM VirtualBox Extension Pack "
echo "----------------------------------------------------------------------------------"
if  cat $HOME/.profile | grep -qw "export QT_QPA_PLATFORMTHEME=gtk2"
	then
sed -i '$ d' $HOME/.profile	&&	/usr/bin/vboxmanage extpack install /tmp/"$VBOXEXTPACK" 
echo "-----------------------------------------------------------------------------------------------------------------------------------------"
echo "Fjerner QT tema variablen på grunn av problemer med gtk2 tema i virtualbox-"$VIRTUALBOXVERSJON" og krever omstart for å bli tatt i bruk"
echo "------------------------------------------------------------------------------------------------------------------------------------------"
else 
echo "--------------------------------------------------------------------------------"
echo "Du har ikke gtk2 tema satt i "$HOME/.profile""
echo "--------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------"
echo "Derfor blir Virtualbox extpack installert med hjelp av gui"
echo "--------------------------------------------------------------------------------"	
chmod +x /tmp/"$VBOXEXTPACK" && /usr/bin/vboxmanage extpack install /tmp/"$VBOXEXTPACK"
fi
}




sjekk-virtualbox() {
echo "----------------------------------------------------------------"
echo "Sjekker om virtualbox er installert"
echo "---------------------------------------------------------------"
if  dpkg --get-selections | grep -qw "virtualbox-"$VIRTUALBOXVERSJON""
then
groups | grep -icq "vboxusers"
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
echo "-------------------------------------------------------------------------------------------"
echo "SCRITPET MÅ BLI KJØRT MED SUDO RETTIGHETER!!!"
echo "---------------------------------------------------------------------------------------------------------------------------------------"
echo "Installer "$UBUNTUPAKKER" som lar deg legg til ppas i Ubuntu og Ubuntu baserte distroer"
echo "----------------------------------------------------------------------------------------------------------------------------------------"
dpkg -l software-properties-common && sudo apt install software-properties-common --no-install-recommends -yyq
echo "-------------------------------------------------------"
echo "Legger til Ubuntu PPAS $VER"
echo "$NYTT i $VER"
echo "$ENDRINGER i $VER"
echo "$TINGFJERNET fra $VER"
echo "$OS"
echo "Sist endret $SISTENDRET"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har en laptop?, legg til --laptop for å installere de anbefalt pakkene"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har et NVIDIA grafikkkort?, legg til --grafikkkort for å installere nyere nvidia-driver versjon"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har lyst til å spille på Windows PC-spill med wine og DXVK legg til --spill"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------"
echo "Legger til "$UTSEENDEPPAS""
echo "----------------------------------------------------"
sudo add-apt-repository $PAPIRUS --update -y
sudo add-apt-repository --update $PLATATHEME -y
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Sjekk ut disse URL-ene "$PLATATHEMEURL" for mer info om GTK"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Sjekk ut den URL-en "$PAPIRUSIKONTEMAURL" for mer info om ikon tema et"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
sleep 5
echo "----------------------------------------------------------------"
echo "Installere "$FONTS" som er anbefalt å bruke sammen med "$UTSEENDE""
echo "Installer "$UTSEENDE" "$PROGRAMTEMA" "$FONTER""
echo "---------------------------------------------------------------"
sudo apt install $UTSEENDE $FONTER -yqq
sleep 5
if dpkg --get-selections | grep -qw "$PROGRAMVARER"
    then
        echo "-----------------------------------------------------------------------"
        echo "Du har alt "$PROGRAMVARER" installert så "$PROGRAMTEMA" vil bli installert"
        echo "-----------------------------------------------------------------------"
        sudo apt install $PROGRAMTEMA -yyq
else
echo "---------------------------------------------------------------------------------------------"
echo -e "\e[1;31m Du har IKKE "$PROGRAMVARER" installert så "$PROGRAMTEMA" blir IKKE installert \e[0m"
echo "----------------------------------------------------------------------------------------------"
fi
}

syncthingppa(){
if dpkg --get-selections | grep -qw "syncthing"
then
echo "-----------------------------------------------------------------------"
echo "Du har alt installert syncthing"
echo "-----------------------------------------------------------------------"
else     
echo "---------------------------------------------------------------------------------------------"
echo "Installere syncthing sin stable ppa"    
echo "---------------------------------------------------------------------------------------------"
sudo apt install $SYNCTHINGDEB -yyq    
echo "---------------------------------------------------------------------------------------------" 
echo "Legger til lanserings PGP nøkkler"
echo "---------------------------------------------------------------------------------------------"    
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "---------------------------------------------------------------------------------------------" 
echo "Legger til syncthing stable kanal i APT kilden din"
echo "---------------------------------------------------------------------------------------------" 
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update -yyq 
sudo apt install syncthing syncthing-gtk -yyq
echo "---------------------------------------------------------------------------------------------" 
echo "syncthing stable er installert"
echo "---------------------------------------------------------------------------------------------" 
fi 
}

cryptomatorsetup(){
if dpkg --get-selections | grep -qw "cryptomator"
then
echo "-----------------------------------------------------------------------"
echo "Du har alt installert cryptomator"
echo "-----------------------------------------------------------------------"
else     
echo "---------------------------------------------------------------------------------------------"
echo "Installere cryptomator sin ppa"    
echo "---------------------------------------------------------------------------------------------"
sudo add-apt-repository $CRYPTOMATORPPA --update -y
sudo apt install cryptomator -yyq 
echo "---------------------------------------------------------------------------------------------" 
echo " cryptomator er installert"
echo "---------------------------------------------------------------------------------------------" 
fi 
}    

avslutter()  {
sudo apt autoremove -yyq     
echo "---------------------------------------------------------------------------------------------"
echo "FERDIG MED INSTALLASJOEN AV PPAS PÅ UBUNTU"
echo "---------------------------------------------------------------------------------------------"
exit
}

installer-ubuntu-ppaer
gnome3
syncthingppa
cryptomatorsetup
avslutter

