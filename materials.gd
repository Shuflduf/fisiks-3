@tool
extends MarginContainer

@export var platform_material: StandardMaterial3D
@export var box_material: StandardMaterial3D

var active_material: StandardMaterial3D

func _ready() -> void:
	active_material = platform_material

func _process(delta: float) -> void:
	$HBoxContainer2/SubViewportContainer/SubViewport/MeshInstance3D.rotation.y += delta * 0.2
