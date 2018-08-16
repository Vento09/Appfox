## Appfox

With Appfox, you can create web app using the Mozilla Firefox engine on Linux. The Appfox uses Firefox profiles. For use it, follow the steps below.

![Screenshoot of Appfox using the YouTube site](/Screenshoot_on_eOS.png)

### Instalation

1. Clone or download this repository;
2. Open terminal in the folder that you have downloaded it ;
3. Run: 
```
./Appfox.sh
```
4. Write the name, url address and the icon name. **DO NOT USE SPACE IN URL ADDRESS AND ICON**

5. Run
```
sudo cp firefox.desktop /usr/share/applications
```
This last command is really necessary because if you open first a web app and then open the firefox, it will open a new window using the web app profile. So everytime firefox upgrades, run this command! 

Enjoy it!

### Deleting

1. Open terminal in the folder that you have downloaded it ;
2. Run 
```
./delete.sh
```
and write the **same** name of the app.

DONE! :)

### It happens

* **Firefox is saying that there more tabs than one when I close it**
  
It's normal! If you want to see the tab press CTRL+TAB  to see the other tabs. You can close it pressing CTRL+W. 

* **"I have to connect with the accounts that I saved with firefox sync!"**
  
  Firefox profile saves your accounts in different folders. Sometimes you should have to connect first in the browser then in the web app. 
