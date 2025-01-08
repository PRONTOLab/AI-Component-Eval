mkdir -p repos
for fn in `cat repos_unique.txt`; do
    echo "the next file is $fn"
    cd repos
    git clone "$fn" --depth 1
    cd ..
done
