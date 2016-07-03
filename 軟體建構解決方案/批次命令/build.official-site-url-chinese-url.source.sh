	declare new_source_file="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN")-chinese-url.svg"
	printf "資訊：正在建構欸嘍十恩點踢搭補魯版……\n"
	cp "$FILE_SOURCE_DESIGN" "$new_source_file"
	xmlstarlet edit --pf --ps --inplace --update "//_:g[@inkscape:label='官方版本（官方網站網址）']/@style" --value "display:none" "$new_source_file"
	xmlstarlet edit --pf --ps --inplace --update "//_:g[@inkscape:label='欸嘍十恩點踢搭補魯版']/@style" --value "display:inline" "$new_source_file"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file").png" "$new_source_file"
	
	declare new_source_file_white_background="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN")-chinese-url-background-white.svg"
	printf "資訊：正在建構欸嘍十恩點踢搭補魯版白背景版……\n"
	cp "$new_source_file" "$new_source_file_white_background"
	xmlstarlet edit --pf --ps --inplace --update "//@inkscape:pageopacity" --value 1 "$new_source_file_white_background"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file_white_background").png" "$new_source_file_white_background"
	
	unset new_source_file
	unset new_source_file_white_background