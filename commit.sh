begin=$(expr $(cat ./begin) + 86400) # init: 972576000
end=$(date '+%s')

list=$(seq $begin 86400 $end)

for i in $list
do
    date --date=@$i '+%Y-%m-%d: +1s' >> ./README.md
    echo >> ./README.md

    echo $i > ./begin

    git add ./README.md
    git add ./begin
    export GIT_AUTHOR_DATE="$i"
    export GIT_COMMITTER_DATE="$i"
    git commit --message='+1s' -q
done

git push origin master
