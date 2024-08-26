extends Node3D

@export var box_scene: PackedScene

@onready var spawn_pos: Marker3D = $SpawnPos
@onready var boxes: Node3D = $Boxes

func _physics_process(_delta: float) -> void:
	var new_box = box_scene.instantiate()

	boxes.add_child(new_box)
	new_box.global_position = spawn_pos.global_position

func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		print("AH")


func _on_ui_platform_size_changed(new_size: int) -> void:
	$Platform.size.x = new_size
	$Platform.size.z = new_size
