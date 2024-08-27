extends HBoxContainer

@onready var materials: MarginContainer = %Materials

func _on_color_picker_button_color_changed(color: Color) -> void:
	materials.active_material.set("albedo_color", color)

func update_values():
	$ColorPickerButton.color = materials.active_material.get("albedo_color")
