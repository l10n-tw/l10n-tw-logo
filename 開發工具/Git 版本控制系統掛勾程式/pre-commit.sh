#!/usr/bin/env bash
# 上列為宣告執行 script 程式用的殼程式(shell)的 shebang
# precommit.sh - 提交版本前檢查程式
# Ｖ字龍 <Vdragon.Taiwan@gmail.com> © 2016

######## Included files ########

######## Included files ended ########

######## File scope variable definitions ########
# Defensive Bash Programming - not-overridable primitive definitions
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
readonly PROGRAM_FILENAME="$(basename "$0")"
readonly PROGRAM_DIRECTORY="$(realpath --no-symlinks "$(dirname "$0")")"
readonly PROGRAM_ARGUMENT_ORIGINAL_LIST="$@"
readonly PROGRAM_ARGUMENT_ORIGINAL_NUMBER=$#

######## File scope variable definitions ended ########

######## Program ########
# Defensive Bash Programming - main function, program entry point
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
main() {
	declare shell_script_validator_return_value=0
	declare svg_validator_return_value=0
	
	printf "專案提交版本前掛勾程式：檢查 shell script 語法……\n"
	find . -path './.git/*' -prune -o -name "*.sh" -print0 | xargs --null --max-args=1 bash -n
	shell_script_validator_return_value=$?
	
	printf "專案提交版本前掛勾程式：檢查 SVG 語法……\n"
	find . -path './建構中間產物/*' -prune -o -path './.git/*' -prune -o -name "*.svg" -print0 | xargs --null --max-args=1 xmlstarlet validate --well-formed --err
	svg_validator_return_value=$?
	
	if [ $shell_script_validator_return_value -ne 0 -o $svg_validator_return_value -ne 0 ]; then
		exit 1
	else
		printf "專案提交版本前掛勾程式：語法檢查完畢。\n"
	fi
	
	## 正常結束 script 程式
	exit 0
}
main
######## Program ended ########