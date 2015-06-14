
T='gYw'   # The test text
echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";
for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
        do echo -en "$EINS \033[$FG\033[$BG  $T \033[0m\033[$BG \033[0m";
    done
    echo;
done
echo


function fg {
	echo "\e[38;5;${1}m"
}

function bg {
	echo "\e[48;5;${1}m"
}

function colorblock {
	startcolor=$1
	endcolor=$2
	cols=$3

	rows=$(( ($endcolor - $startcolor) / $cols ))
	color=$startcolor
	r=0
	while [[ $r -lt $rows ]]; do
		c=0
		row=""
		color=$(( $startcolor + $r ))
		while [[ $c -lt $cols  ]]; do
			fgc=$(fg $color)
			bgc=$(bg $color)
			printf -v row "$row\t%3d ${fgc}hello${bgc}world\e[0m"  $color;
			color=$(($color + $rows));
			((c++));
		done
		echo "$row"
		((r++));
	done
}

echo
echo "ANSI 16"
colorblock 0 16 8


echo
echo "ANSI 256 Grayscale"
colorblock 232 256 8

echo
echo "ANSI 256"
colorblock 16 232 6
