#!/bin/bash

cd secure_vault

while true; do 
	echo -e "\n⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜ VAULT OPERATIONS ⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜"
	echo "1. Add Secret"
	echo "2. Update Secret"
	echo "3. Add Log Entry"
	echo "4. Access Keys"
	echo "5. Exit"
	read -p "Choose option[1-5]: " choice

	case $choice in
		1)
			read -p "Enter new secret: " secret
			echo "$secret" >> secrets.txt
			echo "Secret added!"
			;;

		2)
			read -p "Enter previous secret: " previous
			read -p "Enter secret to replace: " new

			if grep -q "$previous" secrets.txt; then
				    sed "s/$previous/$new/g" secrets.txt
				    echo "Secret Updated"

				else 
					echo "No match found."

				fi

			;;

		3)
			read -p "Enter log message: " log
			echo "you logged in $log on $(date)" >> logs.txt
			cat logs.txt
			echo "Log entry added!"

			;;

		4)
			echo "ACCESS DENIED!"

			;;

		5)
			echo "Goodbye!"
			exit 
			
			;;

		*)
			echo "Invalid option!"

			;;
	esac
done
