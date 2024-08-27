@tool
extends MarginContainer

@export var platform_material: StandardMaterial3D
@export var box_material: StandardMaterial3D

var active_material: StandardMaterial3D

func _ready() -> void:
	active_material = platform_material

func _process(delta: float) -> void:
	%Sphere.rotation.y += delta * 0.2


func _on_tab_bar_tab_changed(tab: int) -> void:
	match tab:
		0:
			active_material = platform_material
		1:
			active_material = box_material

	for i in $VBoxContainer/HBoxContainer2/VBoxContainer.get_children():
		i.update_values()
	%Sphere.set_surface_override_material(0, active_material)


func _on_mesh_type_tab_changed(tab: int) -> void:
	match tab:
		0:
			%Sphere.mesh = SphereMesh.new()
			%Sphere.mesh.radial_segments = 128
			%Sphere.mesh.radial_segments = 64
			%Sphere.scale = Vector3(1, 1, 1)
		1:
			%Sphere.mesh = BoxMesh.new()
			%Sphere.scale = Vector3(0.7, 0.7, 0.7)
