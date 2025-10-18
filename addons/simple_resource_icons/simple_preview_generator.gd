extends EditorResourcePreviewGenerator

func _can_generate_small_preview():
	return true

func _handles(type):
	return type == "Resource"

func _generate(resource, size, _metadata = {}):
	var img: Image

	# The resource script must be a @tool script.
	if resource.has_method(&"_get_icon"):
		var icon = resource.call(&"_get_icon")
		if icon:
			if icon is Texture2D:
				img = icon.get_image()
			else:
				img = icon
	elif &"icon" in resource:
		if resource.icon:
			img = resource.icon.get_image()

	if img:
		img.resize(size.x, size.y, Image.INTERPOLATE_NEAREST)
		return ImageTexture.create_from_image(img)
	return null
