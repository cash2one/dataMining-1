#! /bin/bash

linuxVersion=`cat /etc/issue|awk 'BEGIN {FS=" "} {print $1}'`

if [ "Ubuntu" = "$linuxVersion" ] ; then
	echo 'You linux version is Ubuntu'
	installCommand='apt-get'
	$installCommand -y install make gcc libssl-dev
	ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/libssl.so
else
	echo 'You linux version is Centos'
	installCommand='yum'
	$installCommand -y install make,gcc,openssl
fi
