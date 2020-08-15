#!/bin/bash

export HOST_IP=`/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v 172.|grep -v inet6|awk '{print $2}'|tr -d "addr:"`

echo "当前主机IP: ${HOST_IP}"

envsubst < ./docker-compose-template.yml > ./docker-compose.yml
envsubst < ./logstash-local-template.conf > ./logstash-local.conf


docker-compose up -f ./docker-compose.yml -d
echo "启动成功"