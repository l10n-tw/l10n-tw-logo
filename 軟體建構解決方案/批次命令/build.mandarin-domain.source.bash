	declare\
		new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-mandarin-domain.svg"\
		variant_title="欸嘍十恩點踢搭補魯"

	printf --\
		"資訊：正在建構「%s」版……\n"\
		"${variant_title}"

	cp "${FILE_SOURCE_DESIGN}" "${new_source_file}"

	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"layer-official-site-domain-capitalized"\
		hide
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"layer-variant-mandarin-domain"\
		show
	svg_to_png\
		"${new_source_file}"
	
	make_non_transparent_version\
		"${variant_title}"\
		"${new_source_file}"

	unset\
		variant_title\
		new_source_file
