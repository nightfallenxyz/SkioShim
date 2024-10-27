#!/bin/bash
# prototype

clear

connect_wifi() {
  echo "Availible networks:"
  nmcli dev wifi list
  echo "Enter the name of the wifi to connect to"
  read ssid
  echo "enter the password for $ssid:"
  read -s password
  nmcli dev wifi connect "$ssid" password "$password"
}

connect_wifi

if nmcli -t -f active,ssid dev wifi | grep -q '^yes'; then
  echo "Connected to wifi! Starting the browser"

  chromium &
else
    echo"failed to connect to wifi"
    fi
