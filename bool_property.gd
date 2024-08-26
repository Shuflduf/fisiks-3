extends HBoxContainer

@onready var materials: MarginContainer = $"../../.."
@export var property: String


func _on_check_box_toggled(toggled_on: bool) -> void:
	materials.active_material.set(property, toggled_on)
