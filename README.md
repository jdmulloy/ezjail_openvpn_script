# ezjail_openvpn_script
Shell script to restart openvpn FreeBSD ezjail if tun device goes away. When
openvpn shutsdown it destroys the tun interface. Since a FreeBSD jail can't
create a tun device you have to restart the jail. This script will detect
this condition and restart the jail if it's running but tun0 has gone away.

# Automatically create tun device on jail start
I put the following into the jail's config file to automatically create/start
then tun device when the jail starts.

    export jail_openvpn_exec_prestart0="ifconfig tun0 10.3.1.1 10.3.1.2 netmask 255.255.255.255"
    export jail_openvpn_exec_prestart1="route add -net 10.3.1.0/24 10.3.1.2"

# cron
I use the following entry in cron to run the script.

    * * * * * /l/bin/fix_tun0.sh
