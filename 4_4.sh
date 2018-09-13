i=0
for arg in $@
do
	arr[i]=$arg
	((i=$i+1))
done
count=${#arr[@]}
source=${arr[0]}
if [ $count -gt 1 ]
then
if [ -d $source ]
then
	j=1
	if [ "${arr[1]}" = "all" ]
	then
		for ext in $(ls $source)
		do
			arr[j]=$(sed -n 's/\(.*\)\.\(.*\)/\2/p' <<< $ext)
			x=$source${arr[j]}
			$(mkdir $x 2> /dev/null)
			((j=$j+1))
		done
		count=${#arr[@]}
	else
		for ((j=1;j<count;j++))
		do
			x=$source${arr[j]}
			$(mkdir $x 2> /dev/null)
		done
	fi
	for i in $(ls $source)
	do
		for ((j=1;j<count;j++))
		do
			if [[ $i =~ .*\.${arr[j]} ]]
			then
				x=$source${arr[j]}
				k=$source$i
				$(mv $k $x 2> /dev/null)
			fi
		done
	done
else
echo "Invalid directory" 
fi
else
	echo "2 argument required"
fi
