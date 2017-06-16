	declare\
		variant_title="時代力量"\
		new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-new-power-party.svg"

	printf --\
		"資訊：正在建構「%s」版……\n"\
		"${variant_title}"

	cp "${FILE_SOURCE_DESIGN}" "${new_source_file}"

	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"官方版本（LION 版v2）"\
		hide
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"台澎琉蘭綠東南沙底圖"\
		show
	sed --in-place s/18a303/f7bf03/g "${new_source_file}"

	svg_to_png\
		"${new_source_file}"
	
	make_non_transparent_version\
		"${variant_title}"\
		"${new_source_file}"
	
	unset\
		variant_title\
		new_source_file

	declare\
		variant_title="時代力量（力）"\
		new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-new-power-party-with-li.svg"

	printf --\
		"資訊：正在建構「%s」版……\n"\
		"${variant_title}"

	cp "${FILE_SOURCE_DESIGN}" "${new_source_file}"

	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"官方版本（LION 版v2）"\
		hide
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"台澎琉蘭綠東南沙底圖"\
		show
	sed --in-place s/18a303/f7bf03/g "${new_source_file}"
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"時代力量黨版"\
		show

	svg_to_png\
		"${new_source_file}"
	
	make_non_transparent_version\
		"${variant_title}"\
		"${new_source_file}"
	
	unset\
		variant_title\
		new_source_file
