#!/bin/bash
# centos7 设置静态IP脚本
device=$1
ip_addr=$2

if [[ $device == '' || $ip_addr == '' ]];then
    echo "device and ip_addr is must!!! ,need input.\n eg: xxx.sh enp0s3 192.168.1.100 "
    exit 1
fi 

gateway=''
getGateWay(){
    ipaddr=$1
    gw=''
    ipsarr=(${ipaddr//./ })
    x=0
    for iptmp in ${ipsarr[@]};do
        ((++x))
        if [[ $x -le 3 ]];then
            # echo "x=$x; $iptmp"
            gw="$gw${iptmp}."
        fi
    done
    gateway="${gw}1"
}
getGateWay $ip_addr

device_uuid=`uuidgen ${device}`


ipconfig="/etc/sysconfig/network-scripts/ifcfg-${device}"

echo "ipconfig=${ipconfig}"

cat > ${ipconfig} <<EOF
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=static
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=${device}
UUID=${device_uuid}
DEVICE=${device}
ONBOOT=yes
IPADDR=${ip_addr}
NETMASK=255.255.255.0
GATEWAY=${gateway}
DNS1=${gateway}
DNS2=114.114.114.114
EOF


cat $ipconfig
service network restart

ifconfig