extends "res://material_property.gd"


func _on_h_slider_value_changed(value: float) -> void:
	var new_scale = Vector3(value, value, value)
	materials.active_material.set(property, new_scale)
	$SpinBox.value = value


func _on_spin_box_value_changed(value: float) -> void:
	$HSlider.value = value
