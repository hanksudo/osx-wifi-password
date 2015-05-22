#!/bin/sh

airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
airportScan=`$airport -I`

SSID=`$airport -I | grep -e "\sSSID:" | awk -F": " '/SSID/{print $2}'`

if [[ -n "$SSID" ]]; then
    security find-generic-password -D "AirPort network password" -g -l "$SSID"
else
    echo "No Wi-Fi device found!"
fi
