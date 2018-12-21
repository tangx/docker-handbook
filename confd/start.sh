#!/bin/bash
#

cd $(dirname $0)

confdir=$(pwd)
confd -confdir $confdir  -interval 1 -backend file -file yaml/myapp-nginx.yaml

