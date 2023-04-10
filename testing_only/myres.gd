@tool
extends Resource
class_name Aaa

@export var i : Texture2D

func _get_icon():
	return i.get_image()
