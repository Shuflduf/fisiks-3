extends HBoxContainer

@onready var materials: MarginContainer = %Materials
@export var property: String

func _on_h_slider_value_changed(value: float) -> void:
	materials.active_material.set(property, value)
	$SpinBox.value = value


func _on_spin_box_value_changed(value: float) -> void:
	$HSlider.value = value

func update_values():
	$SpinBox.value = materials.active_material.get(property)
