# ----
# check-distro [bash / shell script]
#
# This script serves the functions to find out the information about the linux distribution that is currently installed in the user's computer system. The functions that are defined in this script are used by other scripts around this repository for getting information about the linux distro in which they are being executed.
#
# Author : Rishav Das (https://github.com/rdofficial/)
# Created on : April 31, 2021
#
# Last modified by : - Rishav Das (https://github.com/rdofficial/)
# Last modified on : - May 3, 2021
#
# Authors contributed to this script (Add your name below if you have contributed) :
# 1. Rishav Das (https://github.com/rdofficial/, email:rdofficial192@gmail.com)
#
# ----

# First getting the linux base type
# ----
# Note :-
# 1. The linux base name is fetched using the lsb_release file information, and this file may or may not be present in many linux distributions. So, chances of errors are possible, therefore we go for the second method, i.e., the linux distro variable which contain the exact linux base + linux information. But, there comes the hard work, when we have to understand which linux base does the ditro belongs to. Like the way the 'Kali Linux' belongs to 'Debian base'.
# ----
linuxBase=$( cat /etc/*-release | tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|arch)' | uniq )

# Getting the linux distribution name
# ----
# Note :-
# 1. The method which we are using is supported for all the linux distributions which are supported by our scripts, and those distros are which belongs to debian, ubuntu base, arch base, red hat base.
# ----
# Checking the issue file in the /etc/ folder for distro information
linuxDistro=$( cat /etc/issue | awk '{ print $1 " " $2 }' )
linuxDistro=${linuxDistro:0:${#linuxDistro}-2}

# Now, checking for the linux distro information wheter appropriate or not
if [[ $linuxDistro == *"Gento"* ]]; then
	# If the linux distro type is of a Gentoo linux, then we display the error of unsupported distro

	echo -e "[ Error : Gentoo Linux is not supported by the scripts ]"
	exit
fi

# ----
# THE WAY OF DIRECTLY CALLING THE SCRIPT
# 1. If the user wants the script to print the fetched information directly, then the user has to use the below specified commands to do so
# 'bash check-distro.sh 0' or 'bash check-distro.sh true' or 'bash check-distro.sh execute'
# 2. These steps are taken in such way, so that the script is used more as a module to load the required information stored variables into the other scripts of this project.
# ----
#
# Checking the arguments entered by the user while calling this script
if [[ $1 == "true" ]] || [[ $1 == "execute" ]] || [[ $1 == "0" ]]; then
	# If the user entered the argument to directly execute the script, then we continue to do it

	# Displaying the information fetched on the console screen
	echo -e "Information fetched : \n[\033[93m$\033[00m] Linux base : \033[92m${linuxBase}\033[00m\n[\033[93m$\033[00m] Linux distro : \033[92m${linuxDistro}\033[00m"
fi
