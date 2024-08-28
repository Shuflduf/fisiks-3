extends Control

@export var box_parent: Node3D


func _on_clear_pressed() -> void:
	for i in box_parent.get_children():
		i.queue_free()

func _process(_delta: float) -> void:
	$VBoxContainer/BoxCount.text = "Boxes: " + str(box_parent.get_child_count())
