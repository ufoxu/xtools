#!/bin/bash

set -e -u
set -o pipefail

#-------------------------------------------------------------------------
#设置变量默认值，参数默认值, 自动赋值
#word="Old Word"
#declare null_src
#kon_src=
#- 变量为null,  使用默认值 echo ${name-yjx}
#echo ${word-"New Word"}        #Old Word
#echo ${word}                   #Old Word
#echo ${null_src-"New Word"}    #New Word
#echo ${null_src}               #null_src: unbound variable
#echo ${kon_src-"New Word"}      #空
#echo ${kon_src}                 #空

#= 变量为null时, 使用默认值，同时改变变量值
#echo ${word="New Word"}        #Old Word
#echo ${word}                   #Old Word
#echo ${null_src="New Word"}    #New Word
#echo ${null_src}               #New Word


#:- 变量为null或空字符串使用默认值  不改变变量值
#echo ${word:- "New Word"}       #Old Word
#echo ${word}                    #Old Word
#echo ${null_src:- "New Word"}   #New Word
##echo ${null_src}               #null_src: unbound variable
#echo ${kon_src:- "New Word"}    #New Word
#echo ${kon_src}                 #空

#:+ 变量不为空时使用默认值 不改变变量值 （与 :- 相反）
#echo ${word:+ "New Word"}       #New Word
#echo ${word}                    #Old Word
#echo ${null_src:+ "New Word"}   #空
##echo ${null_src}               #null_src: unbound variable
#echo ${kon_src:+ "New Word"}    #空
#echo ${kon_src}                 #空

##:= 变量为null或空字符串, 同时改变变量值
#echo ${word:= "New Word"}       #Old Word
#echo ${word}                    #Old Word
#echo ${null_src:= "New Word"}   #New Word
#echo ${null_src}                #New Word
#echo ${kon_src:= "New Word"}    #New Word
#echo ${kon_src}                 #New Word


#:? 变量为null 或 空字符串时打印错误信息word, 并退出
#echo ${word:? "New Word"}       #Old Word
#echo ${word}                    #Old Word
#echo ${null_src:? "New Word"}  #null_src:  New Word
#echo ${null_src}               #null_src: unbound variable
#echo ${kon_src:? "New Word"}   #kon_src:  New Word

#-------------------------------------------------------------------------
word="AbCdEfG HiJkLmN"
echo ${word^}                   #字符^意思是将第一个字符转换成大写字母，^^的意思是将所有的字符转换成大写字母。
echo ${word^^}
echo ${word,}                   #字符,意思是将第一个字符转换成小写字母，,,的意思是将所有的字符转换成小写字母。
echo ${word,,}

#-------------------------------------------------------------------------
#${parameter#word}	从头开始删除最短匹配word模式的内容后返回
#${parameter##word}	从头开始删除最长匹配word模式的内容后返回
#${parameter%word}	从尾开始删除最短匹配word模式的内容后返回
#${parameter%%word}	从尾开始删除最长匹配word模式的内容后返回