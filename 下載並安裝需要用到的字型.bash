#!/usr/bin/env bash
#shellcheck disable=SC2034

## Makes debuggers' life easier - Unofficial Bash Strict Mode
## BASHDOC: Shell Builtin Commands - Modifying Shell Behavior - The Set Builtin
set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

## Non-overridable Primitive Variables
## BASHDOC: Shell Variables » Bash Variables
## BASHDOC: Basic Shell Features » Shell Parameters » Special Parameters
if [ -v "BASH_SOURCE[0]" ]; then
	RUNTIME_EXECUTABLE_PATH="$(realpath --strip "${BASH_SOURCE[0]}")"
	RUNTIME_EXECUTABLE_FILENAME="$(basename "${RUNTIME_EXECUTABLE_PATH}")"
	RUNTIME_EXECUTABLE_NAME="${RUNTIME_EXECUTABLE_FILENAME%.*}"
	RUNTIME_EXECUTABLE_DIRECTORY="$(dirname "${RUNTIME_EXECUTABLE_PATH}")"
	RUNTIME_COMMANDLINE_BASECOMMAND="${0}"
	declare -r\
		RUNTIME_EXECUTABLE_FILENAME\
		RUNTIME_EXECUTABLE_DIRECTORY\
		RUNTIME_EXECUTABLE_PATHABSOLUTE\
		RUNTIME_COMMANDLINE_BASECOMMAND
fi
declare -ar RUNTIME_COMMANDLINE_PARAMETERS=("${@}")

## init function: entrypoint of main program
## This function is called near the end of the file,
## with the script's command-line parameters as arguments
init(){
	if ! process_commandline_parameters; then
		printf\
			"Error: %s: Invalid command-line parameters.\n"\
			"${FUNCNAME[0]}"\
			1>&2
		print_help
		exit 1
	fi
	if mkdir --parents ~/.local/share/fonts; then
		printf\
			"%s: Error: Unable to create font installation directory.\n"\
			"${RUNTIME_EXECUTABLE_NAME}"
		exit 1
	fi

	printf\
		"%s: Downloading required fonts...\n"\
		"${RUNTIME_EXECUTABLE_NAME}"
	wget\
		--output-document -\
		https://github.com/adobe-fonts/source-han-sans/raw/release/SubsetOTF/TW/SourceHanSansTW-Regular.otf >~/.local/share/fonts/SourceHanSansTW-Regular.otf
	wget\
		--output-document -\
		https://github.com/adobe-fonts/source-han-sans/raw/release/SubsetOTF/CN/SourceHanSansCN-Regular.otf >~/.local/share/fonts/SourceHanSansCN-Regular.otf

	printf\
		"%s: Regenerating font cache...\n"\
		"${RUNTIME_EXECUTABLE_NAME}"
	fc-cache --verbose

	printf\
		"%s: Font installation completed.\n"\
		"${RUNTIME_EXECUTABLE_NAME}"

	exit 0
}; declare -fr init

## Traps: Functions that are triggered when certain condition occurred
## Shell Builtin Commands » Bourne Shell Builtins » trap
trap_errexit(){
	printf "An error occurred and the script is prematurely aborted\n" 1>&2
	return 0
}; declare -fr trap_errexit; trap trap_errexit ERR

trap_exit(){
	return 0
}; declare -fr trap_exit; trap trap_exit EXIT

trap_return(){
	local returning_function="${1}"

	printf "DEBUG: %s: returning from %s\n" "${FUNCNAME[0]}" "${returning_function}" 1>&2
}; declare -fr trap_return

trap_interrupt(){
	printf "Recieved SIGINT, script is interrupted.\n" 1>&2
	return 0
}; declare -fr trap_interrupt; trap trap_interrupt INT

print_help(){
	printf "Currently no help messages are available for this program\n" 1>&2
	return 0
}; declare -fr print_help;

process_commandline_parameters() {
	if [ "${#RUNTIME_COMMANDLINE_PARAMETERS[@]}" -eq 0 ]; then
		return 0
	fi

	# modifyable parameters for parsing by consuming
	local -a parameters=("${RUNTIME_COMMANDLINE_PARAMETERS[@]}")

	# Normally we won't want debug traces to appear during parameter parsing, so we  add this flag and defer it activation till returning(Y: Do debug)
	local enable_debug=N

	while true; do
		if [ "${#parameters[@]}" -eq 0 ]; then
			break
		else
			case "${parameters[0]}" in
				"--help"\
				|"-h")
					print_help;
					exit 0
					;;
				"--debug"\
				|"-d")
					enable_debug="Y"
					;;
				*)
					printf "ERROR: Unknown command-line argument \"%s\"\n" "${parameters[0]}" >&2
					return 1
					;;
			esac
			# shift array by 1 = unset 1st then repack
			unset "parameters[0]"
			if [ "${#parameters[@]}" -ne 0 ]; then
				parameters=("${parameters[@]}")
			fi
		fi
	done

	if [ "${enable_debug}" = "Y" ]; then
		trap 'trap_return "${FUNCNAME[0]}"' RETURN
		set -o xtrace
	fi
	return 0
}; declare -fr process_commandline_parameters;

init "${@}"

## This script is based on the GNU Bash Shell Script Template project
## https://github.com/Lin-Buo-Ren/GNU-Bash-Shell-Script-Template
## and is based on the following version:
declare -r META_BASED_ON_GNU_BASH_SHELL_SCRIPT_TEMPLATE_VERSION="v1.26.0-32-g317af27-dirty"
## You may rebase your script to incorporate new features and fixes from the template