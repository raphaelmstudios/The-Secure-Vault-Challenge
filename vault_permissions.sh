#!/bin/bash

#Function to update file permission

update_permission() {
    file="$1"
    default="$2"
    
    echo "Current permissions for $file:"
    ls -l "$file"
    
    read -p "Update permissions for $file?[yes /no]: " answer
    
    if [ "$answer" = "yes" ]; then
        read -p "Enter new permission: " new_perm
        chmod "$new_perm" "$file"
        echo "Updated $file to $new_perm"
    elif [ "$answer" = "" ]; then
        chmod "$default" "$file" 
        echo "Applied default $default to $file"
    else
        echo "No changes to $file"
    fi
    
}

#check if file exists
if [ -d secure_vault ]; then
	echo "secure_vault exists"
else 
	echo "Error, secure_vault does not exist"
fi

#Change to directory secure_shell
cd secure_vault

#Display the current file permission
ls -l

#Process each file
update_permission "keys.txt" "600"
update_permission "secrets.txt" "640"
update_permission "logs.txt" "644"

#showing final permissions
echo "Final permissions"
ls -l keys.txt secrets.txt logs.txt
