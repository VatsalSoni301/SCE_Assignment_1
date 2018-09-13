read -s var
count=${#var}
num=0
punct=0
small=0
if [ $count -lt 8 ]
then 
	echo "password must be of greater than 8 length"
else
for ((i=0;i<count;i++))
do
	arr[i]=${var:i:1}
done
for ((i=0;i<count;i++))
do
	if [[ "${arr[i]}" = [[:digit:]] ]]
	then
		num=1
	fi
	if [[ "${arr[i]}" = [[:punct:]\+\*\/\=] ]]
	then
		punct=1
	fi
	if [[ "${arr[i]}" = [[:alpha:]] ]]
	then
		small=1
	fi
done
if [ $num == 0 ] || [ $punct == 0 ] || [ $small == 0 ]
then
	echo "password should contain atleast one special character,alphabet and numeric"
else
	echo "password success"
fi
fi