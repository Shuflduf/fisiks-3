extends MarginContainer



func _on_mesh_option_button_item_selected(index: int) -> void:
	print(index)
	match index:
		0:
			owner.box_mesh_changed.emit(BoxMesh.new())
		1:
			owner.box_mesh_changed.emit(SphereMesh.new())


func _on_collision_option_button_item_selected(index: int) -> void:
	match index:
		0:
			owner.box_collision_changed.emit(BoxShape3D.new())
		1:
			owner.box_collision_changed.emit(SphereShape3D.new())
