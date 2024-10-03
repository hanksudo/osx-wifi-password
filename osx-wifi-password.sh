#!/bin/sh

device=$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')
SSID=$(networksetup -getairportnetwork "$device" | cut -d " " -f4)
echo "$SSID"
if [[ -n "$SSID" ]]; then
    security find-generic-password -D "AirPort network password" -g -l "$SSID" 2>&1 >/dev/null
else
    echo "No Wi-Fi device found!"
fi
