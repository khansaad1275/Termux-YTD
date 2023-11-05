#!/data/data/com.termux/files/usr/bin/bash

# Project name : Termux-YTD
# Coded by: Khansaad1275 (You dont become a coder by just changing the credits)
# Github: https://github.com/khansaad1275/Termux-YTD
# Date : 14/4/2020

# COLORS
GREEN="\e[01;32m"
CYAN="\e[01;36m"
MAGENTA="\e[01;35m"
YELLOW="\e[01;33m"
BLUE="\e[01;34m"
RED="\e[01;31m"
RESET="\e[0m"

TERMUX_HOME="/data/data/com.termux/files/home"

# Make sure we are up to date.
printf "${GREEN}Retrieving package lists and updating${RESET}\n"
apt-get update && apt-get upgrade -y

# If the storage directory does not exist, run termux-setup-storage.
if [ ! -d "${TERMUX_HOME}/storage" ]; then
  printf "${YELLOW}Requesting access to storage${RESET}\n"
  sleep 2
  termux-setup-storage
fi

# Install python if it is not already.
if ! apt-cache pkgnames | grep "^python$" &>/dev/null; then
  printf "${CYAN}Installing python${RESET}\n"
  sleep 2
  apt-get install python -y
fi

# Install the yt-dlp python module if it isn't installed.
if ! pip list | grep "^yt-dlp" &>/dev/null; then
  printf "${CYAN}Installing yt-dlp${RESET}\n"
  sleep 2
  pip install yt-dlp
fi

# Create the output directory if needed.
OUTPUT_PATH="${TERMUX_HOME}/storage/shared/Youtube"
if [ ! -d "${OUTPUT_PATH}" ]; then
  printf "${CYAN}Creating output directory at \"${OUTPUT_PATH}\"${RESET}\n"
  sleep 2
  mkdir "${OUTPUT_PATH}"
fi

# Create the directory for our config file.
CONFIG_FOLDER="${TERMUX_HOME}/.yt-dlp"
if [ ! -d "${CONFIG_FOLDER}" ]; then
  printf "${CYAN}Creating config directory for yt-dlp${RESET}\n"
  sleep 2
  mkdir -p "${CONFIG_FOLDER}"
fi

# Copy the config file for yt-dlp in the valid directory.
# (If there is already a config file, we ask if the user wants to overwrite it)
printf "${CYAN}Creating config file for yt-dlp${RESET}\n"
cp -i config "${CONFIG_FOLDER}/config"

# Install the url opener.
printf "${BLUE}Installing Termux-YTD${RESET}\n"
mkdir -p "${TERMUX_HOME}/bin"
cp -f termux-url-opener "${TERMUX_HOME}/bin/termux-url-opener"
chmod +x "${TERMUX_HOME}/bin/termux-url-opener"
sleep 2

# Install the termux API and inform the user about system gallery settings.
printf "${RED}WARNING!!! ${RESET}\n${YELLOW}By default, the videos you download won't appear in your system gallery, and therefore you won't be able to use them.\n"
printf "If you wish to see the video appear in your gallery, you'll have to install the ${MAGENTA}termux-api app${RESET} via ${MAGENTA}F-Droid app${RESET}\n"

read -rp "Do you want to install it? (yes/y/no/n) " RES

USER_ANS=$(echo "${RES^}" | cut -c 1-1 )

if [ $USER_ANS = "Y" ]; then
  if [! apt-cache pkgnames | grep "termux-api" &>/dev/null]; then
    printf "${CYAN}Installing termux-api package${RESET}\n"
    pkg install termux-api
    # WORK IN PROGRESS
    sleep 2
  fi
fi

printf "\n${CYAN}Installation Complete!${RESET}\n"
printf "${CYAN}Just open the video you want to download in YouTube, click share, select Termux, choose a quality, and the download will start${RESET}\n"
printf "${GREEN}For More Awesome and Useful Tools like this, Visit My website ©www.LearnTermux.tech${RESET}\n"
