#!/bin/sh

git pull origin master
if [ `which apm` ]; then
	cd .atom/ && apm install --packages-file packagelist
fi
