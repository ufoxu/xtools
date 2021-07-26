#!/bin/bash

set -e -u
set -o pipefail

DEBUG=''
#DEBUG='True'
[[ -n $DEBUG ]] && set -x
#判断空字符
#-n 判断变量值赋值，且字符串长度不为零，则为True。
#-z 判断变量值赋值，且字符串长度不为零，则为False。
#--------------列如-----------
function if_exsit() {
    declare -r b=''
    declare -r c=
    declare -r d=1
    declare -r e=0
    declare -r f="0"
    [[ -n $b ]] &&  echo "True"  ||  echo "False"   #False,长度为零
    [[ -n $c ]] &&  echo "True"  ||  echo "False"   #False,长度为零
    [[ -n $d ]] &&  echo "True"  ||  echo "False"   #True
    [[ -n $e ]] &&  echo "True"  ||  echo "False"   #True
    [[ -n $f ]] &&  echo "True"  ||  echo "False"   #True


    [[ -z $b ]] &&  echo "True"  ||  echo "False"   #True
    [[ -z $c ]] &&  echo "True"  ||  echo "False"   #True
    [[ -z $d ]] &&  echo "True"  ||  echo "False"   #False
    [[ -z $e ]] &&  echo "True"  ||  echo "False"   #False
    [[ -z $f ]] &&  echo "True"  ||  echo "False"   #False
}

if_exsit