#!/bin/bash

echo "Let's start!"

cp Principal.desktop $1.desktop

echo "Configuring the application"

echo "Name=$1" >> $1.desktop
echo "Exec=firefox -P app $2" >> $1.desktop
echo "Icon=$3" >> $1.desktop

mv $1.desktop ~/.local/share/applications

echo "All done"
