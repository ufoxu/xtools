#!/bin/bash

# 获取文件路径


_local_ver_flag_() {
  declare -i var_flag__=0
  [ "x$1" ==  "x-v" ] && {
    var_flag__=1
    declare var_name__=$2
    shift 2  #向后移动两位
  }

}


def