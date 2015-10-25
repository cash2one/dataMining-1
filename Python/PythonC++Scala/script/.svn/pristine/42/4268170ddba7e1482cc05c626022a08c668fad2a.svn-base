#! /bin/bash

echo 'add nrpe to auto run while linux start'
rcLocalFile='/etc/rc.local'
tmp=`grep nrpe $rcLocalFile`
if [  "" = "$tmp" ] ; then
	sed -i '13i /usr/local/nagios/bin/nrpe -c /usr/local/nagios/etc/nrpe.cfg -d' $rcLocalFile
fi
