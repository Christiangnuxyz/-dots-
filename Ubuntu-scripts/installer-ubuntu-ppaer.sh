#!/bin/bash
# Legger til Ubuntu PPAS

# Variabler:
SISTENDRET="28.mai.2018"
NYTT="Lagt til rød tekst og sjekker om filezilla er installert før den installer filezilla-theme-papirus"
VER="Versjon 1.0.6"
OS="Testet på Ubuntu 18.04"

# Laptop ppa-er og pakker

LAPTOP="ppa:linrunner/tlp"
TLP="tlp tlp-rdw"

# Grafikkort ppa
NVIDIA="ppa:graphics-drivers/ppa"


# GNOME ppa og pakker 
LOLLYPOP="ppa:gnumdk/lollypop"
GNOMEPROGRAMVARER="lollypop"


# TEMA ppa og Pakker 

PAPIRUS="ppa:papirus/papirus"
ADAPTA="ppa:tista/adapta"
UTSEENDEPPAS="ppa:papirus/papirus ppa:tista/adapta"
UTSEENDE="papirus-icon-theme adapta-gtk-theme papirus-folders"
PROGRAMTEMA="filezilla-theme-papirus"
PROGRAMVARER="filezilla"
FONTS="Roboto og Noto-Sans"

# Ubuntu 18.04 
COMMUNITHEMEPPA="ppa:communitheme/ppa"
COMMUNITHEMEPAKKE="ubuntu-communitheme-session"
UBUNTUTHEMEPAKKER="gnome-tweak-tool suru-icon-theme"

# Spill ppa 
PCSX2="ppa:gregory-hainaut/pcsx2.official.ppa"

# Pakker fra Ubuntu repo
FONTER="fonts-roboto fonts-noto fonts-noto-color-emoji"
GAMLELAPTOPPAKKER="laptop-mode-tools tlp tlp-rdw"
GNOME="gnome-tweak-tool gsettings-desktop-schemas"
# GNOME Gsettings 
GTK="Adapta-Nokto"
IKON="Papirus-Adapta-Nokto"
ADPTAFONT="Roboto"

# URL-er 
PCSX2INFO="https://launchpad.net/~gregory-hainaut/+archive/ubuntu/pcsx2.official.ppa/+packages"


# Funksjoner
installer-ubuntu-ppaer-hjelp() {

cat << _EOF_


 Kommandoer:

Legger til ppa-er til Ubuntu og Ubuntu baserte distroer som Linux Mint osv
Legger til ppa-er som Christian bruker på sine Ubuntu maskinere 

    Kjøring av "installer-ubuntu-ppaer"  Installer ppa-er for Ubuntu.

    Med å legg til "--laptop" valget installere du disse pakkene "$TLP" og legger til ppa-en "$LAPTOP"
    Med å legg til "--grafikkkort" Får du muligheten til å velge om du vil ha en nyere nvida driver installert eller ikke. Den legger da til denne ppa-en "$NVIDIA"
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
    Med å legg til "--grafikkkort" Får du muligheten til å velge om du vil ha en nyere nvida driver installert eller ikke. Den legger da til denne ppa-en $NVIDIA
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
    echo "---------------------------------------------------------------------------------------------"
    echo "Installer pakker som er anbefalt for nyere i repo for Bærbar PC/Laptop som for eksemple batteri"
    echo "---------------------------------------------------------------------------------------------"
    }
    batteri()  {
    echo "---------------------------------"
    echo "Sjekker om laptop-en har batteri"
    echo "---------------------------------"
    if upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"
        then echo "Legger til $LAPTOP" && sudo add-apt-repository $LAPTOP -y ; sudo apt-get update && sudo apt-get install $TLP  -yyq 
        echo "---------------------------------------------------------"
        echo "Ferdig med å installere disse pakkene $TLP"
        echo "---------------------------------------------------------"
    else 
    echo "-------------------------------------"
    echo -e "\e[1;31m  Du har IKKÈ batteri på datamaskinen \e[0m" && sudo apt-get purge $GAMLELAPTOPPAKKER $TLP -yyq  >/dev/null 
    echo "-------------------------------------"
    exit 
    fi

}
if  [ "$1" == "--laptop" ];then
laptop
batteri
exit
fi

gnome3 () {
echo "---------------------------------------------------"
echo "Sjekker Skrivebordsmiljø ditt"
echo "---------------------------------------------------"
if echo "$XDG_CURRENT_DESKTOP" | grep "GNOME" 
	then
	echo "----------------------------------------------------"
    echo "Legger til disse pakkene $GNOMEPROGRAMVARER $GNOME for GNOME"
    echo "----------------------------------------------------"
    sudo add-apt-repository $LOLLYPOP -y 
    sudo apt-get update -yyq  >/dev/null
    sudo apt-get install $GNOMEPROGRAMVARER $GNOME -yyq
    echo "---------------------------------------------------------------------------------------------------------------------"
    echo "Setter $UTSEENDE som ikon tema og GTK+ tema det kan endres tilbake med gnome-tweaks eller dconf vis du er hardcore" 
    echo "---------------------------------------------------------------------------------------------------------------------"
    gsettings set org.gnome.desktop.interface gtk-theme $GTK
    gsettings set org.gnome.desktop.interface icon-theme $IKON
    gsettings set org.gnome.desktop.wm.preferences theme $GTK
    gsettings set org.gnome.shell.extensions.user-theme name $GTK
    gsettings set org.gnome.desktop.interface font-name $ADPTAFONT 

else
    echo "---------------------------------------------------------"
    echo "Skrivebordsmiljø ditt er IKKE GNOME"
    echo "---------------------------------------------------------"
fi
}



bionicbeaver-setup() { 
echo "-------------------------------------"
echo "Sjekker om dette er Ubuntu 18.04"
echo "-------------------------------------"
if lsb_release -d | grep  -q -ic --color "Ubuntu 18.04 LTS"
    then  
    echo "----------------------------------------------"
    echo "Legger til $COMMUNITHEMEPPA  for Ubuntu 18.04"     
    echo "----------------------------------------------"
    sudo add-apt-repository $COMMUNITHEMEPPA -y
    sudo apt-get update -yyq  >/dev/null
    echo "-------------------------------------------------------"
    echo "Installer $COMMUNITHEMEPAKKE $UBUNTUTHEMEPAKKER" 
    echo "-------------------------------------------------------"
    sudo apt-get install $COMMUNITHEMEPAKKE $UBUNTUTHEMEPAKKER -yyq
else 
 echo "---------------------------------------"
echo -e "\e[1;31m  Du bruker IKKE Ubuntu 18.04 \e[0m"
 echo "---------------------------------------"
fi
} 

bionicbeaver() { 
echo "-------------------------------------"
echo "Sjekker om dette er Ubuntu 18.04"
echo "-------------------------------------"
if lsb_release -d | grep  -q -ic --color "Ubuntu 18.04 LTS"
    then  
    echo "----------------------------------------------------------"
    echo "Lager en mørk versjon av communitheme for Ubuntu 18.04"     
    echo "-----------------------------------------------------------"
    cd /usr/share/themes/ || exit 
    sudo cp -R Communitheme CommunithemeDark ; cd /usr/share/themes/CommunithemeDark/  || exit
    cd /usr/share/themes/CommunithemeDark/gtk-3.0/  || exit
    sudo mv gtk.css gtk-light.css
    sudo cp -r gtk-dark.css gtk.css 
    echo "------------------------------------------------------------------------"
    echo "Ferdig med å lage en mørk versjon av communitheme for Ubuntu 18.04"     
    echo "-----------------------------------------------------------------------"
    else 
 echo "----------------------------------------"
echo -e "\e[1;31m  Du bruker IKKE Ubuntu 18.04 \e[0m"
 echo "----------------------------------------"
fi 
} 

grafikkkort() {
echo "---------------------------------------------"
echo "Sjekker om du har et NVIDIA grafikkkort" 
echo "---------------------------------------------"
if  lspci | grep -ic --color "NVIDIA" >/dev/null
then
 echo "------------------------------------------------------"
 echo "Du har et NVDIA grafikkkort installere nvidia-settings" && sudo apt-get install nvidia-settings -yyq >/dev/null 
 echo "------------------------------------------------------"
else 
 echo "----------------------------------..........."
 echo -e "\e[1;31m  Du har IKKE et NVDIA grafikkkort \e[0m" && sudo apt-get purge nvidia-settings -yyq
 echo "---------------------------------------------"
 exit 
fi
}

 

nvdia-ppa() {
while true;  do
read -r -p "Vil du legg til $NVIDIA for å få nyere graikk driver oppdateringer fra NVIDIA ADVARSEL KAN VÆRE VELDIG USTABLI!!! (j/n)?" valgnvdia
case "$valgnvdia" in 
  [Jj]* ) echo "Legger til denne ppa $NVIDIA"; sudo add-apt-repository $NVIDIA -y ; software-properties-gtk --open-tab=4
    exit ;; 

  [Nn]* ) echo "Nei"; exit;; 
  * ) echo "Ikke et svar";;
esac
done 
}

 
if  [ "$1" == "--grafikkort" ];then
grafikkkort
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
sudo apt-get install lutris wine-stable -yyq


pcsx2setup()  {
 echo "------------------------------------------------"
 echo  "Sjekker om PCSX2 er støttet "
 echo "------------------------------------------------"    
if lsb_release -c | grep -q -ic --color "Zesty"
then 
echo "----------------------------------------------------------------"
echo "Legger til $PCSX2 pcsx2 sin ppa" 
echo "------------------------------------------------------------------"
sudo add-apt-repository $PCSX2 -y
sudo apt-get update && sudo apt-get install pcsx2
else 
 echo "----------------------------------------------------------------------------------------------------------------------------"
echo -e "\e[1;31m PCSX2 er ikke støtte i den versjon av Ubuntu 18.04 \e[0m"
 echo  "Sjekk her om PCSX2 har blitt oppdatert $PCSX2INFO"
 echo "---------------------------------------------------------------------------------------------------------------------------"
fi
  } 
} 

  
if  [ "$1" == "--spill" ];then
    spill
    pcsx2setup
    exit 
fi 

# Scripet starter 
installer-ubuntu-ppaer() {
echo "----------------------------------------------------"
echo "SCRITPET MÅ BLI KJØRT MED SUDO RETTIGHETER!!!"
echo "-------------------------------------------------------"
echo "Installer programmet som lar deg legg til ppas i Ubuntu"
echo "-------------------------------------------------------"
dpkg -l | grep -qw "software-properties-common" && sudo apt-get install software-properties-common -yyq
echo "-------------------------------------------------------"
echo "Legger til Ubuntu PPAS $VER"
echo "$NYTT i $VER"
echo "$OS"
echo "Sist endret $SISTENDRET"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har en laptop?, legg til --laptop for å installere de anbefalt pakkene"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har et nvida grafikkkort?, legg til --grafikkkort for å installere nyere nvida driver versjon"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------------------------"
echo "Har du har lyst til å spille windows spill?, legg til --spill for å installere Lutris"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------"
echo "Legger til $UTSEENDEPPAS"
echo "----------------------------------------------------"
sudo add-apt-repository $ADAPTA -y && sudo add-apt-repository $PAPIRUS -y 
echo "----------------------------------------------------"
echo "Starter oppdatering for å kun installere ppa-ene..."
echo "----------------------------------------------------"
sudo apt-get update -yyq
echo "----------------------------------------------------------------"
echo "Installere $FONTS som er anbefalt å bruke sammen med $UTSEENDE"
echo "Installer $UTSEENDE $PROGRAMTEMA $FONTER"
echo "---------------------------------------------------------------"
sudo apt-get install $UTSEENDE $FONTER -yqq
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

avslutter ()  {
echo "---------------------------------------------------------------------------------------------"
echo "Følgende pakker ble automatisk installert og er ikke lenger påkrevet" >/dev/null && sudo apt-get autoremove -yyq >/dev/null
echo "FERDIG MED INSTALLASJOEN AV PPAS PÅ UBUNTU"
echo "---------------------------------------------------------------------------------------------"
exit 
}

installer-ubuntu-ppaer
bionicbeaver-setup
bionicbeaver
gnome3
avslutter

