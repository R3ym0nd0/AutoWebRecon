#!/bin/bash

typeTarget() {
	while true
	do
		#Asking to type the target
		read -p "--> Enter Target (e.g. example.com or 23.215.0.138): " target


		# Regex for basic IPv4 format 
		ipv4_regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

		# Regex for domain format
		domain_regex="^([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$"

		if [[ $target =~ $ipv4_regex || $target =~ $domain_regex ]]; then
   			break
		else
    			echo -e "\n Invalid target format. Please enter a valid IP or domain"
			echo "================================================================================"
		fi
	done
}

menu() {
	while true
	do
		echo "================================================================================"

		echo -e "[*] Recon Mode Selection\n"
		echo "[1] Passive (Stealth Mode)"
		echo "[2] Hybrid (Balanced Mode)"
		echo "[3] Active (Aggressive Mode)"

		echo "================================================================================"
		read -p "--> Select Mode [ 1 - 3 |'q' to go back ]: " mode

		if [[ $mode == 1 ]] then
			passiveMode
		elif [[ $mode == 2 ]] then
			hybridMode
		elif [[ $mode == 3 ]] then
			aggressiveMode
		elif [[ $mode == 'q' ]] then
			echo "================================================================================"
			typeTarget
		else
			echo -e "\nInvalid Option, Please Try Again\n"
		fi
	done
}

passiveMode() {
	echo "================================================================================"

	echo -e "[*] Running whois...\n"
	whois $target

	echo "================================================================================"

	echo -e "[*] Running nslookup...\n"
	nslookup $target

	echo "================================================================================"

	echo -e "[*] Running dig...\n"
	dig +noall +answer $target

	echo "================================================================================"

	echo -e "[*] Running theHarvester...\n"
	theHarvester -d $target -b bing -f output/theharvester_bing.html

	echo "================================================================================"

	echo -e "[*] Running dnsrecon...\n"
	dnsrecon -d $target -n 8.8.8.8

	echo "================================================================================"

	echo -e "[✔] Passive recon completed."
}

hybridMode() {
	echo "================================================================================"

        echo -e "[*] Running whois...\n"
        whois $target

        echo "================================================================================"

        echo -e "[*] Running nslookup...\n"
        nslookup $target

        echo "================================================================================"

        echo -e "[*] Running dig...\n"
        dig +noall +answer $target

        echo "================================================================================"

        echo -e "[*] Running theHarvester...\n"
        theHarvester -d $target -b bing -f output/theharvester_bing.html

        echo "================================================================================"

        echo -e "[*] Running dnsrecon...\n"
        dnsrecon -d $target -n 8.8.8.8

	echo "================================================================================"

	echo -e "[*] Running whatweb...\n"
	whatweb $target

	echo "================================================================================"

	echo -e "[*] Running wafw00f...\n"
	wafw00f $target

	echo "================================================================================"

	echo -e "[*] Running curl...\n"
	curl -I -v $target

	echo "================================================================================"

	echo -e "[✔] Hybrid recon completed."
}

aggressiveMode() {
	echo "================================================================================"

	echo -e "[*] Running dnsenum...\n"
	dnsenum -v $target

	echo "================================================================================"

	echo -e "[*] Running wpscan...\n"
	wpscan --url http://$target --disable-tls-checks

	echo "================================================================================"

	echo -e "[*] Running nmap...\n"
	nmap -A $target
	nmap -O $target
	nmap --script vuln $target

	echo "================================================================================"
	echo -e "[*] Running nikto...\n"
	nikto -h $target

	echo "================================================================================"
	echo -e "[*] Running gobuster...\n"
	gobuster dir -u http://$target -w /usr/share/wordlists/dirb/common.txt

	echo "================================================================================"

	echo -e "[✔] Aggressive recon completed."
}

AutoWebRecon() {

	echo "================================================================================"
	figlet AutoWebRecon
	echo "================================================================================"
	echo "Tool Name   : AutoWebRecon"
	echo "Version     : 1.0"
	echo "Coded By    : Reymond Joaquin"
	echo "Description : Automates website reconnaissance using built-in Kali tools"
	echo "Disclaimer  : For authorized use only. Always get permission before scanning"
	echo "================================================================================"

	typeTarget
	menu
}

#Running the script
AutoWebRecon
