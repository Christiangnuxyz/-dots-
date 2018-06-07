#!/bin/bash
# i3wm installsjons script for Debian/Ubuntu

# Variabler
VER="Versjon 1.8.2"
SISTENDRET="21.mai.2018"
OS="Testet sist på Ubuntu 17.04,17.10, Ubuntu 18.04"
NYTT="Fikset flere bugs med oomox" 
TIPS="Legg til hvis du har flere enn en skjerm --flere-skjermer" 

# repo Pakkker  
TILLEGG="caffeine redshift redshift-gtk"
MEDIA="shutter tomboy"
UTSEENDE="lxappearance gtk-chtheme qt4-qtconfig qt5-style-plugins qt5ct"
I3BASIC="i3 dmenu pavucontrol git cmake gnome-terminal gnome-font-viewer zsh htop python3.6 arandr compton i3blocks feh i3lock"
I3GAPS="libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev"
POLYBAR="cario libxcb python2 xcb-proto xcb-util-image xcb-util-wm xcb-util-xrm xcb-util-cursor alsa-lib jsoncpp libmpdclient wireless_tools" 
CAVA="libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool"
I3LOCK="scrot imagemagick pkg-config libxcb1 libpam-dev libcairo-dev libxcb-composite0 libxcb-composite0-dev libxcb-xinerama0-dev libev-dev libx11-dev libx11-xcb-dev libxkbcommon0 libxkbcommon-x11-0 libxcb-dpms0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xkb-dev libxkbcommon-x11-dev libxkbcommon-dev"
I3LOCKFANCY="scrot imagemagick i3lock"

# DEB pakker 
OOMOX="https://github.com/actionless/oomox/releases/download/1.6.0/oomox_1.6.0.deb"

# URL-er 
OOMOXINFO="https://github.com/themix-project/oomox/releases"

# Mapper 
Bakgrunner="$HOME/Wallpapers/"
GIT="$HOME/git/"
FONTS="$HOME/.fonts/" 
Nedlastingermappe="$(xdg-user-dir DOWNLOAD)"
# Funskjoner 
oppstart() {
cd "$HOME" || exit  >/dev/null
mkdir "git" 2>/dev/null
cd "$HOME" || exit  >/dev/null
mkdir "Wallpapers" 2>/dev/null
}  

i3wmoppstart()  {
echo "INSTALLERE ALT DU TRENGER FOR I3WM PÅ UBUNTU $VER"
echo "$OS"
echo "Sist endret $SISTENDRET"
echo "Hva som er nytt i $VER $NYTT"
echo "$TIPS"
}  

fonts() {
	cd "$HOME" || exit 
echo "Ser etter $FONTS...."  >/dev/null
if [ ! -f "$FONTS" ];then 
	echo "file "  "$FONTS" "finnes." >/dev/null  echo "Fant $FONTS mappen...." && cd "$FONTS"  || exit
else mkdir "$HOME/.fonts/" 
  fi
} 



bakgrunner-mappen() {
	cd "$HOME" || exit 
	echo "Ser ettter $Bakgrunner..." >/dev/null
	if [ ! -f "$Bakgrunner" ]
		then echo "file " "$Bakgrunner"  "finnes. "; echo "Fant $Bakgrunner mappen...." && cd "$Bakgrunner" || exit  
	fi
echo "----------------------------------------------------"
echo "Hvor bakgrunner dine havner $Bakgrunner"
echo "----------------------------------------------------"
}  


github-mappen() {
	cd "$HOME" || exit 
	echo "Ser ettter git mappen..." >/dev/null
	if [ ! -f "$GIT" ]
		then  "file" "$GIT" "finnes. "; echo "Fant GIT mappen...." && cd "$GIT" || exit  
	fi
echo "----------------------------------------------------"
echo "Hvor Git filene havner $GIT"
echo "----------------------------------------------------"

}  


polybar () {
cd "$GIT" || exit 
echo "-----------------------------------------------------------------------------------------------"
echo -e "\e[1;31m ADVARSEL polybar funker ikke i Ubuntu 18.04 \e[0m"
echo -e "\e[1;31m ADVARSEL HVIS DU HAR POLBAR INSALLERT FRA FØR BLIR CONFIG FILENE OVERSKREVET! \e[0m"
echo "-----------------------------------------------------------------------------------------------"
echo "Installere polybar" && sudo apt-get install $POLYBAR -yyq 
git clone --branch 3.1.0 --recursive https://github.com/jaagr/polybar
mkdir polybar/build 
cd polybar/build
cmake ..
sudo make install  
make userconfig
echo "--------------------"
echo "FERDIG MED POLYBAR"
echo "--------------------"
	}

if  [ "$1" == "--polybar" ];then
	polybar
	exit
fi

flere-skjermer () {
echo "---------------------------------------------------------------------------------"	
echo "i3lock-fancy for flere skjermer i3lock-fancy-multimonitor"
echo "---------------------------------------------------------------------------------"
echo "Installere disse pakkene $I3LOCKFANCY" && sudo apt-get install $I3LOCKFANCY -yyq 
cd "$GIT" || exit 
git clone https://github.com/guimeira/i3lock-fancy-multimonitor.git
cp -r i3lock-fancy-multimonitor ~/.i3
chmod +x ~/.i3/i3lock-fancy-multimonitor/lock
}

if  [ "$1" == "--flere-skjermer" ];then
	flere-skjermer
	exit
fi

pywalsetup () {
echo "--------------------" 
sudo apt-get install python3-pip -yyq
echo "Installere pywal" && sudo -H pip3 install "pywal" --quiet
echo "--------------------" 
}

oomox () {
echo "---------------------------------------------------------------------------------"
echo "Installere OOMOX for å theme gtk sammen med pywal"
echo "Sjekk $OOMOXINFO for mer infomasjon om lanseringer av oppdatering til OOMOX"
echo "------------------------------------------------------------------------------------"
if echo "Sjekker om oomox er installert" >/dev/null && dpkg --get-selections | grep -qw oomox >/dev/null
then
    echo "-----------------------------"
	echo "Du har alt installert oomox"
	echo "----------------------------"
else 
echo "-----------------------------"
echo "Laster ned og installere oomox"
echo "------------------------------"	
wget $OOMOX -O oomox.deb && sudo dpkg -i oomox.deb
cd  "/"  || exit && sudo rm oomox.deb -r 
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
echo "----------------------------------------------------"
echo "Starter en full system oppdatering..."
echo "----------------------------------------------------"
sudo apt-get update -yyq
sudo apt-get full-upgrade -yyq
echo "----------------------------------------------------------------------------"
echo "INSTALLERE ALLE DU PAKKENE DU TRENGER FOR I3WM"
echo "-----------------------------------------------------------------------------"
sudo apt-get install $I3BASIC $UTSEENDE $TILLEGG $MEDIA -yyq
if echo "$0" | grep "bash" 
then
echo "Setter zsh som standard shll" && chsh -s $(which zsh)
else
echo "$0" | grep "zsh" 
echo "---------------------------------"
echo "zsh er alt satt som standard shell"
echo "----------------------------------"
fi
}

i3-gaps() {
echo "--------------------------------------------------------------"
 echo "INSTALLERE I3-GAPS FØRST" && sudo apt-get install $I3GAPS -yyq 
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
echo "--------------------"
}


fontawsesome()  {
echo "-----------------------"
echo "Installere Font-Awesome"
echo "-----------------------"
cd "$GIT" || exit 
git clone https://github.com/FortAwesome/Font-Awesome.git
cd "Font-Awesome/web-fonts-with-css/webfonts"  || exit 
cp "$file"*.ttf "$HOME/.fonts" 2>/dev/null
echo "----------------------"
echo "Font-Awesome er ferdig"
echo "----------------------"
echo "----------------------------------------------------------------------------------"
echo "Åpner med gnome-font-viewer for å sjekke at fontawesome fontene er installert"
gnome-font-viewer fa-brands-400.ttf  & sleep 5 && killall gnome-font-viewer ; 
gnome-font-viewer fa-regular-400.ttf & sleep 5 && killall gnome-font-viewer ;
gnome-font-viewer fa-solid-900.ttf & sleep 5 && killall gnome-font-viewer ;
echo "---------------------------------------------------------------------------------"
}

cava  () {
echo "INSTALLER CAVA"
cd "$GIT" || exit 
sudo apt-get install -yyq $CAVA
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
} 
i3lock() {
echo "-------------------------------------------------------------------------------"
echo "installere i3lock-fancy & i3lock-color"
echo "------------------------------------------------------------------------------"
cd "$GIT" || exit 
sudo apt-get install -yyq $I3LOCK
git clone https://github.com/chrjguill/i3lock-color.git
git clone https://github.com/meskarune/i3lock-fancy.git
cd "$GIT"/i3lock-fancy/ || exit 
sudo mv lock /usr/local/bin  >/dev/null
sudo mv icons /usr/local/bin  >/dev/null
} 

ferdig () {
echo "-----------------------------------------------------------------------------------------------------------"
echo "DU KAN NÅ LEGG TIL CONFIG FILER I $HOME.config/i3 HUSK OG ENDRE FONT IKONER I $HOME.config/i3/config filen"
echo "------------------------------------------------------------------------------------------------------------"
}

oppstart
i3wmoppstart
i3wm-script
fonts
github-mappen
i3-gaps
fontawsesome
cava
i3lock
pywalsetup
oomox
bakgrunner-mappen
ferdig
avslutter





# TILENGSPROGRAMMER TIL I3
#echo "nitrogen er en lett måtte å sett bakgrunner på fra gui-en. Vil du installere nitrogen" && sudo apt-get install nitrogen
#echo "variety er lett måtte og hente bilde fra nettet og sette bakgrunner. Vil du installere Variety" && sudo apt-get install variety
