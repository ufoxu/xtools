#!/bin/bash

set -e -u
set -o pipefail

#脚本路径
#${BASH_SOURCE[0]}表示bash脚本的第一个参数
declare -r SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) #获得当前脚本绝对路径，一般使用此目录
declare -r SCRIPT_NAME=$(basename  "${BASH_SOURCE[0]}")  #脚本名
declare -r WORK_DIR=$(dirname "$0") #如果此脚本被其他脚本调用，此时获得的是其他脚本的绝对路径
declare -r SCRIPT_READLINk_DIR=$(dirname $(readlink -f ${BASH_SOURCE[0]})) #如果有链接，获得其真实路径


echo ${SCRIPT_DIR}
echo ${SCRIPT_NAME}
echo ${WORK_DIR}
echo ${SCRIPT_READLINk_DIR}


