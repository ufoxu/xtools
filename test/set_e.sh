#!/bin/bash

set -u
#-u	当执行时使用到未定义过的变量，则显示错误信息
#--------------列如-----------

function set_u() {
    declare -r my=''  #需要提前定义 my: unbound variable
    [[ -n $my ]] &&  echo "True"  ||  echo "False"
}

set_u