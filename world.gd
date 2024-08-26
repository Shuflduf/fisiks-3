extends Node3D

@export var box_scene: PackedScene

@onready var spawn_pos: Marker3D = $SpawnPos
@onready var boxes: Node3D = $Boxes

var random_offset = 1.0
var random_rotation = false

func _physics_process(_delta: float) -> void:
	var new_box = box_scene.instantiate()

	boxes.add_child(new_box)
	new_box.global_position = spawn_pos.global_position
	new_box.position += Vector3(
		randf_range(-random_offset, random_offset),
		randf_range(-random_offset, random_offset),
		randf_range(-random_offset, random_offset)
	)
	if random_rotation:
		new_box.rotation = Vector3(
			randf_range(-PI, PI),
			randf_range(-PI, PI),
			randf_range(-PI, PI)
		)

func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		print("AH")


func _on_ui_platform_size_changed(new_size: int) -> void:
	for i in boxes.get_children():
		if i is not RigidBody3D:
			continue
		i.sleeping = false
	$Platform.size.x = new_size
	$Platform.size.z = new_size


func _on_bounds_body_entered(body: Node3D) -> void:
	body.queue_free()


func _on_ui_spawn_offset_changed(new_offset: int) -> void:
	$SpawnPos.position.y = new_offset


func _on_ui_random_offset_changed(new_offset: float) -> void:
	random_offset = new_offset


func _on_ui_random_rotation_toggled(enabled: bool) -> void:
	random_rotation = enabled
