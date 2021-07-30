#!/bin/bash

set -e -u
set -o pipefail


exec 2>&1 #将stdout 和 stderr 合并输出
# TODO https://catonmat.net/bash-one-liners-explained-part-three