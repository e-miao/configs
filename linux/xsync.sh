#!/bin/bash

#  ips 
ip_arr=(hd101 hd102 hd103)

files=$1
fname=`basename $1`

pre_path=`cd -P $(dirname $files); pwd`

echo "pre_path=$pre_path; fname=$fname"
pwd_path=`pwd`
target_path=''
if [[ $files == /* ]];then
    echo "全路径"
    target_path=${files}
elif [[ $files == ./* ]];then
    echo "非全路径./"
    file_name=${files/.\//}
    if [[ -f $files ]];then
        file_name=${files/./}
    else
        file_name=${files/.\//}
    fi
    target_path="${pwd_path}${file_name}"
else
    echo "非全路径"
    target_path="${pwd_path}/${files}"
fi


for ip in ${ip_arr[@]}
do
    cmd="rsync -rvl ${pre_path}/${fname} root@${ip}:${pre_path}"
    echo $cmd
done