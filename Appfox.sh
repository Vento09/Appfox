#!/bin/bash

clear

echo "Let's start!"

# Questions

echo "What is the name of the WebApp?"
read -e name

echo "What is the URL?"
read -e url

echo "Where is the icon? (or) What is the icon name?"
read -e icon

# Scanning if the application folder exists

if [ -d ~/.local/share/applications/ ];
then
echo "Configuring the application"

else
echo "Creating the applications folder"
mkdir ~/.local/share/applications/
fi

# Scanning if the database folder exists

if [ -d ~/.local/share/appfox ];
then
echo "Configuring the database"

else
mkdir ~/.local/share/appfox/
echo "0" >> ProfileNumber.txt
mv ProfileNumber.txt ~/.local/share/appfox/
fi

# Changing the archive "ProfileNumber.txt" for the profile number

export declare nume=$(cat ~/.local/share/appfox/ProfileNumber.txt)
let "nume += 1"
echo "$nume" > ~/.local/share/appfox/ProfileNumber.txt

# Creating the Firefox profile 

mkdir ~/.mozilla/firefox/appfox.$nume

echo "[Profile${nume}]" >> ~/.mozilla/firefox/profiles.ini
echo "# $name" >> ~/.mozilla/firefox/profiles.ini
echo "Name=appfox.$nume" >> ~/.mozilla/firefox/profiles.ini
echo "IsRelative=1" >> ~/.mozilla/firefox/profiles.ini
echo "Path=appfox.$nume" >> ~/.mozilla/firefox/profiles.ini

mkdir ~/.mozilla/firefox/appfox.$nume/chrome 

# Creating the launcher 
touch "$name".desktop

echo "[Desktop Entry]" >> "$name".desktop
echo "Name=$name" >> "$name".desktop
echo "Exec=firefox -P appfox.$nume $url" >> "$name".desktop
echo "Icon=$icon" >> "$name".desktop
echo "Type=Application" >> "$name".desktop
echo "Categories=Network;WebBrowser;" >> "$name".desktop

mv "$name".desktop ~/.local/share/applications/

# Creating the user.js
touch user.js

echo "user_pref(\"app.normandy.first_run\", false);" >> user.js
echo "user_pref(\"browser.cache.disk.smart_size.first_run\", false);" >> user.js
echo "user_pref(\"toolkit.telemetry.reportingpolicy.firstRun\", false);" >> user.js
echo "user_pref(\"browser.link.open_newwindow\", 2);" >> user.js

mv user.js ~/.mozilla/firefox/appfox.$nume/

# Creating the userChrome.css
touch userChrome.css

echo "#identity-box, #navigator-toolbox::after, #TabsToolbar {visibility: collapse;}" >> userChrome.css
echo "#nav-bar {visibility: collapse !important; max-height: 0 !important; margin-bottom: -20px !important;}" >> userChrome.css

mv userChrome.css ~/.mozilla/firefox/appfox.$nume/chrome

# Restoring passwords and logins saved
ln -s -t ~/.mozilla/firefox/appfox.$nume/ ~/.mozilla/firefox/*.default/key4.db 
ln -s -t ~/.mozilla/firefox/appfox.$nume/ ~/.mozilla/firefox/*.default/logins.json 
cp ~/.mozilla/firefox/*.default/cert9.db ~/.mozilla/firefox/appfox.$nume

notify-send "$name was create" 'Go to the menu for try it!' --icon=$icon

echo "All done! Enjoy it!"
