	declare\
		variant_title="中華人民共和國共產黨"\
		new_source_file="${DIRECTORY_BUILD_ARTIFACTS}/${SOFTWARE_IDENTIFIER}-china-communist.svg"

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
		"官方版本（品牌名）"\
		hide
	manipulate_inkscape_layer_visibility\
		"${new_source_file}"\
		"中華人民共和國共產黨版"\
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