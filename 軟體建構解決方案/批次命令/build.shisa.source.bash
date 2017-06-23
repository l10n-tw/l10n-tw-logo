	declare\
		variant_title="風獅爺"\
		target_file

	target_file="${DIRECTORY_BUILD_ARTIFACTS}/$(basename "${FILE_SOURCE_DESIGN}")"

	printf --\
		"資訊：正在建構「%s」版……\n"\
		"${variant_title}"

	cp\
		"${FILE_SOURCE_DESIGN}"\
		"${target_file}"
	svg_to_png\
		"${target_file}"

	make_non_transparent_version\
		"${variant_title}"\
		"${target_file}"

	make_new_tai_version\
		"${variant_title}"\
		"${target_file}"

	printf --\
		"資訊：正在建構「%s」版(with metadata)……\n"\
		"${variant_title}"
	declare target_file_with_metadata
	target_file_with_metadata="${DIRECTORY_BUILD_ARTIFACTS}/$(basename --suffix=.svg "${FILE_SOURCE_DESIGN}")-with-metadata.svg"

	cp\
		"${FILE_SOURCE_DESIGN}"\
		"${target_file_with_metadata}"
	manipulate_inkscape_layer_visibility\
		"${target_file_with_metadata}"\
		"layer-metadata"\
		"show"
	manipulate_inkscape_layer_visibility\
		"${target_file_with_metadata}"\
		"layer-variant-shisa-metadata"\
		"show"

	# Set bigger DPI as text is smaller than usual
	xmlstarlet\
		edit\
			--ps\
			--inplace\
			--insert "/_:svg"\
				--type attr\
				-n "inkscape:export-xdpi"\
				--value "300"\
				"${target_file_with_metadata}"
	xmlstarlet\
		edit\
			--ps\
			--inplace\
			--insert "/_:svg"\
				--type attr\
				-n "inkscape:export-ydpi"\
				--value "300"\
				"${target_file_with_metadata}"

	svg_to_png\
		"${target_file_with_metadata}"
	make_non_transparent_version\
		"${variant_title}(with metadata)"\
		"${target_file_with_metadata}"
	make_new_tai_version\
		"${variant_title}(with metadata)"\
		"${target_file_with_metadata}"

	unset\
		variant_title\
		target_file\
		target_file_with_metadata
