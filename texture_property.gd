extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in DirAccess.get_files_at("res://assets/textures/"):
		if i.ends_with(".import"):
			continue
		print(i)
		var new_texture = TextureRect.new()
		new_texture.texture = ResourceLoader.load("res://assets/textures/" + i)
		new_texture.name = i + "T"
		new_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		new_texture.custom_minimum_size = Vector2(150, 150)
		new_texture.gui_input.connect(_on_new_texture_rect_gui_input.bind(i))
		$TextureSelection/Textures.add_child(new_texture)

func _on_new_texture_rect_gui_input(event: InputEvent, texture_name: String) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			$TextureRect.texture = ResourceLoader.load("res://assets/textures/" + texture_name)
			$"../../..".active_material.albedo_texture = $TextureRect.texture

func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			$TextureSelection.position = event.global_position
			$TextureSelection.show()
