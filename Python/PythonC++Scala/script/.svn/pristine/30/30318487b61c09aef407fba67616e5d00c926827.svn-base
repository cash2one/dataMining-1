#!/bin/bash

sh ./install_needed_package.sh
sh ./open_nrpe_port.sh

echo 'install nagios client'
installPath=`pwd`
nagios_server_ip=223.4.216.246
nagios_path=/usr/local/nagios
nrpecfg=${nagios_path}/etc/nrpe.cfg
commandTmpFile=/tmp/nrpe_command.cfg.tmp

# remove the nagios if exist
rm -rf $nagios_path
rm -f $commandTmpFile
cp ./nrpe_command.cfg $commandTmpFile

# check if the nagios user exist
if [ `grep "nagios" /etc/passwd` ] ; then
	echo "WARNING:::nagios user already existed"
else
	echo "adding nagios user"
	groupadd nagios
	useradd nagios -g nagios
fi


if [ -e $nagios_path ] ; then
	echo 'ERROR:::nagios alreaady installed'
	exit 1
else

	# download and install nagios-plugins
	cd /usr/local/src/
	if [ ! -e ./nagios-plugins-1.4.15.tar.gz ] ; then
		wget http://sourceforge.net/projects/nagiosplug/files/nagiosplug/1.4.15/nagios-plugins-1.4.15.tar.gz
	fi
	echo "installing nagios-plugins"
	tar -zxvf nagios-plugins-1.4.15.tar.gz
	cd /usr/local/src/nagios-plugins-1.4.15
	./configure
	make
	make install
	chown nagios.nagios $nagios_path
	
	# download and install nrpe
	cd /usr/local/src
	echo "installing nagios-nrpe"
	if [ ! -e ./nrpe-2.13.tar.gz ] ; then
		wget http://prdownloads.sourceforge.net/sourceforge/nagios/nrpe-2.13.tar.gz
	fi
	tar -zxvf nrpe-2.13.tar.gz
	cd /usr/local/src/nrpe-2.13
	./configure
	make all
	make install-plugin
	make install-daemon
	make install-daemon-config
	echo 'make done*********************************************************************************************************************************************************************************************************************************'
fi

echo 'change nagios's configure file
a=''
for i in `df|grep ^/dev|awk '{print $6}'`
do
        if [ "$a" = '' ] ; then
                a=${a}${i}
        else
                a=${a}","${i}
        fi  

done 
sed -i "s#diskmountpointneedchecked#$a#" $commandTmpFile
a=''
for i in `df|grep ^/dev|awk '{print $1}'`
do
        i=`echo $i |awk 'BEGIN {FS="/"} {print $3}'`
        if [ "$a" = '' ] ; then
                a=${a}${i}
        else
                a=${a}","${i}
        fi  

done 
sed -i "s#diskneedchecked#$a#" $commandTmpFile


echo "adding nagios server's ip to $nrpecfg"
if [ `grep "$nagios_server_ip" $nrpecfg` ] ; then
	echo "$nagios_server_ip already existed in $nrpecfg"
else
	sed -i "s/allowed_hosts.*/&,$nagios_server_ip/" $nrpecfg
fi

cat $commandTmpFile>>$nrpecfg
rm -f $commandTmpFile

echo 'check if Sys-Statistics-Linux installed'
tmp="`locate Statistics|grep perl.*Statistics$`"
if [ "$tmp" = '' ] ; then
        echo 'install Syst-Statistic-Linux'
        cd /usr/local/src/
        if [ ! -e ./Sys-Statistics-Linux-0.66.tar.gz ] ; then
                wget http://search.cpan.org/CPAN/authors/id/B/BL/BLOONIX/Sys-Statistics-Linux-0.66.tar.gz
        fi  
        tar -zxf Sys-Statistics-Linux-0.66.tar.gz
        cd Sys-Statistics-Linux-0.66    
        perl Makefile.PL
        make test
        make install
fi

cp ${installPath}'/check_linux_stats.pl' ${nagios_path}/libexec/
chmod 755 ${nagios_path}/libexec/check_linux_stats.pl

sh ${installPath}/autorun_nrpe.sh
echo '************************************************************'
echo '***********               test           *******************'
/usr/local/nagios/bin/nrpe -c /usr/local/nagios/etc/nrpe.cfg -d
/usr/local/nagios/libexec/check_nrpe -H 127.0.0.1
echo 'if you see "NRPE v2.13" , you have successfully installed NRPE'
echo '*************************************************************'
exit 0
