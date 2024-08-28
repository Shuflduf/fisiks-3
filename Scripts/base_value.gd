extends HBoxContainer

@export var signal_name: String
@export var is_float = false


func _on_value_slider_value_changed(value: float) -> void:
	@warning_ignore("incompatible_ternary")
	owner.emit_signal(signal_name, (floori(value) if !is_float else value))
	$ValueSpinBox.value = value


func _on_value_spin_box_value_changed(value: float) -> void:
	$ValueSlider.value = value
