	declare new_source_file="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN")-new-tai.svg"
	printf "資訊：正在建構「台」版……\n"
	cp "$FILE_SOURCE_DESIGN" "$new_source_file"
	xmlstarlet edit --pf --ps --inplace --update "//_:g[@inkscape:label='臺版']/@style" --value "display:none" "$new_source_file"
	xmlstarlet edit --pf --ps --inplace --update "//_:g[@inkscape:label='台版']/@style" --value "display:inline" "$new_source_file"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file").png" "$new_source_file"
	
	declare new_source_file_white_background="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN")-new-tai-background-white.svg"
	printf "資訊：正在建構「台」版白背景版……\n"
	cp "$new_source_file" "$new_source_file_white_background"
	xmlstarlet edit --pf --ps --inplace --update "//@inkscape:pageopacity" --value 1 "$new_source_file_white_background"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file_white_background").png" "$new_source_file_white_background"
	
	unset new_source_file
	unset new_source_file_white_background