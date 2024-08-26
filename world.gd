extends Node3D

@export var box_scene: PackedScene

@onready var spawn_pos: Marker3D = $SpawnPos
@onready var boxes: Node3D = $Boxes

func _physics_process(delta: float) -> void:
	var new_box = box_scene.instantiate()

	boxes.add_child(new_box)
	new_box.global_position = spawn_pos.global_position
