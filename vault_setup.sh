#!/bin/bash

#Create a directory
mkdir -p secure_vault

#change into the new directory
cd secure_vault

#creating the files
touch keys.txt secrets.txt logs.txt

#print the welcome message to the files
echo "Welcome" >> keys.txt
echo "Welcome" >> secrets.txt
echo "Welcome" >> logs.txt

#prints a success message and lists all files in long format
echo "Files were successfully made"
ls -l

