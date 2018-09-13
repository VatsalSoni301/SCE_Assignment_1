t_y=$(tput cols)
t_x=$(tput lines)
echo $t_x
echo $t_y

((x = t_x / 2 ))
((y = t_y / 2 ))

echo $x
echo $y
tput clear
tput cup $x $y

declare -A arr
for ((i=0;i<t_x;i++))
do
	for ((j=0;j<t_y;j++))
	do
		arr[$i,$j]=0;
	done
done
p=1
qq=0
r=0
s=0
a=1
while [ $a == 1 ]
do 
	while [ $a == 1 ]
	do
		read -t 1 -r -sn1 key
		if [ $x == 0 ] || [ $x == $t_x ]
		then
			for ((i=0;i<t_x;i++))
			do
				for ((j=0;j<t_y;j++))
				do
					arr[$i,$j]=0;
				done
			done
			p=1
			qq=0
			r=0
			s=0
			tput clear
			((x = t_x / 2 ))
			((y = t_y / 2 ))
			tput cup $x $y
		fi
		if [ $y == 0 ] || [ $y == $t_y ]
		then
			for ((i=0;i<t_x;i++))
			do
				for ((j=0;j<t_y;j++))
				do
					arr[$i,$j]=0;
				done
			done
			p=1
			qq=0
			r=0
			s=0
			((x = t_x / 2 ))
			((y = t_y / 2 ))
			tput clear
			tput cup $x $y
		fi
		if [ -z $key ]
		then
			if [ $p == 1 ]
			then
				((x=$x-1));
				if [ "${arr[$x,$y]}" == "1" ]
				then
					for ((i=0;i<t_x;i++))
					do
						for ((j=0;j<t_y;j++))
						do
							arr[$i,$j]=0;
						done
					done
					p=1
					qq=0
					r=0
					s=0
					((x = t_x / 2 ))
					((y = t_y / 2 ))
					tput clear
					tput cup $x $y
				else
					tput cup $x $y
					arr[$x,$y]=1
					let "q=$RANDOM % 256"
					echo -en "\e[38;5;${q}m* \e[0m";
				fi
			elif [ $qq == 1 ]
			then
				((x=$x+1));
				if [ "${arr[$x,$y]}" == "1" ]
				then
					for ((i=0;i<t_x;i++))
					do
						for ((j=0;j<t_y;j++))
						do
							arr[$i,$j]=0;
						done
					done
				p=1
				qq=0
				r=0
				s=0
				((x = t_x / 2 ))
				((y = t_y / 2 ))
				tput clear
				tput cup $x $y
				else
					tput cup $x $y
					arr[$x,$y]=1
					let "q=$RANDOM % 256"
					echo -en "\e[38;5;${q}m* \e[0m";
				fi
			elif [ $r == 1 ]
			then
				((y=$y+1));
				if [ "${arr[$x,$y]}" == "1" ]
				then
					for ((i=0;i<t_x;i++))
				do
					for ((j=0;j<t_y;j++))
					do
						arr[$i,$j]=0;
					done
				done
				p=1
				qq=0
				r=0
				s=0
				((x = t_x / 2 ))
				((y = t_y / 2 ))
				tput clear
				tput cup $x $y
				else
					tput cup $x $y
					arr[$x,$y]=1
					let "q=$RANDOM % 256"
					echo -en "\e[38;5;${q}m*\e[0m";
				fi
			elif [ $s == 1 ]
			then
				((y=$y-1));
				if [ "${arr[$x,$y]}" == "1" ]
				then
					for ((i=0;i<t_x;i++))
				do
					for ((j=0;j<t_y;j++))
					do
						arr[$i,$j]=0;
					done
				done
				p=1
				qq=0
				r=0
				s=0
				((x = t_x / 2 ))
				((y = t_y / 2 ))
				tput clear
				tput cup $x $y
				else
					tput cup $x $y
					arr[$x,$y]=1
					let "q=$RANDOM % 256"
					echo -en "\e[38;5;${q}m*\e[0m";
				fi
			fi
		fi
		case "$key" in
	    A) ((x=$x-1))
			tput cup $x $y
			p=1
			qq=0
			r=0
			s=0
			if [ "${arr[$x,$y]}" == "1" ]
			then
				for ((i=0;i<t_x;i++))
				do
					for ((j=0;j<t_y;j++))
					do
						arr[$i,$j]=0;
					done
				done
				p=1
				qq=0
				r=0
				s=0
				((x = t_x / 2 ))
				((y = t_y / 2 ))
				tput clear
				tput cup $x $y
			else
				arr[$x,$y]=1
				let "q=$RANDOM % 256"
				echo -en "\e[38;5;${q}m*\e[0m";
			fi
			;;
	    B) ((x=$x+1))
			p=0
			qq=1
			r=0
			s=0
			tput cup $x $y
			if [ "${arr[$x,$y]}" == "1" ]
			then
				for ((i=0;i<t_x;i++))
				do
					for ((j=0;j<t_y;j++))
					do
						arr[$i,$j]=0;
					done
				done
				p=1
				qq=0
				r=0
				s=0
				((x = t_x / 2 ))
				((y = t_y / 2 ))
				tput clear
				tput cup $x $y
			else
				arr[$x,$y]=1
				let "q=$RANDOM % 256"
				echo -en "\e[38;5;${q}m*\e[0m";
			fi
			;;
		C) ((y=$y+1))
			tput cup $x $y
			p=0
			qq=0
			r=1
			s=0
			if [ "${arr[$x,$y]}" == "1" ]
			then
				for ((i=0;i<t_x;i++))
				do
					for ((j=0;j<t_y;j++))
					do
						arr[$i,$j]=0;
					done
				done
				p=1
				qq=0
				r=0
				s=0
				((x = t_x / 2 ))
				((y = t_y / 2 ))
				tput clear
				tput cup $x $y
			else
				arr[$x,$y]=1
				let "q=$RANDOM % 256"
				echo -en "\e[38;5;${q}m*\e[0m";
			fi
			;;
		D) ((y=$y-1))
			tput cup $x $y
			p=0
			qq=0
			r=0
			s=1
			if [ "${arr[$x,$y]}" == "1" ]
			then
				for ((i=0;i<t_x;i++))
				do
					for ((j=0;j<t_y;j++))
					do
						arr[$i,$j]=0;
					done
				done
				p=1
				qq=0
				r=0
				s=0
				((x = t_x / 2 ))
				((y = t_y / 2 ))
				tput clear
				tput cup $x $y
			else
				arr[$x,$y]=1
				let "q=$RANDOM % 256"
				echo -en "\e[38;5;${q}m*\e[0m";
			fi
			;;
	esac
	done
done