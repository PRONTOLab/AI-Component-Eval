
FILE="found.txt"
#echo > $FILE
for fn in `cat fns.txt`; do
    #echo "Searching for $fn"
    echo "$fn" #>> $FILE
    for repo in `ls repos`; do
        cd repos/$repo && \
        # echo "$repo"
        # pwd
        if git grep -q "$fn" ; then
            lastcommit=`git log -1 --format="%at" | xargs -I{} date -d @{} +%Y/%m`
            echo "- $repo ($lastcommit)" # >> $FILE
            #echo "Found"
        # else
            
            #echo "no $repo" # >> $FILE
            #echo "Not Found"
        fi && cd ../..
    done
done
