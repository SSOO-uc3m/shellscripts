awk '
BEGIN {FS=":"
cuenta_2=0
cuenta_1=0
cuenta_3=0
cuenta_4=0}
$2=="!" {++cuenta_1 }
$2=="*" {++cuenta_2 }
$2=="!!" {++cuenta_3 }
$2!="!" && $2!="!!" && $2!="*" {++cuenta_4 }
END {print "usuarios_!=" cuenta_1
print "usuarios_*=" cuenta_2
print "usuarios_!!=" cuenta_3
print "usuarios_otros=" cuenta_4
}
' shadow

