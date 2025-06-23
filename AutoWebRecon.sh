#!/bin/bash

echo "$(ifconfig)"
echo ""

scan_network_host() {
	while true
	do
		#Asking to type CIDR Notation
		read -p "--> Type CIDR Notation (Type 'skip' to skip this phase): " cidr
		#If user type skip then it will skip this phase
		if [[ ${cidr,,} == "skip" ]]; then
			break
		#Else, it will continue scanning CIDR notation that user type
		else
			echo ""
			echo "---Scanning active network host---\n"
			echo "$(nmap -sn $cidr)\n"
			
			break
		fi
	done
}

gathering_info() {
	while true
	do
		#Asking user to type specific IP Address
		read -p "--> Type your target: " target
		if [[ $target == "" ]]; then
			echo "Please Type a Target"
		else
			
			echo ""
			echo -e "Step 1: Knowing your target\n"
			echo -e "$(whois $target)\n"
			echo -e "$(nslookup $target)\n"
			echo -e "$(dig $target)\n\n"
			
			echo -e "Step 2: finding Ports\n"
			echo -e "$(nmap $target)\n\n"
			
			echo -e "Step 3 Running -sV\n"
			echo -e "$(nmap -sV $target)\n\n"
			
			echo -e "Step 4 Running nikto -h\n"
			echo -e "$(nikto -h $target)"
			break
		fi
	done
}

aggressive() {
	while true
	do
		#Asking user if he wants to use aggressive mode
		read -p "--> Do you want to use Aggressive commands (yes/no): " user
		#If user said YES
		if [[ ${user,,} == "yes" ]]; then
			echo ""
 			echo -e "Step 1: Running -O\n"
			echo -e "$(sudo nmap -O $target)\n\n"
			
			echo -e "Step 2: Running -A\n"
			echo -e "$(sudo nmap -A $target)\n\n"
			
			echo -e "Step 3: Running --script vuln\n"
			echo -e "$(sudo nmap --script vuln $target)"
			
			break
		#If user said NO
		elif [[ ${user,,} == "no" ]]; then
			break
		else
			echo "Yes or No Only, Please try again"
		fi
	done
}

AutoWebRecon() {
	scan_network_host
	gathering_info
	aggressive
}

#Running the script
AutoWebRecon
