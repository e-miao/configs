#!/bin/bash

#  ips 
ip_arr=(hd101 hd102 hd103)

cmds=$*
echo "cmd=[$cmds]"

for ip in ${ip_arr[@]}
do
    cmd="ssh root@${ip} \"${cmds}\""
    eval $cmd
done