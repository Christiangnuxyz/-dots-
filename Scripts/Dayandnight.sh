#!/bin/sh

# macOS like bakground script

# Variabler 



# Version 2.2
SISTENDRET="23:13"

# Folders 

MOJAVEBACKGROUNDFOLDER="$(xdg-user-dir PICTURES)"/"wallpapers/mojave-background" 
GNOMEXML="$(xdg-user-dir PICTURES)"/"GNOME-XML-background"

# Folders to remove 
REMOVEFOLDER="__MACOSX"

# URLs

MOJAVEBACKGROUNDFOLDERURL="https://files.rb.gd/mojave_dynamic.zip" 
GNOMEMOJAVEXMLURL="https://gist.githubusercontent.com/trongthanh/7d632e90687e1bc219e1f3262d337702/raw/8659a5432ad1ace0de3c8062435400db8a68f1cf/mojave.xml"

# Files

FILEXML="mojave.xml"
FILEZIP="mojave_dynamic.zip"

# Name with sed
OLDNAME="thanh"
OLDFOLDER="Pictures"
NEWPICTURE="Bilder"

# Folders for sed

SEDMOJAVEBACKGROUNDFOLDER="$HOME"/"$NEWPICTURE"/"wallpapers"/"mojave-background"
SEDGNOMEXML="$HOME/"$NEWPICTURE"/GNOME-XML-background/"$FILEXML""

# GNOME 3 gsettings for background pictures

URI="file://"$GNOMEXML"/"$FILEXML""


setup() {
if test ! -d "$MOJAVEBACKGROUNDFOLDER" 
then
echo "----------------------------------------------------------"	
echo "Setting up mojave-background day and night script"
echo "----------------------------------------------------------" 
mkdir -p "$MOJAVEBACKGROUNDFOLDER" && cd "$MOJAVEBACKGROUNDFOLDER" || exit
echo "--------------------------------------------------------------------"	
echo "Downloading "$FILEZIP" from "$MOJAVEBACKGROUNDFOLDERURL""
echo "------------------------------------------------------------------------------"   
wget -O "$FILEZIP" "$MOJAVEBACKGROUNDFOLDERURL" -P "$MOJAVEBACKGROUNDFOLDER" 
echo "-----------------------------------------------------------------------------"	
echo "Unpacking "$FILEZIP" file here "$MOJAVEBACKGROUNDFOLDER"" 
echo "----------------------------------------------------------------" 	
unzip "$MOJAVEBACKGROUNDFOLDER"/"$FILEZIP" && sleep 2
echo "---------------------------------------------------------------"	
echo "Removed __MACOSX from "$MOJAVEBACKGROUNDFOLDER""
echo "----------------------------------------------------------------" 	
rm "$MOJAVEBACKGROUNDFOLDER/$REMOVEFOLDER" -r 
else
echo "----------------------------------------------------------------"	
echo "Everything is set up for mojave-background day and night script"
echo "----------------------------------------------------------------" 
fi
}

setupgnome() {
if test ! -d "$GNOMEXML"
then
mkdir -p "$GNOMEXML"
echo "----------------------------------------------------------------"	
echo "Downloading "$FILEXML" from "$GNOMEMOJAVEXMLURL""
echo "----------------------------------------------------------------" 
wget "$GNOMEMOJAVEXMLURL" -P "$GNOMEXML" && sleep 5 && sed -i 's/'$OLDNAME'/'$USER'/g' ""$SEDGNOMEXML"" && sed -i 's/'$OLDFOLDER'/'$NEWPICTURE'/g' ""$SEDGNOMEXML""
echo "-----------------------------------------------------------------------------------------------------------------"	
echo "Changed name from "$OLDNAME" to "$USER" and changed folder name from "$OLDFOLDER" to "$NEWPICTURE""
echo "------------------------------------------------------------------------------------------------------------------" 
else 
echo "----------------------------------------------------------------"	
echo "Everything is set up for "$FILEXML""
echo "----------------------------------------------------------------" 	
fi
}

setupbakground() {
if test -e "$FILEXML"
then
echo "----------------------------------------------------------------"	
echo " Sets "$FILEXML" as wallpaper and lockscreen for GNOME 3"
echo "----------------------------------------------------------------"	
echo ${URI}
gsettings set org.gnome.desktop.background picture-uri "${URI}" && gsettings set org.gnome.desktop.screensaver picture-uri "${URI}"	
echo "Now this is your "${URI}" wallpaper and your lockscreen"
exit
else
echo "-------------------------------------------------------------------------------------------------"	
echo "This is your "${URI}" wallpaper and your lockscreen"
echo "-------------------------------------------------------------------------------------------------"
gsettings set org.gnome.desktop.background picture-uri "${URI}" && gsettings set org.gnome.desktop.screensaver picture-uri "${URI}"		
echo "-------------------------------------------------------------------------------------------------"	
echo "Everything is set up for "$FILEXML""
echo "--------------------------------------------------------------------------------------------------" 
fi
}	

setup
setupgnome
setupbakground


remove() {
if test ! -d "$GNOMEXML"
then	
echo "-------------------------------------------------------------------------------------------------"	
echo "Remove all the folders that was installed"
echo "-------------------------------------------------------------------------------------------------"	
rm "$MOJAVEBACKGROUNDFOLDER/" -r && rm "$GNOMEXML/" -r
else 
echo "-------------------------------------------------------------------------------------------------"	
echo "Not installed"
echo "-------------------------------------------------------------------------------------------------"	
fi 	
}

if  [ "$1" == "--delete" ];then
remove	
exit
fi

#wget "$GNOMEMOJAVEXMLURL" -P "$SEDGNOMEXML" && sed -i -e 's/'$OLDNAME'/'$USER'/g' "$SEDGNOMEXML"/"$FILEXML" && sed -i  's/'$OLDFOLDERNAME'/'$NEWPICTUREFOLDER'/g' "$SEDGNOMEXML"/"$FILEXML"
