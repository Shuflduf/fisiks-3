extends Control

@warning_ignore("unused_signal")
signal platform_size_changed(new_size: int)
@warning_ignore("unused_signal")
signal spawn_offset_changed(new_offset: int)
@warning_ignore("unused_signal")
signal random_offset_changed(new_offset: float)


func _on_check_box_toggled(toggled_on: bool) -> void:
	get_parent().random_rotation = toggled_on
