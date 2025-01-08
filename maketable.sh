
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
            echo "- $repo" # >> $FILE
            #echo "Found"
        # else
            
            #echo "no $repo" # >> $FILE
            #echo "Not Found"
        fi && cd ../..
    done
done
