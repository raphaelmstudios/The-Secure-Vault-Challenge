#!/bin/bash
report_path="secure_vault/vault_report.txt"

CompPerm(){
	local file=$1
	filePerm=$(stat -c %a $file)
	Standardperm=644

	if [ $filePerm -gt $Standardperm ]; then
		echo "⚠️ SECURITY RISK DETECTED"
	else
		echo "FILE IS SECURE✅"

	fi



}

for file in "secure_vault"/*; do

	#print name of file
	echo -e "Filename:$(stat -c %n $file | awk -F '/' '{print $2}')"
	echo -e "Filename:$(stat -c %n $file | awk -F '/' '{print $2}')" >> $report_path

	#print size of file in bytes
	echo -e "\tFile Size: $(stat -c %s $file)"
        echo -e "\tFile Size: $(stat -c %s $file)" >> $report_path

	#print Last modified date
	echo -e "\tLast Modified Date: $(stat -c %s $file)"
        echo -e "\tLast Modified Date: $(stat -c %s $file)" >> $report_path

	#print current permissions
	echo -e "\tCurrent Permissions: $(stat -c %a $file)"
        echo -e "\tCurrent Permissions: $(stat -c %a $file)" >> $report_path

	#call permissions
	echo -e "\tPermissions: $(stat -c %a $file) - $(CompPerm $file)"

done
