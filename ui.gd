extends Control

signal platform_size_changed(new_size: int)




func _on_plat_slider_value_changed(value: float) -> void:
	platform_size_changed.emit(floori(value))
	%PlatSpinBox.value = value

func _on_plat_spin_box_value_changed(value: float) -> void:
	%PlatSlider.value = value
