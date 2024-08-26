extends HBoxContainer

@onready var materials: MarginContainer = $"../../.."

func _on_color_picker_button_color_changed(color: Color) -> void:
	materials.active_material.set("albedo_color", color)
