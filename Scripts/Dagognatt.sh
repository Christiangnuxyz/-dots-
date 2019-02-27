#!/bin/sh

# macOS likende bakgrunn script

# Variabler 

# Mapper 

# Version 1.0

MOJAVEBAKGRUNN="$HOME/Bilder/wallpapers/mojave-background" 
GNOMEXML="$HOME/Bilder/GNOME-XML-Backgrunner"

# URL-er 

MOJAVEBAKGRUNNURL="https://files.rb.gd/mojave_dynamic.zip" 
GNOMEMOJAVEXML="https://gist.githubusercontent.com/trongthanh/7d632e90687e1bc219e1f3262d337702/raw/8659a5432ad1ace0de3c8062435400db8a68f1cf/mojave.xml"

# Filer

FILEXML="mojave.xml"

# Navn for sed
OLDNAME="thanh"
OLDFOLDERNAME="Pictures"
NEWFOLDERNAME="$(echo "$(xdg-user-dir PICTURES)" | cut -c 17-22)"

setup() {
if test ! -d "$MOJAVEBAKGRUNN" 
then
echo "----------------------------------------------------------"	
echo "Setter opp macOS mojave bakgrunene for Dag og natt script"
echo "----------------------------------------------------------" 	
mkdir -p "$MOJAVEBAKGRUNN" && cd "$MOJAVEBAKGRUNN" || exit && wget -O mojave_dynamic.zip  "$MOJAVEBAKGRUNNURL" -P "$MOJAVEBAKGRUNN" 
echo "---------------------------------------------------------------"	
echo "Pakker ut zip filen her "$MOJAVEBAKGRUNN"" 
echo "----------------------------------------------------------------" 	
unzip "$MOJAVEBAKGRUNN"/mojave_dynamic.zip && sleep 2
echo "---------------------------------------------------------------"	
echo "Fjerner __MACOSX fra "$MOJAVEBAKGRUNN""
echo "----------------------------------------------------------------" 	
rm "$MOJAVEBAKGRUNN"/__MACOSX -r 
else
echo "----------------------------------------------------------------"	
echo "macOS mojave bakgrunene for Dag og natt script er alt satt opp"
echo "----------------------------------------------------------------" 
fi
}

setupgnome() {
if test ! -d "$GNOMEXML"
then
mkdir -p "$GNOMEXML"
echo "----------------------------------------------------------------"	
echo "Laster ned "$FILEXML" fra "$GNOMEMOJAVEXML""
echo "----------------------------------------------------------------" 
wget "$GNOMEMOJAVEXML" -P "$GNOMEXML" && sed -i -e 's/'$OLDNAME'/'$USER'/g' "$GNOMEXML"/"$FILEXML" && sed -i -e 's/'$OLDFOLDERNAME'/'$NEWFOLDERNAME'/g' "$GNOMEXML"/"$FILEXML"
echo "--------------------------------------------------------------------------------------------------------"	
echo "Endret navn fra "$OLDNAME" til "$USER" og Endret mappe navn fra "$OLDFOLDERNAME" til "$NEWFOLDERNAME""
echo "--------------------------------------------------------------------------------------------------------" 
else 
echo "----------------------------------------------------------------"	
echo ""$FILEXML" er alt satt opp"
echo "----------------------------------------------------------------" 	
fi
}

setupbakground() {
if test -e "$FILEXML"
then
echo "----------------------------------------------------------------"	
echo "Setter "$FILEXML" som GNOME 3 bakgrunn"
echo "----------------------------------------------------------------"	
gsettings set org.gnome.desktop.background picture-uri "file:"$GNOMEXML""/"$FILEXML" && gsettings set org.gnome.desktop.screensaver picture-uri "file:"$GNOMEXML""/"$FILEXML"	
else
touch "$GNOMEXML"/"$FILEXML" 
echo "----------------------------------------------------------------"	
echo "Bruker touch for å oppdater "$FILEXML" som GNOME 3 bakgrunn"
echo "----------------------------------------------------------------"		
fi
}	

setup
setupgnome
setupbakground



