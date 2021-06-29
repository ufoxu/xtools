#!/bin/bash
# notice:This is the script template.
# arg:
# update:
#  2021.3.14 basic version

set -e -u
set -o pipefail

DEBUG=''
#DEBUG='True'
[[ -n $DEBUG ]] && set -x

declare -r SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
declare -r SCRIPT_NAME=$(basename  "${BASH_SOURCE[0]}")

echo "|++++++++++++++++|"
echo "| script path:${SCRIPT_DIR}"
echo "| user: $(eval $(which whoami))"
echo "|++++++++++++++++|"

#定义脚本名
WT_TOOL='shell.sh'
exec 2>&1

function main() {
    local arg=$1
    echo "arg ${arg}"
}

main "${@:-""}"
echo "script: ${SCRIPT_NAME} ${*:-""} success"





