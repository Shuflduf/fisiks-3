extends Node3D

@export var box_scene: PackedScene

@onready var spawn_pos: Marker3D = $SpawnPos
@onready var boxes: Node3D = $Boxes

var random_offset = 1.0
var random_rotation = false

var box_size = 1.0

var box_mesh: Mesh = BoxMesh.new()
var box_collision: Shape3D = BoxShape3D.new()

var platform_size = 30

func _ready() -> void:
	set_platform_size(platform_size)

func _physics_process(_delta: float) -> void:
	var new_box = box_scene.instantiate()

	boxes.add_child(new_box)
	new_box.global_position = spawn_pos.global_position
	new_box.scale = Vector3(
		box_size,
		box_size,
		box_size
	)
	new_box.position += Vector3(
		randf_range(-random_offset, random_offset),
		randf_range(-random_offset, random_offset),
		randf_range(-random_offset, random_offset)
	)
	new_box.find_child("CollisionShape3D").shape = box_collision
	new_box.find_child("MeshInstance3D").mesh = box_mesh
	if random_rotation:
		new_box.rotation = Vector3(
			randf_range(-PI, PI),
			randf_range(-PI, PI),
			randf_range(-PI, PI)
		)


func _on_ui_platform_size_changed(new_size: int) -> void:
	for i in boxes.get_children():
		if i is not RigidBody3D:
			continue
		i.sleeping = false
	set_platform_size(new_size)
	platform_size = new_size


func _on_bounds_body_entered(body: Node3D) -> void:
	body.queue_free()


func _on_ui_spawn_offset_changed(new_offset: int) -> void:
	$SpawnPos.position.y = new_offset


func _on_ui_random_offset_changed(new_offset: float) -> void:
	random_offset = new_offset


func _on_ui_random_rotation_toggled(enabled: bool) -> void:
	random_rotation = enabled


func _on_ui_box_size_changed(new_size: float) -> void:
	box_size = new_size


func _on_ui_box_collision_changed(new_collision: Shape3D) -> void:
	box_collision = new_collision


func _on_ui_box_mesh_changed(new_mesh: Mesh) -> void:
	box_mesh = new_mesh


func _on_ui_platform_shape_changed(new_shape: Shape3D, new_mesh: Mesh) -> void:
	var collision = $Platform.find_child("CollisionShape3D")
	var mesh = $Platform.find_child("MeshInstance3D")
	collision.shape = new_shape
	mesh.mesh = new_mesh
	set_platform_size(platform_size)

func set_platform_size(new_size: float):
	var collision = $Platform.find_child("CollisionShape3D")
	var mesh = $Platform.find_child("MeshInstance3D")

	if collision.shape is BoxShape3D:
		collision.shape.size = Vector3(
			new_size,
			1,
			new_size
		)
		mesh.mesh.size = collision.shape.size
	elif collision.shape is CylinderShape3D:
		collision.shape.radius = new_size
		mesh.mesh.top_radius = new_size / 2.0
		mesh.mesh.bottom_radius = mesh.mesh.top_radius
