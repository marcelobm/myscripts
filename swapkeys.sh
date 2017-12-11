#!/bin/bash
first_param=$1
if [ -z $first_param ]; then
	echo "You must proive a <user@IP> as a parameter."
	exit 1
fi

ls -l ~/.ssh/id*pub > /dev/null
ls_exit_code=$?

if [ $ls_exit_code = "2" ]; then
	echo ""
	echo "Could not find keys, attempting to generate..."
	echo "Please accept the default options (press Enter) on the questions."
	echo ""
	ssh-keygen -t dsa
fi

echo "Exchanging key..."
echo " (ssh ${first_param} \"cat >> /root/.ssh/authorized_keys\" < ~/.ssh/id*pub) "
ssh $first_param "cat >> /root/.ssh/authorized_keys" < ~/.ssh/id*pub

