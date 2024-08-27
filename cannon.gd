extends Node3D

var speed = 100
var mass_mult = 1.0
var size_mult = 1.0

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		var new_box: RigidBody3D = get_parent().get_new_box()
		$"../Boxes".add_child(new_box)
		new_box.global_position.z = get_parent().platform_size + 5
		new_box.position = rotate_forwards(new_box.position)
		new_box.global_position.y = 5
		new_box.mass *= mass_mult
		new_box.scale *= size_mult

		new_box.apply_central_impulse(rotate_forwards(Vector3.FORWARD) * speed)

func rotate_forwards(input: Vector3) -> Vector3:
	return input.rotated(Vector3.UP, $"../HPivot".rotation.y)


func _on_ui_cannon_mass_changed(new_mass: float) -> void:
	mass_mult = new_mass


func _on_ui_cannon_size_changed(new_size: float) -> void:
	size_mult = new_size


func _on_ui_cannon_speed_changed(new_speed: int) -> void:
	speed = new_speed
