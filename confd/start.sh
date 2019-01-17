#!/bin/bash
#

cd $(dirname $0)

confdir=$(pwd)

## file
confd -confdir $confdir  -interval 1 -backend file -file yaml/nginx.yaml

## redis
# confd -confdir $confdir  -interval 1 -backend redis -node ${redis_host_string}:${redis_port_int}/${db_int} -client-key p4FUvg9wm

