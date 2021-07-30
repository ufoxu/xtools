#!/bin/bash

set -o pipefail
#使用管道执行多个命令，只要有任何一个命令返回非0值，则整个管道返回非0值
function set_o() {
    ls ./a.txt ||echo "hi" 2>/dev/null #a.txt 不存在 ，如果添加 set -o pipefail 脚本到这里就结束了
    #但是命令是执行完成了，只是返回值不为0
    echo $?  #如果不添加 set -o pipefail  上条命令报错后继续执行，这里$?的值为0，
    echo "command"
}
set_o