	declare variant_title="LION"
	declare new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-lion.svg"
	printf "資訊：正在建構「%s」版……\n" "${variant_title}"
	cp "${FILE_SOURCE_DESIGN}" "${new_source_file}"
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"官方版本（LION 版v2）"\
		hide
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"官方版本（LION 版）"\
		show
	svg_to_png\
		"${new_source_file}"
	
	make_non_transparent_version\
		"${variant_title}"\
		"${new_source_file}"

	unset\
		variant_title\
		new_source_file
