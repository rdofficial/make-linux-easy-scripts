# ----
# check-package-manager [bash / shell script]
#
# This script serves the function of checking the package-manager software that your current linux distro uses, and then gives the output to the user with all the required information. The script contains the functions and code that does it. The same code is used in the different scripts in this repository for checking the package-manager of the current linux distro.
#
# Author : Rishav Das (https://github.com/rdofficial/)
# Created on : April 31, 2021
#
# Last modified by : - Rishav Das (https://github.com/rdofficial/)
# Last modified on : - May 3, 2021
#
# Changed made on last modification :
# 1. Added the code for making the script more to work like a module, than an directly executable script. i.e., user now needs to enter some specific arguments while calling the script in order to run the script directly.
#
# Authors contributed to this script (Add your name below if you have contributed) :
# 1. Rishav Das (https://github.com/rdofficial/, email:rdofficial192@gmail.com)
#
# ----

# First checking for APT
packageManagerName=""
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

					packageManagerName="abs"
				fi
			else
				# If the package manager is DNF

				packageManagerName="dnf"
			fi
		else
			# If the package manager is YUM

			packageManagerName="yum"
		fi
	else
		# If the package manager is pacman

		packageManagerName="pacman"
	fi
else
	# If the package manager is APT

	packageManagerName="apt"
fi

# ----
# THE WAY OF DIRECTLY CALLING THE SCRIPT
# 1. If the user wants the script to print the fetched information directly, then the user has to use the below specified commands to do so
# 'bash check-package-manager.sh 0' or 'bash check-package-manager.sh true' or 'bash check-package-manager.sh execute'
# 2. These steps are taken in such way, so that the script is used more as a module to load the required information stored variables into the other scripts of this project.
# ----
#
# Checking the arguments entered by the user while calling this script
if [[ $1 == "true" ]] || [[ $1 == "execute" ]] || [[ $1 == "0" ]]; then
	# If the user entered the argument to directly execute the script, then we continue to do it

	# Displaying the name of the package manager on the console screen
	echo -e "The package manager used on this computer is : \033[92m${packageManagerName}\033[00m"
fi
