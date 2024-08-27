extends Control

@warning_ignore("unused_signal")
signal platform_size_changed(new_size: int)
@warning_ignore("unused_signal")
signal spawn_offset_changed(new_offset: int)
@warning_ignore("unused_signal")
signal random_offset_changed(new_offset: float)
@warning_ignore("unused_signal")
signal random_rotation_toggled(enabled: bool)

@warning_ignore("unused_signal")
signal ssr_toggled(enabled: bool)
@warning_ignore("unused_signal")
signal ssao_toggled(enabled: bool)
@warning_ignore("unused_signal")
signal ssil_toggled(enabled: bool)
@warning_ignore("unused_signal")
signal sdfgi_toggled(enabled: bool)

@warning_ignore("unused_signal")
signal box_mesh_changed(new_mesh: Mesh)
@warning_ignore("unused_signal")
signal box_collision_changed(new_collision: Shape3D)
@warning_ignore("unused_signal")
signal box_size_changed(new_size: float)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("options"):
		visible = not visible

func _ready() -> void:
	hide()
