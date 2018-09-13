avv=`awk 'BEGIN{
	total1=0;
	sum=0;
	count=0
}
{
	if(NR>1)
		{
			total=$3+$4+$5;
			sum=sum+total;
			if(total>total1)
				{
					name=$1;
					total1=total;
				}
				count=count+1
			}
		}
		END{
			print "n="name
			avg=sum/count;
			print "z="avg
		}' marks.txt`

eval $avv
awk -v av="$z" -v nn="$n" 'BEGIN{print "topper is "nn}
{
	if(NR>1)
		{
			total=$3+$4+$5
			if(total>=av)
				{
					print $1
				}
		}
		}' marks.txt