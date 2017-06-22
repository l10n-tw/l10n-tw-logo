	declare\
		variant_title="臺澎琉蘭綠東南沙版（台版）"\
		new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-taiwan-sovereign-region-new-tai.svg"

	printf --\
		"資訊：正在建構「%s」版……\n"\
		"${variant_title}"

	cp "${FILE_SOURCE_DESIGN}" "${new_source_file}"
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"layer-variant-shisa"\
		hide
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"layer-background-taiwan-sovereign-region"\
		show
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"layer-brand"\
		hide
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"layer-variant-new-tai"\
		show
	svg_to_png\
		"${new_source_file}"
	
	make_non_transparent_version\
		"${variant_title}"\
		"${new_source_file}"
	
	unset\
		variant_title\
		new_source_file
