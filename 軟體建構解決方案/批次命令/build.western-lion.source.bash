	declare variant_title="西洋獅"
	declare new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-western-lion.svg"
	printf "資訊：正在建構「%s」版……\n" "${variant_title}"
	cp "${FILE_SOURCE_DESIGN}" "${new_source_file}"
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"layer-variant-shisa"\
		hide
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"layer-variant-western-lion"\
		show
	svg_to_png\
		"${new_source_file}"
	
	make_non_transparent_version\
		"${variant_title}"\
		"${new_source_file}"

	make_new_tai_version\
		"${variant_title}"\
		"${new_source_file}"

	unset\
		variant_title\
		new_source_file
