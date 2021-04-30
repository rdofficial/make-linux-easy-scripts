# check-package-manager [bash / shell script]
#
# This script serves the function of checking the package-manager software that your current linux distro uses, and then gives the output to the user with all the required information. The script contains the functions and code that does it. The same code is used in the different scripts in this repository for checking the package-manager of the current linux distro.
#
# Author : Rishav Das (https://github.com/rdofficial)
# Created on : April 31, 2021
#
# Last modified : -
# Authored by : -
#
# Authors contributed to this script (Add your name below if you have contributed) :
# 1. Rishav Das (https://github.com/rdofficial/, email:rdofficial192@gmail.com)
#

# First checking for APT
pmName=""
if [[ -z $( type -p apt ) ]]; then
	# If the package manager is not APT, then we continue for checking for pacman

	if [[ -z $( type -p pacman ) ]]; then
		# If the package manager is not pacman, then we continue to check for YUM

		if [[ -z $( type -p yum ) ]]; then
			# If the package manager is not YUM, then we continue to check for DNF

			if [[ -z $( type -p dnf ) ]]; then
				# If the package manager is not DNF, then we continue to check for the ABS

				if [[ -z $( type -p abs ) ]]; then
					# If the package manager is not ABS, then we declare that whatever package-manager that the operating system (Linux distro) uses is not supported by the scripts in this project / repository

					echo -e "\033[07;91m[ Error : Unrecognized package manager. Whatever package manager is being used on this computer is not supported by any of the scripts of this project (repository). Please contact the author/owner for more information, or just look at the docs / help section ]\033[00m"
					exit
				else
					# If the package manager is ABS

					pmName="abs"
				fi
			else
				# If the package manager is DNF

				pmName="dnf"
			fi
		else
			# If the package manager is YUM

			pmName="yum"
		fi
	else
		# If the package manager is pacman

		pmName="pacman"
	fi
else
	# If the package manager is APT

	pmName="apt"
fi

# Finally displaying the name of the package manager on the console screen
echo -e "The package manager used on this computer is : \033[92m${pmName}\033[00m"
