@tool
extends EditorPlugin

var preview_gen = preload("res://addons/simple_resource_icons/simple_preview_generator.gd")

func _enter_tree():
	preview_gen = preview_gen.new()
	get_editor_interface().get_resource_previewer().add_preview_generator(preview_gen)

func _exit_tree():
	get_editor_interface().get_resource_previewer().remove_preview_generator(preview_gen)
