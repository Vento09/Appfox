#!/bin/bash

echo "What is the WebApp you want to delete?
read del

rm ~/.local/share/applications/$del.desktop
