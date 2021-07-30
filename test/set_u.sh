#!/bin/bash

set -e
#-e	任何语句的执行结果不是true则应该退出shell
function set_e1() {
    function return0() { return 0; }
    function return1() { return 1; }
    return1
    echo "添加set -e 后，此echo不会输出"
    }

function set_e2() {
    function return20() { return 0; }
    function return21() { return 1; }

    #可以如下判断 方法1
    return21  && ( echo "command success";echo "command success1";)
    #注意 A && B || C 不是 if-then-else。当 A 为真时，B为假时，C 可能会运行。
    return20 && return21 ||  ( echo "command failed";echo "command failed1";)

    #方法2
    if return21 ; then
        echo "command success";
    else
         echo "command failed";
    fi
    }

#set_e2
set_e1

