#!/bin/bash

# 关闭防火墙
systemctl stop firewalld
systemctl disable firewalld

# 时区设置
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 时间同步
yum -y install ntp vim git curl wget 
systemctl enable ntpd
systemctl start ntpd