	declare new_source_file="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN")-new-power-party.svg"
	printf "資訊：正在建構時代力量版……\n"
	cp "$FILE_SOURCE_DESIGN" "$new_source_file"
	sed --in-place s/18a303/f7bf03/g "$new_source_file"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file").png" "$new_source_file"
	
	declare new_source_file_white_background="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN")-new-power-party-background-white.svg"
	printf "資訊：正在建構時代力量版白背景版……\n"
	cp "$new_source_file" "$new_source_file_white_background"
	xmlstarlet edit --pf --ps --inplace --update "//@inkscape:pageopacity" --value 1 "$new_source_file_white_background"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file_white_background").png" "$new_source_file_white_background"
	
	declare new_source_file_with_li="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN")-new-power-party-with-li.svg"
	printf "資訊：正在建構時代力量（力）版……\n"
	cp "$FILE_SOURCE_DESIGN" "$new_source_file_with_li"
	sed --in-place s/18a303/f7bf03/g "$new_source_file_with_li"
	xmlstarlet edit --pf --ps --inplace --update "//_:g[@inkscape:label='時代力量黨版']/@style" --value "display:inline" "$new_source_file_with_li"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file_with_li").png" "$new_source_file_with_li"
	
	declare new_source_file_with_li_white_background="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file_with_li")-background-white.svg"
	printf "資訊：正在建構時代力量版白背景版……\n"
	cp "$new_source_file_with_li" "$new_source_file_with_li_white_background"
	xmlstarlet edit --pf --ps --inplace --update "//@inkscape:pageopacity" --value 1 "$new_source_file_with_li_white_background"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$new_source_file_with_li_white_background").png" "$new_source_file_with_li_white_background"
	
	unset new_source_file
	unset new_source_file_white_background
	unset new_source_file_with_li
	unset new_source_file_with_li_white_background