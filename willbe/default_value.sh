#!/bin/bash

set -e -u
set -o pipefail


#设置变量默认值，参数默认值, 自动赋值
#- 变量为null,  使用默认值 echo ${name-yjx}
#= 变量为null时, 使用默认值，同时改变变量值
#:- 变量为null或空字符串，使用默认值
#:= 变量为null或空字符串, 同时改变变量值
#:? 变量为null 或 空字符串时报错并退出
#:+ 变量不为空时使用默认值 （与 :- 相反）

#${parameter:-word} 设置默认值
#${parameter:+word} 为null或未设置，则不替换任何内容，否则替换word的扩展名
#${parameter^pattern} 这 '^'运算符将匹配模式的小写字母转换 为大写；这 '，'运算符将匹配的大写字母转换为小写字母
#${parameter^^pattern}
#${parameter,pattern}
#${parameter,,pattern}
#${parameter@L} 是一个字符串，它是将大写字母字符转换为小写字母的参数的值
#a=${b:-$c}