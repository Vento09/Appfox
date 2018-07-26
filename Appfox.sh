#!/bin/bash

echo "Let's start!"

# Questions

cat Witn.txt

echo "Put the next number bellow"
read num

# Changing the archive What is the number 
echo "$num" > Witn.txt

echo "What is the name of the WebApp?"
read name

echo "What is the URL?"
read url

echo "Where is the icon? (or) What is the icon name?"
read icon

echo "Configuring the application"

# Creating the Firefox profile 

mkdir ~/.mozilla/firefox/appfox."$name"

echo "[Profile${num}]" >> ~/.mozilla/firefox/profiles.ini
echo "Name=$name" >> ~/.mozilla/firefox/profiles.ini
echo "IsRelative=1" >> ~/.mozilla/firefox/profiles.ini
echo "Path=appfox.$name" >> ~/.mozilla/firefox/profiles.ini

mkdir ~/.mozilla/firefox/appfox."$name"/chrome 
cp userChrome.css ~/.mozilla/firefox/appfox."$name"/chrome

# Creating the launcher 
cp Principal.desktop "$name".desktop

echo "Name=$name" >> "$name".desktop
echo "Exec=firefox -P "$name" $url" >> "$name".desktop
echo "Icon=$icon" >> "$name".desktop

mv "$name".desktop ~/.local/share/applications

echo "All done. Enjoy with it!"
