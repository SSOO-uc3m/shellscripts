#!/bin/bash
# example /etc/group sys:x:3:root,bin,daemon
while read linea 
do
	gid=$(echo $linea | cut -d : -f3);
	
	if [[ $gid = $1 ]]; then
		echo $linea | cut -d : -f4 | tr , \\n
	fi
done < /etc/group

