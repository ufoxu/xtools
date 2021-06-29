#!/bin/bash
# TODO: 脚本锁
# TODO: 日志 格式化输出
# TODO 判断脚本名


# Use this
if [[ "${my_var}" == "val" ]]; then
  do_something
fi

if (( my_var > 3 )); then
  do_something
fi

if [[ "${my_var}" -gt 3 ]]; then
  do_something
fi
# Instead of this
if [[ "${my_var}" = "val" ]]; then
  do_something
fi

# Probably unintended lexicographical comparison.
if [[ "${my_var}" > 3 ]]; then
  # True for 4, false for 22.
  do_something
fi


#脚本名字检查
#括号两端必须要有空格
#-a/-o 和[ ] 搭配使用，变量带引号，  &&/ || 和 [[ ]] 搭配使用

echo ${0##*/} # 拿掉最后一条/及其左边的字串
#echo ${0#*/} # 拿掉第一条/及其左边的字串
#echo ${0%.*} #拿掉最后一个.及其右边的字串
echo "${_:-''}" #拿到前面一个命令的最后一个参数
#echo $(basename  "${BASH_SOURCE[0]}") #文件名
#============================================================================
if [[ ${0##*/} == ${WT_TOOL} ]] || [ "${0##*/}" == "bash"  -a "${_:-""}" = "$0" ]; then
  # run
  main "${@:-""}"
fi
