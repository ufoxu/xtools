#!/bin/bash

# 获取文件路径
# update:
#  2021.0730 basic version

function getopts_test() {
    while getopts ":vpr" opt; do
        case "${opt}" in
            v)    echo ${opt} ${OPTARG};    ;;
            t)    echo ${opt} ${OPTARG};    ;;
            p)    echo ${opt} ;             ;;
            h|*)  echo "--help" ${opt} ${OPTARG};            ;;
        esac
    done
    shift $[$OPTIND-1]  #移除已处理参数个数,方便额外参数使用
}
#TODO