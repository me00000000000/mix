#!/bin/sh

if test $(basename $0) == "install.sh"
then
	{
		cp -v mix /usr/bin/
		cp -v mix-lite /usr/bin/
		cp -v mix-paranoid /usr/bin/
		cp -v mix-dump /usr/bin/
		chmod +x /usr/bin/mix
		chmod +x /usr/bin/mix-lite
		chmod +x /usr/bin/mix-paranoid
		chmod +x /usr/bin/mix-dump
	} && {
		echo "successfully installed mix"
	}
else
	{
		rm -v /usr/bin/mix 
		rm -v /usr/bin/mix-lite 
		rm -v /usr/bin/mix-paranoid
		rm -v /usr/bin/mix-dump
	} && {
		echo "successfully removed mix"
	}
fi
