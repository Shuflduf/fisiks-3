@tool
extends MarginContainer

@export var platform_material: StandardMaterial3D
@export var box_material: StandardMaterial3D

var active_material: StandardMaterial3D

func _ready() -> void:
	active_material = platform_material

func _process(delta: float) -> void:
	$VBoxContainer/HBoxContainer2/SubViewportContainer/SubViewport/MeshInstance3D\
			.rotation.y += delta * 0.2


func _on_tab_bar_tab_changed(tab: int) -> void:
	match tab:
		0:
			active_material = platform_material
		1:
			active_material = box_material

	for i in $VBoxContainer/HBoxContainer2/VBoxContainer.get_children():
		i.update_values()
