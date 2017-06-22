	declare\
		variant_title="（非官方）時代力量"\
		new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-unofficial-new-power-party.svg"

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
		variant_title="（非官方）時代力量（力）"\
		new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-unofficial-new-power-party-with-li.svg"

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
	sed --in-place s/18a303/f7bf03/g "${new_source_file}"
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"layer-variant-unofficial-new-power-party"\
		show

	svg_to_png\
		"${new_source_file}"
	
	make_non_transparent_version\
		"${variant_title}"\
		"${new_source_file}"
	
	unset\
		variant_title\
		new_source_file
