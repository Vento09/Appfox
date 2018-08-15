#!/bin/bash

echo "Let's start!"

# Questions

echo "What is the name of the WebApp?"
read name

echo "What is the URL?"
read url

echo "Where is the icon? (or) What is the icon name?"
read icon

echo "Configuring the application"

# Changing the archive "Witn.txt" for the profile number 
export declare nume=$(cat Witn.txt)
let "nume += 1"
echo "$nume" > Witn.txt

# Random name for the folders based on seconds
second=$(date +%s) 

# Creating the Firefox profile 

mkdir ~/.mozilla/firefox/appfox.$second

echo "[Profile${nume}]" >> ~/.mozilla/firefox/profiles.ini
echo "Name=$second" >> ~/.mozilla/firefox/profiles.ini
echo "IsRelative=1" >> ~/.mozilla/firefox/profiles.ini
echo "Path=appfox.$second" >> ~/.mozilla/firefox/profiles.ini

mkdir ~/.mozilla/firefox/appfox.$second/chrome 
cp userChrome.css ~/.mozilla/firefox/appfox.$second/chrome

# Creating the launcher 
cp Principal.desktop "$name".desktop

echo "Name=$name" >> "$name".desktop
echo "Exec=firefox -P $second $url" >> "$name".desktop
echo "Icon=$icon" >> "$name".desktop

mv "$name".desktop ~/.local/share/applications

# Restoring passwords and logins saved
ln -s -t ~/.mozilla/firefox/appfox.$second/ ~/.mozilla/firefox/*.default/key4.db 
ln -s -t ~/.mozilla/firefox/appfox.$second/ ~/.mozilla/firefox/*.default/logins.json 
cp ~/.mozilla/firefox/*.default/cert9.db ~/.mozilla/firefox/appfox.$second
cp prefs.js ~/.mozilla/firefox/appfox.$second

notify-send "$name was create" 'Go to the menu for try it!' --icon=$icon

echo "All done. Enjoy with it!"
