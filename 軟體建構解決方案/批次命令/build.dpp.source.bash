	declare\
		variant_title="民主進步黨"\
		new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-dpp.svg"

	printf --\
		"資訊：正在建構「%s」版……\n"\
		"${variant_title}"

	cp "${FILE_SOURCE_DESIGN}" "${new_source_file}"
	sed --in-place s/18a303/009a00/g "${new_source_file}"
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"官方版本（LION 版v2）"\
		hide
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"台澎琉蘭綠東南沙底圖"\
		show
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"民主進步黨版"\
		show
	svg_to_png\
		"${new_source_file}"
	
	make_non_transparent_version\
		"${variant_title}"\
		"${new_source_file}"
	
	unset\
		variant_title\
		new_source_file
