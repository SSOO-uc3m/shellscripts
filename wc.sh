#!/bin/bash
if [ $# -eq 1 ]
then
           file=$1
           if [ ! -f $file ]; then
		echo $file no es un fichero válido
		exit -1
	   fi
           lines=`grep -c ".*" $file`
           words=0
           chars=0
           i=1
           while [ $i -le $lines ]
           do
                      line=`head -$i $file | tail -1`

                      linelen=`expr "$line" : '.*'`

                      chars=`expr $chars + $linelen`
                      lineword=`echo $line | awk -F " " '{print NF}'`

                      words=`expr $words + $lineword`

                      i=`expr $i + 1`
           done
           echo "\n\n\t\t=== Details of file \"$file\" ===\n\n"
           echo "Line(s) are : $lines"
           echo "Words(s) are : $words"
           echo "Char(s) are : $chars"
else
           echo "Pass one command line argument i.e file_name"
fi

