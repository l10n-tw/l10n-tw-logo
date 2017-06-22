	declare\
		variant_title="官方版本"\
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

	unset\
		variant_title\
		target_file
