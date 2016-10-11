#!/bin/sh

git pull origin master
cd .atom/ && apm install --packages-file packagelist
