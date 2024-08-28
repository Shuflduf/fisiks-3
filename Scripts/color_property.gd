extends HBoxContainer

@onready var materials: MarginContainer = %Materials

func _on_color_picker_button_color_changed(color: Color) -> void:
	materials.active_material.set("albedo_color", color)
	if is_equal_approx(color.a, 1.0):
		materials.active_material.transparency = BaseMaterial3D.Transparency.TRANSPARENCY_DISABLED
	else:
		materials.active_material.transparency = BaseMaterial3D.Transparency.TRANSPARENCY_ALPHA

func update_values():
	$ColorPickerButton.color = materials.active_material.get("albedo_color")
	if is_equal_approx($ColorPickerButton.color.a, 1.0):
		materials.active_material.transparency = BaseMaterial3D.Transparency.TRANSPARENCY_DISABLED
	else:
		materials.active_material.transparency = BaseMaterial3D.Transparency.TRANSPARENCY_ALPHA
