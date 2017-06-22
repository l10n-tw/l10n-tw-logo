	declare\
		variant_title="（非官方）中華人民共和國共產黨"\
		new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-unofficial-china-communist.svg"

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
		"layer-brand"\
		hide
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"layer-variant-unofficial-china-communist"\
		show
	svg_to_png\
		"${new_source_file}"
	
	make_non_transparent_version\
		"${variant_title}"\
		"${new_source_file}"
	
	# 讓這個版本支援 Web font 的暫時處理措施
	sed\
		--in-place\
		"s/SourceHanSerifTW/SourceHanSerifCN/"\
		"${DIRECTORY_BUILD_ARTIFACTS}/$(basename --suffix=.svg "${new_source_file}")"*.svg

	unset\
		variant_title\
		new_source_file