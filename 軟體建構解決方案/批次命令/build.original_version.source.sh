	printf "資訊：正在建構原版……\n"
	cp "${FILE_SOURCE_DESIGN}" "$DIRECTORY_BUILD_ARTIFACTS"
	inkscape --export-png="$DIRECTORY_BUILD_ARTIFACTS/${SOFTWARE_IDENTIFIER}.png" "${FILE_SOURCE_DESIGN}"
