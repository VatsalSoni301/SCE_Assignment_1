awk '{if($2=="M"){print $0}}' marks.txt > male.txt
awk '{if($2=="F"){print $0}}' marks.txt > female.txt