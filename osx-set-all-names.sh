#!/bin/bash
# Bonjour name ending in .local
scutil --set LocalHostName "My-iMac"
# Friendly name shown in System Preferences > Sharing
scutil --set ComputerName "My-iMac"
# The name recognized by the hostname command
scutil --set HostName "My-iMac"
# Save the computer's serial number in a variable so it can be used in the next command.
serialNum=$(ioreg -l | awk '/IOPlatformSerialNumber/ { split($0, line, "\""); printf("%s\n", line[4]); }')
# Set the NetBIOS name as the serial number
defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$serialNum"
