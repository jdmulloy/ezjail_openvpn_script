#!/bin/sh
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/root/bin

TUN_DEV=tun0

if /usr/local/bin/ezjail-admin list | grep -q '^.R.*openvpn'; then
    if ! /sbin/ifconfig ${TUN_DEV} | /usr/bin/grep inet > /dev/null; then
        /usr/local/etc/rc.d/ezjail restart openvpn
    fi
fi
