#!/bin/sh
# i3wm installsjons script for Debian/Ubuntu

# TODO finne et alternativ til tomboy som funker med i3wm

# Variabler
VER="Versjon 1.8.7"
SISTENDRET="17.juli.2019"
OS="Testet sist på Zorin OS 15 "
NYTT="Lagt til GLava" 
ENDRINGER="Fikset små bugs" 
FJERNET="Ingenting fjernet"
TIPS="bruk --polybar for å installer polybar" 

# Ubuntu repo Pakkker  
TILLEGG="caffeine kdeconnect redshift redshift-gtk"
MEDIA="flameshot zathura"
UTSEENDE="lxappearance gtk-chtheme qt4-qtconfig qt5-style-plugins qt5ct" # Fra venstre er programvarer for å endre på GTK teamer og på høyre side er programvarer for QT teamer
I3BASIC="i3 dmenu pavucontrol git cmake  htop python3.6 arandr lxrandr compton compton-conf i3blocks feh i3lock"
I3GAPS="libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev libxcb-shape0-dev"
CAVADEP="libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool" 
GLAVADEP="libpulse0 libpulse-dev libxext6 libxext-dev libxrender-dev libxcomposite-dev meson gcc libgl1-mesa-dev"
I3LOCKFANCY="scrot imagemagick i3lock i3lock-fancy"

# Pakker som er ment for GNOME 3 som skrivebordsmiljø men som jeg bruker med i3wm

GNOMEPAKKER="gnome-terminal gnome-font-viewer gnome-calendar"


# Pakker som kreves til installasjon av forskjelige programvarer og scripts
OOMOXDEP="libgdk-pixbuf2.0-dev libxml2-utils parallel sassc optipng librsvg2-bin inkscape libsass1 python3-pystache"
OHMYZSHPAKKER="zsh curl powerline fonts-powerline"
WPGTKDEP="python-gobject xsltproc"

# For pakker som kreves for at funskjonen --polybar skal funke som den skal 

POLYBARPAKKER="cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2"
POLYBARVALGFRITT="libnl-genl-3-dev libcurl4-openssl-dev libmpdclient-dev libjsoncpp-dev libpulse-dev libasound2-dev	libxcb-cursor-dev libxcb-xrm-dev libxcb-xkb-dev"	

# Github linker til filer 
OHMYZSHINSTALL="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

# URL-er til forskjelige prosjekter sin lanserings side  
OOMOXINFO="https://github.com/themix-project/oomox/releases"
DEADBEEFINFO="https://sourceforge.net/projects/deadbeef/"

# URL-er til DEB pakker 
OOMOX="https://github.com/themix-project/oomox/releases/download/1.11/oomox_1.11-3-gde075379_18.10+.deb"
DEADBEEF="https://downloads.sourceforge.net/project/deadbeef/debian/deadbeef-static_0.7.2-2_amd64.deb?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fdeadbeef%2Ffiles%2Fdebian%2Fdeadbeef-static_0.7.2-2_amd64.deb%2Fdownload&ts=1540759299"


# Info URL-er om forskjellige ting som last ned fra github

I3GAPSURL="https://github.com/Airblader/i3/wiki/Compiling-&-Installing"
POLYBARURL="https://github.com/jaagr/polybar/wiki/Compiling"


# Mapper 
GIT="$HOME/git/"
FONTS="$HOME/.fonts/" 
Nedlastingermappe="$(xdg-user-dir DOWNLOAD)"
BILDEMAPPE="$(xdg-user-dir PICTURES)"

# Funskjoner $HOME/Dokumenter/ISO-filer

oppstart() {
mkdir -p "$GIT" 
cd "$BILDEMAPPE" || exit
mkdir -p "wallpapers" 2>/dev/null
}  

i3wmoppstart()  {
echo "_------------------------------------------------"	
echo "INSTALLERE ALT DU TRENGER FOR I3WM PÅ UBUNTU $VER"
echo "$OS"
echo "Sist endret $SISTENDRET"
echo "Siste endinger $ENDRINGER"
echo "Hva som er nytt i $VER $NYTT"
echo "$FJERNET fra $VER"
echo "$TIPS"
echo "-------------------------------------------------"	
}  

fonts() {
echo "-------------------------------------------------"	
echo "Sjekker om "$FONTS" mappen finnes eller ikke"	
echo "-------------------------------------------------"
if 
test -d ! "$FONTS"
then
echo "-------------------------------------------------"	
echo "Oppretter "$FONTS" mappen"	
echo "-------------------------------------------------"	
mkdir -p "$FONTS"	
else
echo "-------------------------------------------------"	
echo ""$FONTS" mappen finnes"	
echo "-------------------------------------------------"	
fi
} 




github-mappen() {
echo "-------------------------------------------------"	
echo "Sjekker om "$GIT" mappen finnes eller ikke"	
echo "-------------------------------------------------"
if 
test -d !  "$GIT"
then
echo "-------------------------------------------------"	
echo "Oppretter "$GIT" mappen"	
echo "-------------------------------------------------"	
mkdir -p "$GIT"
echo "----------------------------------------------------"
echo "Hvor Git filene havner "$GIT""
echo "----------------------------------------------------" 	
else	
echo "-------------------------------------------------"	
echo ""$GIT" mappen finnes"	
echo "-------------------------------------------------"	
fi
}  


polybar() {
echo "-----------------------------------------------------------------------------------------------"
echo -e "\e[1;31m ADVARSEL HVIS DU HAR POLYBAR INSTALLERT FRA FØR BLIR CONFIG FILENE OVERSKREVET! \e[0m"
echo "-----------------------------------------------------------------------------------------------"
sudo apt-get update -yyq
echo "Installere pakker som trengs for polybar" && sudo apt-get install $POLYBARPAKKER  -yyq 
echo "----------------------------------------"
echo "Installere valgfrie pakker for polybar" && sudo apt-get install $POLYBARVALGFRITT -yyq
echo "-----------------------------------------------------------------------------------------------"
echo "Setter opp polybar med build script fra github"
echo "-----------------------------------------------------------------------------------------------"
cd "$GIT" || exit 
git clone https://github.com/jaagr/polybar
mkdir -p "$GIT"polybar/build
echo "-----------------------------------------------------------------------------------------------"
echo "build.sh kommer til å ta sin tid men polybar blir satt opp automatisk nå"
echo "-----------------------------------------------------------------------------------------------"
cd "$GIT"polybar && ./build.sh 
cd "$GIT"polybar/build && make userconfig
echo "-------------------------"
echo "Lager config for polybar"
echo "------------------------"
echo "--------------------"
echo "FERDIG MED POLYBAR"
echo "-----------------------------------------------------------------------------------------------"
echo "For mer info sjekk ut "$POLYBARURL""
echo "-----------------------------------------------------------------------------------------------"
exit
}

if  [ "$1" == "--polybar" ];then
	github-mappen
	polybar
	avslutter
	exit
fi




pywalsetup () {
echo "---------------------------" 
echo "Installere pywal og wpgtk"  
echo "--------------------------"
sudo apt-get install python3-pip $WPGTKDEP -yyq && sudo -H pip3 install wpgtk pywal --quiet
echo "------------------------------------------" 
echo "Sjekker om steam er installert"
echo "------------------------------------------" 	 
if dpkg --get-selections steam 
then
echo "------------------------------------------" 
echo "Installere pywal for steam med metro skin"
echo "------------------------------------------" 	
sudo -H pip3 install wal-steam  --quiet
else 
echo "----------------------------------------------------------------------------------" 
echo "Du har ikke steam installert derfor installers ikke wal-steam fra python3-pip"
echo "----------------------------------------------------------------------------------"
fi  
}

oomox () {
# Installere OOMOX og sjekker om OOMOX er installert
echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Installere OOMOX for å theme gtk sammen med pywal"
echo "Sjekk "$OOMOXINFO" for mer infomasjon om lanseringer av oppdatering til OOMOX"
echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------------"
if echo "Sjekker om oomox er installert" 2>/dev/null && dpkg --get-selections | grep -qw oomox >/dev/null
then
    echo "-----------------------------"
	echo "Du har alt installert oomox"
	echo "----------------------------"
else 
echo "------------------------------"
echo "Laster ned og installere oomox"
echo "------------------------------"	
sudo apt-get install $OOMOXDEP -yyq
cd "/tmp/" || exit 
wget $OOMOX -O oomox.deb -P "/tmp/" 
sudo dpkg -i oomox.deb
sudo apt-get install -f  -yyq 
fi
}



avslutter () {
echo "-------------------------------------------------------------------------------------"
echo "Følgende pakker ble automatisk installert og er ikke lenger påkrevet" && sudo apt autoremove -yyq
echo  "FERDIG MED SCRIPET INSTALLSJONS SCRIPET"
echo "----------------------------------------"
exit
}

# Scriptet starter 
i3wm-script() {

# oppdatere alle pakkene fra repo

echo "----------------------------------------------------"
echo "Starter en full system oppdatering..."
echo "----------------------------------------------------"
sudo apt-get update -yyq
sudo apt-get full-upgrade -yyq
echo "----------------------------------------------------------------------------"
echo "INSTALLERE ALLE DU PAKKENE DU TRENGER FOR I3WM"
echo "-----------------------------------------------------------------------------"
sudo apt-get install $I3BASIC $I3LOCKFANCY  $UTSEENDE $TILLEGG $MEDIA $GNOMEPAKKER -yyq
} 



# Sjekker om deadbeef er installert eller ikke

programmer() {
if dpkg --get-selections | grep -qw "deadbeef"
then
echo "----------------------------------------------------" 
echo "deadbeef er alt installert"
echo "----------------------------------------------------"
else 
echo "----------------------------------------------------"
echo "Installere og laster ned deadbeef"
echo "----------------------------------------------------"	
cd $Nedlastingermappe || exit	
wget "$DEADBEEF" -O deadbeef.deb && sudo dpkg -i deadbeef.deb	
fi
} 

# Sjekker om du har bash som standard shell hvis du har bash som standard shell sett zsh som shell i stedet 

zsh(){
echo "-----------------------------------------------------------------------"
echo "Installere 'oh-my-zsh"
sudo apt-get install $OHMYZSHPAKKER -yyq
sh -c "$(curl -fsSL $OHMYZSHINSTALL)" 
echo "-----------------------------------------------------------------------"
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


i3-gaps() {

# bygger i3-gaps og installer pakker som trengs
echo "--------------------------------------------------------------"
echo "INSTALLERE I3-GAPS FØRST" && sudo apt-get install $I3GAPS -yyq
echo "--------------------------------------------------------------" 
cd "$GIT" || exit 
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps 
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make && sudo make install 
echo "--------------------"
echo "FERDIG MED I3-GAPS"
echo "----------------------------------------------------------------------------------------------------------------------------"
echo "NB: Hvis du har problemer med i3-gaps etter installsjons som prøv å slett i3-gaps mappen i "$GIT""
echo "---------------------------------------------------------------------------------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------------------------------"
echo "NB: Sjekke ut "$I3GAPSURL" for mer info om installasjon av i3-gaps"
echo "----------------------------------------------------------------------------------------------------------------------------"
sleep 5
}

# Last ned font-awesome og legger den i .fonts mappen 

# Sjekker om font-awesome fontene er installert med gnome-font-viewer

fontawsesome()  {
if test ! -d "$HOME/.fonts/Font-Awesome"
then
mkdir -p "$HOME/.fonts/Font-Awesome" 	
echo "-----------------------"
echo "Installere Font-Awesome"
echo "-----------------------"
cd "$HOME/.fonts/Font-Awesome" || exit
cd "$GIT" || exit 
git clone https://github.com/FortAwesome/Font-Awesome.git
cd "Font-Awesome/webfonts" || exit 
cp "$file"*.ttf "$HOME/.fonts/Font-Awesome" 2>/dev/null
echo "----------------------"
echo "Font-Awesome er ferdig"
echo "----------------------"
echo "----------------------------------------------------------------------------------"
echo "Åpner med gnome-font-viewer for å sjekke at fontawesome fontene er installert"
gnome-font-viewer fa-brands-400.ttf  & sleep 5 && killall gnome-font-viewer ; 
gnome-font-viewer fa-regular-400.ttf & sleep 5 && killall gnome-font-viewer ;
gnome-font-viewer fa-solid-900.ttf & sleep 5 && killall gnome-font-viewer ;
echo "-----------------------------------------------------------------------------------------------------------------------------------------"
echo "NB Font-Awesome lagres i $HOME/.fonts så fonten er ikke tilgjengelig for alle brukerne "
echo "-----------------------------------------------------------------------------------------------------------------------------------------"
else
test -d "$HOME/.fonts/Font-Awesome"  
echo "------------------------------------------------------------------------------------------"
echo "Font-Awesome er alt installert $HOME/.fonts"
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------------------------------"
echo "NB Font-Awesome lagres i $HOME/.fonts så fonten er ikke tilgjengelig for alle brukerne "
echo "-----------------------------------------------------------------------------------------------------------------------------------------"
fi
}

cava() {
# Bygger cava og installer pakker som trengs
if test ! -d "$HOME/git/cava"
then
cd "$GIT" || exit  	
echo "---------------"
echo "INSTALLER CAVA"
echo "---------------"
sudo apt-get install $CAVADEP -yyq
git clone https://github.com/karlstav/cava.git 
mv cava /usr/local
cd "cava" || exit 
echo "------------------------------------------------------------------------------------------"
echo "KJØRER SETUP SCRIPTENE FOR INSTALLASJON AV CAVA"
echo "------------------------------------------------------------------------------------------"
./autogen.sh
./configure
sudo make
sudo make install
echo "----------------------------------"
echo "FERDIG MED INSTALLASJON AV CAVA"
echo "----------------------------------"
else
test -d "$HOME/git/cava"	
echo "---------------------------------------------"
echo "cava er alt installert $HOME/git"
echo "---------------------------------------------" 	
fi
} 

galvasetup(){
# Bygger GLava og installer pakker som trengs
if test ! -d "$HOME/git/glava"
then
cd "$GIT" || exit  	
echo "-----------------------------------------"
echo "INSTALLER "$GLAVADEP" fra apt for GLava"
echo "------------------------------------------"
sudo apt-get install $GLAVADEP -yyq 
git clone https://github.com/wacossusca34/glava
cd "glava" || exit 
CFLAGS="-march=native" meson build
ninja -C build
cd build || exit
echo "----------------------------------"
echo "INSTALLER GLava med meson"
echo "----------------------------------"
sudo meson install
echo "----------------------------------"
echo "FERDIG MED INSTALLASJON AV GLava"
echo "----------------------------------"
else
test -d "$HOME/git/glava"	
echo "---------------------------------------------"
echo "GLava er alt installert $HOME/git"
echo "---------------------------------------------" 	
fi
} 	


ferdig () {
echo "-----------------------------------------------------------------------------------------------------------"
echo "DU KAN NÅ LEGG TIL CONFIG FILER I $HOME.config/i3 HUSK OG ENDRE FONT IKONER I $HOME.config/i3/config filen"
echo "------------------------------------------------------------------------------------------------------------"
}


oppstart
i3wmoppstart
i3wm-script
programmer
fonts
github-mappen
zsh
i3-gaps
fontawsesome
cava
galvasetup
pywalsetup
oomox
ferdig
avslutter
