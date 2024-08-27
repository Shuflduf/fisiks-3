extends HBoxContainer

@onready var materials: MarginContainer = %Materials
@export var property: String


func _on_check_box_toggled(toggled_on: bool) -> void:
	materials.active_material.set(property, toggled_on)

func update_values():
	$CheckBox.button_pressed = materials.active_material.get(property)
