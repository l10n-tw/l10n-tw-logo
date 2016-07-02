#!/usr/bin/env bash
# 上列為宣告執行 script 程式用的殼程式(shell)的 shebang
# build.sh - 軟體建構程式
# Ｖ字龍 <Vdragon.Taiwan@gmail.com> © 2016
# 建構這個軟體的程式

which realpath &>/dev/null
if [ $? -ne 0 ]; then
	printf "錯誤：本程式需要 realpath 命令才能正常運作！" 1>&2
	exit 1
fi

######## File scope variable definitions ########
# Defensive Bash Programming - not-overridable primitive definitions
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
declare -r PROGRAM_FILENAME="$(basename "$0")"
declare -r PROGRAM_DIRECTORY="$(realpath --no-symlinks "$(dirname "$0")")"
declare -r PROGRAM_ARGUMENT_ORIGINAL_LIST="$@"
declare -r PROGRAM_ARGUMENT_ORIGINAL_NUMBER=$#

declare -r DIRECTORY_PROJECT_ROOT="$(realpath --no-symlinks "$PROGRAM_DIRECTORY/../..")"
declare -r DIRECTORY_PROJECT_SOURCE_CODE="$DIRECTORY_PROJECT_ROOT/來源碼"
declare -r DIRECTORY_BUILD_ARTIFACTS="$DIRECTORY_PROJECT_ROOT/建構中間產物"
declare -r DIRECTORY_BUILD_RESULTS="$DIRECTORY_PROJECT_ROOT/建構結果"

declare -r FILE_SOURCE_DESIGN="$DIRECTORY_PROJECT_SOURCE_CODE/l10n-tw-logo-taiwan.svg"

## Unofficial Bash Script Mode
## http://redsymbol.net/articles/unofficial-bash-strict-mode/
# 將未定義的變數的參考視為錯誤
set -u

# Exit immediately if a pipeline, which may consist of a single simple command, a list, or a compound command returns a non-zero status.  The shell does not exit if the command that fails is part of the command list immediately following a `while' or `until' keyword, part of the test in an `if' statement, part of any command executed in a `&&' or `||' list except the command following the final `&&' or `||', any command in a pipeline but the last, or if the command's return status is being inverted with `!'.  If a compound command other than a subshell returns a non-zero status because a command failed while `-e' was being ignored, the shell does not exit.  A trap on `ERR', if set, is executed before the shell exits.
set -e

# If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully.
set -o pipefail

######## File scope variable definitions ended ########

######## Included files ########

######## Included files ended ########

######## Program ########
check_program_dependencies() {
	which inkscape &>/dev/null
	if [ $? -ne 0 ]; then
		printf "錯誤：本程式需要 inkscape 命令才能正常運作！" 1>&2
		exit 1
	fi

	return
}

# Defensive Bash Programming - main function, program entry point
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
main() {
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN").png" "$FILE_SOURCE_DESIGN"
	
	inkscape --export-background="rgb(255, 255, 255)" --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN")-background-white.png" "$FILE_SOURCE_DESIGN"
	
	local archive_directory="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN")"
	
	mkdir --parent "$archive_directory"
	
	cp "$FILE_SOURCE_DESIGN" "$archive_directory"
	cp "$DIRECTORY_BUILD_ARTIFACTS/"*.png "$archive_directory"	
	cp "$DIRECTORY_PROJECT_ROOT/README.markdown" "$archive_directory"
	
	7za a "$DIRECTORY_BUILD_RESULTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN")".7z "$archive_directory"
	
	## 正常結束 script 程式
	exit 0
}
main
######## Program ended ########