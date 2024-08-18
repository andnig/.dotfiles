#!/bin/bash

echo "Hiding Dock and menu bar"
read -p "Is your dock currently hidden? (y/n)" dock_hide
if [ $dock_hide == "n" ]; then
  osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"
fi

# read -p "Is your menu bar currently hidden? (y/n)" menu_hide
# if [ $menu_hide == "n" ]; then
# 	osascript -e 'tell application "System Events"
#     tell dock preferences to set autohide menu bar to not autohide menu bar
#     end tell'
# fi

echo "make sure dark mode is activated"
osascript -e 'tell application "System Events"
    tell appearance preferences
        set dark mode to true
    end tell
end tell'

echo "Start 'aerospace' window manager now, from you application launcher"
