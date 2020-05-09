#!/data/data/com.termux/files/usr/bin/bash
# Project name : Termux-YTD
# Coded by: Khansaad1275 (You dont become a coder by just changing the credits)
# Github: https://github.com/khansaad1275/Termux-YTD
# Date : 14/4/2020

echo -e "\e[035m"  "Updating default packages\n"
apt update && apt upgrade -y

echo -e "\e[032m" "Requesting acces to storage\n"
sleep 2
echo -e "\e[032m" "Allow Storage Permission!"
sleep 2
termux-setup-storage
sleep 5

echo -e "\e[033m" "Installing python\n"
pkg install python -y



# Monitization 
clear
echo -e "\e[031m" "░░░░░░░▄█▄▄▄█▄"
echo -e "\e[031m" "▄▀░░░░▄▌─▄─▄─▐▄░░░░▀▄"
echo -e "\e[031m" "█▄▄█░░▀▌─▀─▀─▐▀░░█▄▄█"
echo -e "\e[031m" "░▐▌░░░░▀▀███▀▀░░░░▐▌"
echo -e "\e[031m" "████░▄█████████▄░████"
echo " "
echo  -e "\e[031m" "☣Please Activate the Tool☣!!"
echo  -e "\e[032m" "1. SKIP THE ADD AFTER 5 SEC"
echo  -e "\e[032m" "2. Copy the Activation Code"
echo  -e "\e[032m" "3. Paste the Activation Code in Termux"
read -p "Press Enter to get the Activation code..."
clear
xdg-open http://gestyy.com/e0vSXP 

while true
do
  echo " "
	echo -e "\e[032m" "──▄▀▀▀▄───────────────"
	echo -e "\e[032m" "──█───█───────────────"
	echo -e "\e[032m" "─███████─────────▄▀▀▄─"
	echo -e "\e[032m" "░██─▀─██░░█▀█▀▀▀▀█░░█░"
	echo -e "\e[032m" "░███▄███░░▀░▀░░░░░▀▀░░"
	echo " "
	echo -e "\e[032m" "╔[Paste Your Activation code]"
  echo -e "\e[032m" "║ "
	read -p " ╚═➤ " option

	if [ "$option" == "5ws5dwLearnTermux.techs2ewd4f" ]
	then
      echo " "
	    sleep 3 & PID=$! #simulate a long process

		echo -e "\e[032m" "Authenticating Please Wait..."
    echo " "
		printf "["
		# While process is running...
		while kill -0 $PID 2> /dev/null; do 
		    printf  "▓"
		    sleep 0.2
		done
		printf "]"

		echo " "
    echo " "
		echo -e "\e[032m" "Authorization Complete!!"
    sleep 1
    clear
		break
	else
		sleep 2 & PID=$! #simulate a long process
    echo " "
		echo -e "\e[032m" "Authenticating Please Wait..."
		echo " "
    printf "["
		# While process is running...
		while kill -0 $PID 2> /dev/null; do 
		    printf  "▓"
		    sleep 0.1
		done
		printf "]"
		
    echo " "
    echo " "
		echo -e "\e[031m" "The Activation Code is invalid!!"
		echo " "
		read -p " Please Press Enter To try again..."
  fi
done




echo -e "\e[034m"  "Installing youtube-dl\n"
pip install youtube-dl

echo -e "\e[032m"  "Making the Youtube Directory to download the Vidoes\n"
mkdir ~/storage/shared/Youtube

echo -e "\e[036m"  "Creating youtube-dl folder for config\n"
mkdir -p ~/.config/youtube-dl

echo -e "Creating bin folder\n"
mkdir ~/bin

echo -e "Creating Termux-URL-Opener Script.\n"

mv termux-url-opener ~/bin/
echo -e "\n"
echo -e "\e[032m" "Process Complete!"
echo -e "\e[032m" "Now you can share any Youtube video with Termux and you will be ask to select the quality of your downloaded video and after that,It will be automatically dwonloaded"
echo -e "\e[033m" "©www.LearnTermux.tech"
