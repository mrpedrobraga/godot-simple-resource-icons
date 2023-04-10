extends EditorResourcePreviewGenerator

func _can_generate_small_preview():
	return true

func _handles(type):
	return type == "Resource"

func _generate(resource, size):
	var img : Image = Image.new()
	
	# The _get_icon method must return an [Image].
	# The resource script must be a @tool script.
	if resource.has_method(&"_get_icon"):
		var icon = resource.call(&"_get_icon")
		if icon:
			img = icon
			img.resize(size.x, size.y, Image.INTERPOLATE_NEAREST)
	if &"icon" in resource:
		if resource.icon:
			img = resource.icon.get_image()
			img.resize(size.x, size.y, Image.INTERPOLATE_NEAREST)
	
	return ImageTexture.create_from_image(img)
