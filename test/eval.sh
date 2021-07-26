#!/bin/bash

set -e -u
set -o pipefail

#eval 重复了1次命令行参数传递过程，纯粹地执行命令的命令
echo "| user: $(eval  $(which whoami))"


cmd="id | cut -f1 -d ' '"
output=$(eval ${cmd})   #执行命令的命令
echo ${output}

#$(${cmd})  #执行字符串的命令, 跳过了管道分析，于是"|", "cut", "-f1", "-d"都变成了id命令的参数，

a=$(id | cut -f1 -d ' ')
echo ${a}