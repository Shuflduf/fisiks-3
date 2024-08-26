extends HBoxContainer

@export var signal_name: String

func _on_check_box_toggled(toggled_on: bool) -> void:
	owner.emit_signal(signal_name, toggled_on)
