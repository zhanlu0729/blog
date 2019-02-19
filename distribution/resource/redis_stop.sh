#!/bin/bash
for i in `ps -ef |grep /usr/local/bin/redis/redis-se | grep -v grep| awk '{print $2}'`;do
        kill -9 $i
done
