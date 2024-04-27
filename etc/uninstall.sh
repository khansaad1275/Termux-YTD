#!/data/data/com.termux/files/usr/bin/bash

# Project name : Termux-YTD
# Coded by: Khansaad1275 (You dont become a coder by just changing the credits)
# Github: https://github.com/khansaad1275/Termux-YTD
# Date : 14/4/2020

TERMUX_HOME="/data/data/com.termux/files/home"

if [ -f "${TERMUX_HOME}/bin/termux-url-opener" ]; then
    printf '\e[0;36mRemoving termux-url-opener\e[0m\n'
    sleep 2
    rm "${TERMUX_HOME}/bin/termux-url-opener"
fi