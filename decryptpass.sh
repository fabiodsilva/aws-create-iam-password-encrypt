#!/bin/bash

> password.txt
for i in `awk '(NR>1)' accounts.txt | awk -F "," '{print $1}'`; do 
	
	PASS=`cat encrypted_password.$i.txt | base64 --decode | keybase pgp decrypt` 
	echo "$i    ;    $PASS" >> password.txt  

done


