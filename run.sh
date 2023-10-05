git add .
echo 本次提交日志是 $1
echo 如有问题 请加--amend进行修改
git commit -m "$1"
git push