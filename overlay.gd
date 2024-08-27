extends Control

@export var box_parent: Node3D


func _on_clear_pressed() -> void:
	for i in box_parent.get_children():
		i.queue_free()
