awk 'BEGIN{count=0}
{
flag=0;
for(i=0;i<count;i++)
{
if(arr[i]==$0)
{
flag=1;
}
}
if(flag==0)
{
arr[count]=$0
count=count+1;
print $0
}
}'