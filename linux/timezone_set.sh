#!/bin/bash

cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

yum -y install ntp

systemctl enable ntpd
systemctl start ntpd
