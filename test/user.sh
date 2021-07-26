#!/bin/bash

set -e -u
set -o pipefail

echo "| user: $(eval  $(which whoami))"
#echo ${USER} 可能会被覆盖
#不同的环境，命令路径可能不一致，

