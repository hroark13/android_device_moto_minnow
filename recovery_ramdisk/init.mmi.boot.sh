#!/system/bin/sh

# reload UTAGS
echo 1 > /proc/config/reload

# Set barcode to ro.trackid
barcode=$(cat /proc/config/barcode/ascii 2>/dev/null)
if [ ! -z "$barcode" ]; then
    setprop ro.trackid $barcode
fi
unset barcode

# Set cust_md5 to ro.mot.cust_md5
cust_md5=$(cat /proc/config/cust_md5/ascii 2>/dev/null)
if [ ! -z "$cust_md5" ]; then
    setprop ro.mot.cust_md5 $cust_md5
fi
unset cust_md5

# Set bluetooth mac address to ro.bluetooth
bluetooth=$(grep -o "[[:alnum:]]\{2\}[:][[:alnum:]]\{2\}[:][[:alnum:]]\{2\}[:][[:alnum:]]\{2\}[:][[:alnum:]]\{2\}[:][[:alnum:]]\{2\}" /data/misc/bluedroid/bt_config.xml)
if [ ! -z "$bluetooth" ]; then
	setprop ro.bt.mac $bluetooth
else
	while [ -z "$bluetooth" ]; do
		sleep 1
		bluetooth=$(grep -o "[[:alnum:]]\{2\}[:][[:alnum:]]\{2\}[:][[:alnum:]]\{2\}[:][[:alnum:]]\{2\}[:][[:alnum:]]\{2\}[:][[:alnum:]]\{2\}" /data/misc/bluedroid/bt_config.xml)
		if [ ! -z "$bluetooth" ]; then
			setprop ro.bt.mac $bluetooth
		fi
	done
fi
unset bluetooth

# check for pstore files and copy them to the /data/dontpanic
if [ -e /sys/fs/pstore/console-ramoops ]
then
	cp /sys/fs/pstore/console-ramoops /data/dontpanic/last_kmsg
	chown root:log /data/dontpanic/last_kmsg
	chmod 0640 /data/dontpanic/last_kmsg
	if [ -e /sys/fs/pstore/annotate-ramoops ]
	then
		cat /sys/fs/pstore/annotate-ramoops >> /data/dontpanic/last_kmsg
	fi
fi

# Finish mmi boot
setprop ro.mmi_complete 1
