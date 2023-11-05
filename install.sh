#!/data/data/com.termux/files/usr/bin/bash

# Project name : Termux-YTD
# Coded by: Khansaad1275 (You dont become a coder by just changing the credits)
# Github: https://github.com/khansaad1275/Termux-YTD
# Date : 14/4/2020

# COLORS
GREEN="\e[32m"
CYAN="\e[36m"
MAGENTA="\e[35m"
YELLOW="\e[33m"
BLUE="\e[34m"
RED="\e[31m"

# BOLD COLORS
GREEN_B="\e[01;32m"
CYAN_B="\e[01;36m"
MAGENTA_B="\e[01;35m"
YELLOW_B="\e[01;33m"
BLUE_B="\e[01;34m"
RED_B="\e[01;31m"

# RESET
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
sleep 1

# Install the url opener.
printf "${BLUE}Installing Termux-YTD${RESET}\n"
sleep 2
mkdir -p "${TERMUX_HOME}/bin"
cp -f termux-url-opener "${TERMUX_HOME}/bin/termux-url-opener"
chmod +x "${TERMUX_HOME}/bin/termux-url-opener"

# Install the termux API and inform the user about system gallery settings.
printf "${RED_B}WARNING!!! ${RESET}\n${YELLOW}By default, the videos you download won't appear in your system gallery, and therefore you won't be able to use them.\n"
printf "If you wish to see the video appear in your gallery, you'll have to install the ${MAGENTA}Termux:API app${RESET} via ${MAGENTA_B}${TERMUX_APK_RELEASE}${RESET}\n"

read -rp "Do you want to install the termux-api package? (yes/y/no/n) " RES

USER_ANS=$(echo "${RES^}" | cut -c 1-1 )

if [ $USER_ANS = "Y" ]; then
    printf "\n${CYAN}Installing termux-api package${RESET}\n"
    sleep 2
    pkg install termux-api
    if [ $? -eq 0 ]; then
  	  printf "${GREEN_B}termux-api package successfully installed${RESET}\n"
  	  printf "${YELLOW}Termux app was installed via ${MAGENTA_B}${TERMUX_APK_RELEASE}${RESET}\n"
      printf "${YELLOW}You will need to install the Termux:API app through that way too${RESET}\n"
	  else
  	  printf "${RED_B}An error occurred during termux-api installation${RESET}\n"
	  fi
    sleep 2
fi

printf "\n${CYAN_B}Installation Complete!${RESET}\n"
printf "${CYAN}Just open the video you want to download in YouTube, click share, select Termux, choose a quality, and the download will start${RESET}\n"
printf "${GREEN}For More Awesome and Useful Tools like this, Visit My website ©www.LearnTermux.tech${RESET}\n"
