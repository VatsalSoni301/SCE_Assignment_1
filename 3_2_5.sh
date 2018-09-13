awk 'BEGIN{print "*** Grade Report for the ABC course ***\n";
count=0;
high=0;
low=101;
sum=0;
}
{
	if(NR>1)
		{
			total=$3+$4+$5;
			sum=sum+total;
			count=count+1;
			if(total>=95 && total<=100)
				{
					g="A"
				}
			if(total>=90 && total<95)
				{
					g="A-"
				}
			if(total>=85 && total<90)
				{
					g="B"
				}
			if(total>=80 && total<85)
				{
					g="B-"
				}
			if(total>=75 && total<80)
				{
					g="C"
				}
			if(total>=70 && total<75)
				{
					g="C-"
				}
			if(total>=60 && total<70)
				{
					g="D"
				}
			if(total<60)
				{
					g="F"
				}
				printf("%s %s\n",$1,g);
			if(high<total)
				{
					high=total
				}
				if(low>total)
					{
						low=total
					}
				}
			}
END{avg=sum/count;printf("TotalStudents = %d\nHighest = %d\nLowest = %d\nAverage = %d",count,high,low,avg);
print "\n*** End of Grade Report ***"}' marks.txt 