#!/bin/bash

usrid="root"
IPaddr="192.168.10.10"
fpath=":/opt/testscript"

echo "$usrid@$IPaddr$fpath"
rsync -avzh ./* $usrid@$IPaddr$fpath