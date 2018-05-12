#!/bin/bash
for i in $( find "$1" -name \*.jpg -size +1M ); 
do
	mogrify -resize 720 $i;
	echo $i;
done
