#!/bin/bash

set -e -u
set -o pipefail

function getopts_test() {
    #OPTARG 就是将选项后面的参数（或者描述信息DESCPRITION）保存在这个变量当中。
        #如果某个选项（option）后面出现了冒号（":"），则表示这个选项必须有自己的参数。
        #如果没有表示接： 就是开关型选项，不需要再指定值，相当于true/false
    #OPTIND：这个表示命令行的下一个选项或参数的索引（文件名不算选项或参数）

    #当optstring以”:”开头时，getopts会区分invalid option错误和miss option argument错误。
    while getopts ":v:pt:h:" opt; do
        case "${opt}" in
            v)    echo ${opt} ${OPTARG};    ;;
            t)    echo ${opt} ${OPTARG};    ;;
            p)    echo ${opt} ;             ;;
            h|*)  echo "--help" ${opt} ${OPTARG};            ;;
        esac
    done
    shift $[$OPTIND-1]  #移除已处理参数个数,方便额外参数使用
}

#getopts_test -v vv  -p  -t tt  -h

# 可以改变顺序 缺失参数
#getopts_test -t tt
#getopts_test -t tt  -v vv  #不可以重复调用
#getopts_test -t tt  -v vv  -s ss
#t tt
#v vv
#--help s ss

##  增加参数
#getopts_test -v vv  -p  -t tt  -h -s ss
#
## 参数重复
#getopts_test -v vv  -p  -t tt  -h -s ss -v vvv
#v vv
#p
#t tt
#--help h -s

#-------------------------------------------------------------------------
#简单的接收参数
function simple_opts_test() {
    [[ "x$1" = "x-v" ]] && {
        var_name__=$2
        shift 2
    }
}

simple_opts_test -v aaa
echo  ${var_name__}


