line=`awk 'END{print "l="NR}' imdb-top-250.txt`

eval $line

awk -v ll="$l" 'BEGIN{print  "["}
{
	first=match($0,/\..*\(/);
	second=match($0,/\(/);
	third=match($0,/\)/);
	fourth=match($0,/[0-9]\.[0-9]/);
	id=substr($0,0,first);
	name=substr($0,first+2,second-first-3);
	year=substr($0,second+1,third-second-1);
	rat=substr($0,fourth,3);
	
	print "\t{"
	printf("\t\"ID\" : \"%s\" ,\n",id);
	printf("\t\"Name\" : \"%s\" ,\n",name);
	printf("\t\"Year\" : \"%s\" ,\n",year);
	printf("\t\"Rating\" : \"%s\" \n",rat);
	if(NR==ll)
	print "\t}"
	else
	print "\t},"
}
END{print "]"}
' imdb-top-250.txt > imdb-top-250.json