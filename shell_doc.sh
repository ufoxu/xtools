#!/bin/bash
# notice:This is the script template.
# arg:
# update:
#  2021.3.14 basic version

#shell-guide：https://google.github.io/styleguide/shellguide.html
#bash-reference-manual：https://www.gnu.org/software/bash/manual/html_node/index.html
#abs-guide：https://tldp.org/LDP/abs/html/
##shellcheck: https://www.shellcheck.net/
#https://github.com/koalaman/shellcheck#in-your-editor

#脚本调试
#bash -n  guide.sh 执行脚本前可以使用检查语法结构。
set -e -u
#set在声明函数之前，只能包含、声明和设置常量。
#-e	任何语句的执行结果不是true则应该退出shell
#-u	当执行时使用到未定义过的变量，则显示错误信息
#--------------列如-----------
function set_e() {
    function return0() {
        return 0
    }

    function return1() {
        return 1
    }
    return1

    echo $?  #程序已经退出了，这样就不能使用$?, 因为返回值不能非零。
    #可以如下
    return1  && ( echo "command success";echo "command success1";) \
    ||  ( echo "command failed";echo "command failed1";)  #：命令不要过长
    #注意 A && B || C 不是 if-then-else。当 A 为真时，B为假时，C 可能会运行。
    return0 && return1 ||  ( echo "command failed";echo "command failed1";)
    if return1 ; then
        echo "command success";
    else
         echo "command failed";
    fi
    }

function set_u() {
    declare -r my=''  #需要提前定义 my: unbound variable
    [[ -n $my ]] &&  echo "True"  ||  echo "False"
}

#set_e #测试时打开
#set_u #测试时打开
#--------------end------------
set -o pipefail
#使用管道执行多个命令，只要有任何一个命令返回非0值，则整个管道返回非0值
#--------------列如-----------
function set_o() {
    ls ./a.txt |echo "hi" >/dev/null #a.txt 不存在 ，如果添加 set -o pipefail 脚本到这里就结束了
    echo $?  #如果不添加 set -o pipefail  上条命令报错后继续执行，这里$?的值为0，
    echo "command"
}
#set_o  测试时打开
#--------------end------------

DEBUG=''
#DEBUG='True'
[[ -n $DEBUG ]] && set -x
#判断空字符
#-z 判断变量值是否为空，且字符串长度不为零，则为True。
#-n 判断变量值是否为空，且字符串长度为零，则为True。
#--------------列如-----------
function if_exsit() {
    declare  a  #直接使用会报错a: unbound variable，需要先赋值
    declare -r b=''
    declare -r c=
    declare -r d=1
    [[ -n $b ]] &&  echo "True"  ||  echo "False"   #False,长度为零
    [[ -n $c ]] &&  echo "True"  ||  echo "False"   #False,长度为零
    [[ -n $d ]] &&  echo "True"  ||  echo "False"   #True
    [[ -z $b ]] &&  echo "True"  ||  echo "False"   #True
    [[ -z $c ]] &&  echo "True"  ||  echo "False"   #True
    [[ -z $d ]] &&  echo "True"  ||  echo "False"   #False
}

#if_exsit #测试时打开
#--------------end------------
#set -x对整个脚本生效 具体执行过程打印，其中变量名被替换
#bash -x index.sh 等同执行效果
#export LANG='zh_CN.UTF-8'

#脚本路径
#${BASH_SOURCE[0]}表示bash脚本的第一个参数
declare -r SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) #获得当前脚本绝对路径，一般使用此目录
declare -r SCRIPT_NAME=$(basename  "${BASH_SOURCE[0]}")  #脚本名
declare -r WORK_DIR=$(dirname "$0") #如果此脚本被其他脚本调用，此时获得是其他脚本的绝对路径
declare -r SCRIPT_READLINk_DIR=$(dirname $(readlink -f ${BASH_SOURCE[0]})) #如果有链接，获得其真实路径
echo "|++++++++++++++++|"
echo "| script path:${SCRIPT_DIR}"
#打印当前用户
echo "| user: $(eval  $(which whoami))"
#echo ${USER} 可能会被覆盖
#不同的环境，命令路径可能不一致，
echo "|++++++++++++++++|"


#开始
#定义脚本名
WT_TOOL='shell.sh'

echo "script: ${SCRIPT_NAME} ${@:-""} start"
# ${@:-"}  是 ${parameter:-word} 设置默认值

exec 2>&1 #将stdout 和 stderr 合并输出
function main() {
    local arg=$1
    echo "arg ${arg}"
}

main "${@:-""}"


echo "script: ${SCRIPT_NAME} ${@:-""} success"





