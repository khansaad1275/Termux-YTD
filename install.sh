#!/data/data/com.termux/files/usr/bin/bash

# Project name : Termux-YTD
# Coded by: Khansaad1275 (You dont become a coder by just changing the credits)
# Github: https://github.com/khansaad1275/Termux-YTD
# Date : 14/4/2020

TERMUX_HOME="/data/data/com.termux/files/home"

# Make sure we are up to date.
printf '\e[01;36mRetriving package lists and updating\e[0m\n'
apt-get update && apt-get upgrade -y

# If the storage directory does not exist run termux-setup-storage.
if [ ! -d "${TERMUX_HOME}/storage" ]; then
  printf '\e[0;36mRequesting acces to storage\e[0m\n'
  sleep 2
  termux-setup-storage
fi

# Install python if it is not already.
if ! apt-cache pkgnames | grep "^python$" &>/dev/null; then
  printf '\e[0;36mInstalling python\e[0m\n'
  apt-get install python -y
fi

# Install the youtube-dl python module if it isnt installed.
if ! pip list | grep "^youtube-dl" &>/dev/null; then
  printf '\e[0;36mInstalling youtube-dl\e[0m\n'
  pip install youtube-dl
fi

# Create the output directory if needed.
if [ ! -d "${TERMUX_HOME}/storage/shared/Youtube" ]; then
  printf '\e[0;36mCreating output directory at "~/storage/shared/Youtube"\e[0m\n'
  mkdir "${TERMUX_HOME}/storage/shared/Youtube"
fi

# Create the directory for our config file.
if [ ! -d "${TERMUX_HOME}/.config/youtube-dl" ]; then
  printf '\e[0;36mCreating config directory for youtube-dl\e[0m\n'
  mkdir -p "${TERMUX_HOME}/.config/youtube-dl"
fi

# Install the url opener.
printf '\e[0;36mInstalling Termux-YTD\e[0m\n'
mkdir -p "${TERMUX_HOME}/bin"
mv termux-url-opener "${TERMUX_HOME}/bin"
chmod +x "${TERMUX_HOME}/bin/termux-url-opener"

printf '\n\e[0;36mInstallation Complete!\e[0m\n'
printf '\e[0;36mJust open the video you want to download in youtube, click share, select termux, choose a quality, and the download will start\e[0m\n'
printf '\e[0;32mFor More Awesome and Useful Tool like this Visit My website ©www.LearnTermux.tech\e[0m\n'
