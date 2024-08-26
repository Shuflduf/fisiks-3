extends Control

signal platform_size_changed(new_size: int)
signal spawn_offset_changed(new_offset: int)



func _on_plat_slider_value_changed(value: float) -> void:
	platform_size_changed.emit(floori(value))
	%PlatSpinBox.value = value

func _on_plat_spin_box_value_changed(value: float) -> void:
	%PlatSlider.value = value


func _on_spawn_slider_value_changed(value: float) -> void:
	spawn_offset_changed.emit(floori(value))
	%SpawnSpinBox.value = value


func _on_spawn_spin_box_value_changed(value: float) -> void:
	%SpawnSlider.value = value
