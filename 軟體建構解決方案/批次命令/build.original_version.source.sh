	printf "資訊：正在建構原版……\n"
	cp "$FILE_SOURCE_DESIGN" "$DIRECTORY_BUILD_ARTIFACTS"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/$(basename --suffix=.svg "$FILE_SOURCE_DESIGN").png" "$FILE_SOURCE_DESIGN"
