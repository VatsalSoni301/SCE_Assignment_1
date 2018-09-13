for arg in $@
do
	compFile=$arg
	break
done
ext=`echo "$compFile" | cut -d'.' -f2,3` 

if [ -e $compFile ]
then
	case $ext in
	"tar.bz2") tar -xjvf $compFile;;
	"tar") tar -xvf $compFile;;
	"tar.gz") tar -xzvf $compFile;;
	"zip") unzip $compFile;;
	"gzip") gzip -dr $compFile;;
	"bz2") bzip2 -d $compFile;;
	"7z") 7z x $compFile;;
	*) echo "Not Valid";;
esac
else
	echo "File does not exist"
fi
