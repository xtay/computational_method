for name in `ls *.m`
do
    iconv -f utf8 -t gb18030 $name > ./gbk/$name
done
