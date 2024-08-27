extends "res://base_value.gd"


func _on_option_button_item_selected(index: int) -> void:
	var mesh: Mesh
	var shape: Shape3D
	match index:
		0:
			shape = BoxShape3D.new()
			mesh = BoxMesh.new()
		1:
			shape = CylinderShape3D.new()
			mesh = CylinderMesh.new()
			shape.height = 1
			mesh.height = shape.height
	owner.emit_signal(signal_name, shape, mesh)
