#!/bin/sh
# i3wm installsjons script for Debian/Ubuntu

# Variabler
VER="Versjon 1.8.4"
SISTENDRET="5.feb.2019"
OS="Testet sist på Ubuntu 17.04,17.10,18.04,18.10"
NYTT="Ingeting nytt" 
ENDRINGER="Oppdatert OOMOX sin deb fil"
TIPS="bruk --polybar for å installer polybar" 

# repo Pakkker  
TILLEGG="caffeine kdeconnect redshift redshift-gtk"
MEDIA="flameshot zathura tomboy"
UTSEENDE="lxappearance gtk-chtheme qt4-qtconfig qt5-style-plugins qt5ct"
I3BASIC="i3 dmenu pavucontrol git cmake zsh htop python3.6 arandr lxrandr compton compton-conf i3blocks feh i3lock"
I3GAPS="libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev libxcb-shape0-dev"
CAVADEP="libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool"
I3LOCKFANCY="scrot imagemagick i3lock i3lock-fancy"
GNOMEPAKKER="gnome-terminal gnome-font-viewer gnome-calendar"
OHMYZSHPAKKER="zsh curl powerline fonts-powerline"
WPGTKDEP="python-gobject xsltproc"

# For --polybar

POLYBARPAKKER="cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2"

# Maskinvare 


# DEB pakker 
OOMOX="https://github.com/themix-project/oomox/releases/download/1.11/oomox_1.11-3-gde075379_18.10+.deb"
OOMOXDEP="libgdk-pixbuf2.0-dev libxml2-utils parallel sassc optipng librsvg2-bin inkscape"
DEADBEEF="https://downloads.sourceforge.net/project/deadbeef/debian/deadbeef-static_0.7.2-2_amd64.deb?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fdeadbeef%2Ffiles%2Fdebian%2Fdeadbeef-static_0.7.2-2_amd64.deb%2Fdownload&ts=1540759299"

# Github linker til filer 
OHMYZSHINSTALL="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

# URL-er 
# IKKE i bruk som standard men er bare repo pakker 
OOMOXINFO="https://github.com/themix-project/oomox/releases"
DEADBEEFINFO="https://sourceforge.net/projects/deadbeef/"

# Info URL-er om forskjellige ting som last ned fra github

I3GAPSURL="https://github.com/Airblader/i3/wiki/Compiling-&-Installing"



# Mapper 
GIT="$HOME/git/"
FONTS="$HOME/.fonts/" 
Nedlastingermappe="$(xdg-user-dir DOWNLOAD)"
BILDEMAPPE="$(xdg-user-dir PICTURES)"

# Funskjoner $HOME/Dokumenter/ISO-filer

oppstart() {
cd "$HOME" || exit  >/dev/null
mkdir -p "git" 2>/dev/null
cd "$BILDEMAPPE" || exit  >/dev/null
mkdir -p "Wallpapers" 2>/dev/null
}  

i3wmoppstart()  {
echo "_------------------------------------------------"	
echo "INSTALLERE ALT DU TRENGER FOR I3WM PÅ UBUNTU $VER"
echo "$OS"
echo "Sist endret $SISTENDRET"
echo "Siste endinger $ENDRINGER"
echo "Hva som er nytt i $VER $NYTT"
echo "$TIPS"
echo "_------------------------------------------------"	
}  

fonts() {
	cd "$HOME" || exit 
echo "Ser etter $FONTS...."  >/dev/null
if [ ! -f "$FONTS" ];then 
	echo "file "  "$FONTS" "finnes." >/dev/null  echo "Fant $FONTS mappen...." && cd "$FONTS"  || exit
else mkdir -p "$HOME/.fonts/" 
  fi
} 



#bakgrunner-mappen() {
#	cd "$BILDEMAPPE" || exit 
#	echo "Ser ettter $Bakgrunner..." >/dev/null
#	if [ ! -f "$Bakgrunner" ]
#		then echo "file " "$Bakgrunner"  "finnes. "; echo "Fant $Bakgrunner mappen...." && cd "$Bakgrunner" || exit  
#	fi
#echo "----------------------------------------------------"
#echo "Hvor bakgrunner dine havner $Bakgrunner"
#echo "----------------------------------------------------"
#}  


github-mappen() {
	cd "$HOME" || exit 
	echo "Ser ettter git mappen..." >/dev/null
	if [ ! -f "$GIT" ]
		then  "file" "$GIT" "finnes. "; echo "Fant GIT mappen...." && cd "$GIT" || exit 
		else
		cd "$HOME" || exit
		echo "Lager en mappe for github mappene"
		mkdir -p "$GIT"
		exit 	
	fi
echo "----------------------------------------------------"
echo "Hvor Git filene havner $GIT"
echo "----------------------------------------------------"

}  


polybar() {
echo "-----------------------------------------------------------------------------------------------"
echo -e "\e[1;31m ADVARSEL HVIS DU HAR POLYBAR INSTALLERT FRA FØR BLIR CONFIG FILENE OVERSKREVET! \e[0m"
echo "-----------------------------------------------------------------------------------------------"
sudo apt-get update -yyq
echo "Installere pakker som trengs for polybar" && sudo apt-get install $POLYBARPAKKER -yyq 
echo "----------------------------------------"
echo "-----------------------------------------------------------------------------------------------"
echo "Setter opp polybar med build script fra github"
echo "-----------------------------------------------------------------------------------------------"
cd "$GIT" || exit 
git clone https://github.com/jaagr/polybar
mkdir -p "$GIT"polybar/build
echo "-----------------------------------------------------------------------------------------------"
echo "build.sh kommer til å ta sin tid men polybar blir satt opp automatisk nå"
echo "-----------------------------------------------------------------------------------------------"
cd "$GIT"polybar && ./build.sh -A 
cd "$GIT"polybar/build && make userconfig
echo "-------------------------"
echo "Lager config for polybar"
echo "------------------------"
sleep 5
echo "-------------------------"
echo "Startert polybar"
echo "------------------------"
/usr/local/bin/polybar example 
sleep 5
killall /usr/local/bin/polybar
echo "--------------------"
echo "FERDIG MED POLYBAR"
echo "--------------------"
exit
	}

if  [ "$1" == "--polybar" ];then
	github-mappen
	polybar
	exit
fi




pywalsetup () {
echo "---------------------------" 
sudo apt-get install python3-pip $WPGTKDEP -yyq
echo "Installere pywal og wpgtk" && sudo -H pip3 install wpgtk pywal --quiet
echo "--------------------------" 
if dpkg -l steam 
then
echo "------------------------------------------" 
echo "Installere pywal for steam med metro skin"
echo "------------------------------------------" 	
sudo -H pip3 install wal-steam  --quiet
else 
echo "--------------------------------------------------------------" 
echo "Du har ikke steam installert derfor installers ikke wal-steam"
echo "--------------------------------------------------------------"
fi  
}

oomox () {

# Installere OOMOX og sjekker om OOMOX er installert

echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Installere OOMOX for å theme gtk sammen med pywal"
echo "Sjekk $OOMOXINFO for mer infomasjon om lanseringer av oppdatering til OOMOX"
echo "---------------------------------------------------------------------------------------------------------------------------------------------------------------------"
if echo "Sjekker om oomox er installert" 2>/dev/null && dpkg --get-selections | grep -qw oomox >/dev/null
then
    echo "-----------------------------"
	echo "Du har alt installert oomox"
	echo "----------------------------"
else 
echo "-----------------------------"
echo "Laster ned og installere oomox"
echo "------------------------------"	
sudo apt-get install $OOMOXDEP -yyq
cd "/tmp/" || exit 
wget $OOMOX -O oomox.deb -P /tmp/ && sudo dpkg -i oomox.deb
sudo apt-get install -f  -yyq 
fi
}



avslutter () {
echo "-------------------------------------------------------------------------------------"
echo "Følgende pakker ble automatisk installert og er ikke lenger påkrevet" >/dev/null && sudo apt-get autoremove -yyq 
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
if ls -la $HOME/.fonts | grep -qw "Font-Awesome"
then 
echo "---------------------------------------------"
echo "Font-Awesome er alt installert $HOME/.fonts"
echo "---------------------------------------------"
else
echo "----------------------------------------------------------------------------------------"
echo "NB Font-Awesome lagres i $HOME/.fonts så fonten er ikke tilgjengelig for alle brukerne "
echo "----------------------------------------------------------------------------------------"
echo "-----------------------"
echo "-----------------------"
echo "Installere Font-Awesome"
echo "-----------------------"
mkdir -p $HOME/.fonts/Font-Awesome && cd $HOME/.fonts/Font-Awesome || exit
cd "$GIT" || exit 
git clone https://github.com/FortAwesome/Font-Awesome.git
cd "Font-Awesome/web-fonts-with-css/webfonts"  || exit 
cp "$file"*.ttf "$HOME/.fonts/Font-Awesome" 2>/dev/null
echo "----------------------"
echo "Font-Awesome er ferdig"
echo "----------------------"
echo "----------------------------------------------------------------------------------"
echo "Åpner med gnome-font-viewer for å sjekke at fontawesome fontene er installert"
gnome-font-viewer fa-brands-400.ttf  & sleep 5 && killall gnome-font-viewer ; 
gnome-font-viewer fa-regular-400.ttf & sleep 5 && killall gnome-font-viewer ;
gnome-font-viewer fa-solid-900.ttf & sleep 5 && killall gnome-font-viewer ;
echo "---------------------------------------------------------------------------------"
fi
}

cava  () {

# bygger cava og installer pakker som trengs

if ls -la $HOME/git | grep -qw "cava"
then 
echo "---------------------------------------------"
echo "cava er alt installert $HOME/git"
echo "---------------------------------------------"
else 	
echo "---------------"
echo "INSTALLER CAVA"
echo "---------------"
cd "$GIT" || exit 
sudo apt-get install -yyq $CAVADEP
git clone https://github.com/karlstav/cava.git 
mv cava /usr/local
cd cava || exit 
./autogen.sh
./configure
sudo make
sudo make install
echo "-----------------------"
echo "FERDIG MED CAVA"
echo "----------------------"
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
skjermer
bluetooth
fonts
github-mappen
zsh
i3-gaps
fontawsesome
cava
pywalsetup
oomox
ferdig
avslutter


# -----------------------------------------------------------------------------

# Ikke i bruk lenger siden 12.1.2019 siden det er en deb pakk nå

# -----------------------------------------------------------------------------

#I3LOCK="scrot imagemagick pkg-config libxcb1 libpam-dev libcairo-dev libxcb-composite0 libxcb-composite0-dev libxcb-xinerama0-dev libev-dev libx11-dev libx11-xcb-dev libxkbcommon0 libxkbcommon-x11-0 libxcb-dpms0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xkb-dev libxkbcommon-x11-dev libxkbcommon-dev"

#skjermer(){
#echo "--------------------------------------------------------------"
#echo "Sjekker om det er koblet til to skjermer"
#echo "--------------------------------------------------------------" 
#if 
#xrandr | grep " connected " | awk '{ print$1 }' | wc -l | grep 2 
#then
#echo "--------------------------------------------------------------------------"
#echo "Installere i3lock-fancy for flere skjermer med i3lock-fancy-multimonitor"
#echo "--------------------------------------------------------------------------"
#echo "Installere disse pakkene $I3LOCKFANCY" && sudo apt-get install $I3LOCKFANCY -yyq
#echo "--------------------------------------------------------------------------"
#cd "$GIT" || exit
#git clone https://github.com/guimeira/i3lock-fancy-multimonitor.git
#cp -r i3lock-fancy-multimonitor ~/.i3
#chmod +x ~/.i3/i3lock-fancy-multimonitor/lock
#else
#echo "--------------------------------------------------------------"
#echo -e "\e[1;31m Du har IKKE to skjermer koblet til nå \e[0m"
#echo "--------------------------------------------------------------" 
#fi
#} 

# -----------------------------------------------------------------------------

# Bruker debpakken fra 22 des 2018

#i3lock() {

# bygger i3lock-fancy & i3lock-color og installer pakker som trengs


#echo "-------------------------------------------------------------------------------"
#echo "Installere i3lock-fancy & i3lock-color"
#echo "------------------------------------------------------------------------------"
#cd "$GIT" || exit 
#sudo apt-get install -yyq $I3LOCK
#git clone https://github.com/chrjguill/i3lock-color.git
#git clone https://github.com/meskarune/i3lock-fancy.git
#cd "$GIT"/i3lock-fancy/ || exit 
#sudo mv lock /usr/local/bin  2>/dev/null
#sudo mv icons /usr/local/bin  2>/dev/null
#} 

# -----------------------------------------------------------------------------


# TILENGSPROGRAMMER TIL I3
#echo "nitrogen er en lett måtte å sett bakgrunner på fra gui-en. Vil du installere nitrogen" && sudo apt-get install nitrogen
#echo "variety er lett måtte og hente bilde fra nettet og sette bakgrunner. Vil du installere Variety" && sudo apt-get install variety


