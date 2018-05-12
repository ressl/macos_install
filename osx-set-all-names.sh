#!/bin/bash

SNAME='mymac'
DOMAIN='safematix.com'

# Bonjour name ending in .local
sudo scutil --set LocalHostName "${SNAME}"
# Friendly name shown in System Preferences > Sharing
sudo scutil --set ComputerName "${SNAME}"
# The name recognized by the hostname command
sudo scutil --set HostName "${SNAME}.${DOMAIN}"

# Set the NetBIOS name
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "${SNAME}"
