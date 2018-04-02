#! /bin/sh
# jbc labs generic golang build script

#Log everything in /code/build.log
logfile=/tmp/build.log
exec > $logfile 2>&1
set -x

mkdir -p /go/src/app
cp -rf /code/* /go/src/app
cd /go/src/app

go-wrapper download
go-wrapper install
