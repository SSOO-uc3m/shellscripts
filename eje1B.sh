#!/bin/bash
for i in $*; do
	awk -v user=$i -F":" '( $1 == user ) { print $1 ": " $7 }' /etc/passwd;        
	
 done

