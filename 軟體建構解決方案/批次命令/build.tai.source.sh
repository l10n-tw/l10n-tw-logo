	declare new_source_file="$DIRECTORY_BUILD_ARTIFACTS/${SOFTWARE_IDENTIFIER}-new-tai.svg"
	printf "資訊：正在建構「臺」版……\n"
	cp "${FILE_SOURCE_DESIGN}" "$new_source_file"
	xmlstarlet edit --pf --ps --inplace --update "//_:g[@inkscape:label='官方版本（LION 版v2）']/@style" --value "display:none" "$new_source_file"
	xmlstarlet edit --pf --ps --inplace --update "//_:g[@inkscape:label='台澎琉蘭綠東南沙底圖']/@style" --value "display:inline" "$new_source_file"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file").png" "$new_source_file"
	
	declare new_source_file_white_background="$DIRECTORY_BUILD_ARTIFACTS/${SOFTWARE_IDENTIFIER}-new-tai-background-white.svg"
	printf "資訊：正在建構「臺」版白背景版……\n"
	cp "$new_source_file" "$new_source_file_white_background"
	xmlstarlet edit --pf --ps --inplace --update "//@inkscape:pageopacity" --value 1 "$new_source_file_white_background"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file_white_background").png" "$new_source_file_white_background"
	
	unset new_source_file
	unset new_source_file_white_background