#!/usr/bin/env bash
# 上列為宣告執行 script 程式用的殼程式(shell)的 shebang
# 初始化開發環境.sh - 設定好要提交本專案程式碼時必須要有的開發環境
# 林博仁 © 2016
# 如題

######## Included files ########

######## Included files ended ########

######## File scope variable definitions ########
# Defensive Bash Programming - not-overridable primitive definitions
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
readonly PROGRAM_FILENAME="$(basename "$0")"
## 考慮向前相容 Ubuntu 14.04 LTS 將 --no-symlinks 替換為 --strip
readonly PROGRAM_DIRECTORY="$(realpath --strip "$(dirname "$0")")"
readonly PROGRAM_ARGUMENT_ORIGINAL_LIST="$@"
readonly PROGRAM_ARGUMENT_ORIGINAL_NUMBER=$#

declare -r PROJECT_ROOT_DIRECTORY="${PROGRAM_DIRECTORY}"

######## File scope variable definitions ended ########

######## Program ########
# Defensive Bash Programming - main function, program entry point
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
main() {
	# 安裝專案專用 Git 設定
	# git - Is it possible to include a file in your .gitconfig - Stack Overflow
	# http://stackoverflow.com/questions/1557183/is-it-possible-to-include-a-file-in-your-gitconfig
	git --git-dir="${PROJECT_ROOT_DIRECTORY}"/.git --work-tree="${PROJECT_ROOT_DIRECTORY}" config --local include.path '../.gitconfig'
	
	# 安裝版本提交前 Git 掛勾程式
	ln --symbolic --force "../../開發工具/Git 版本控制系統掛勾程式/pre-commit.sh" "${PROJECT_ROOT_DIRECTORY}"/.git/hooks/pre-commit
	
	## 正常結束 script 程式
	exit 0
}
main
######## Program ended ########
