extends HBoxContainer

@export var signal_name: String



func _on_value_slider_value_changed(value: float) -> void:
	owner.emit_signal(signal_name, floori(value))
	$ValueSpinBox.value = value


func _on_value_spin_box_value_changed(value: float) -> void:
	$ValueSlider.value = value
