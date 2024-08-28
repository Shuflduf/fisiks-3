extends WorldEnvironment





func _on_ui_ssr_toggled(enabled: bool) -> void:
	environment.ssr_enabled = enabled


func _on_ui_ssao_toggled(enabled: bool) -> void:
	environment.ssao_enabled = enabled


func _on_ui_ssil_toggled(enabled: bool) -> void:
	environment.ssil_enabled = enabled


func _on_ui_sdfgi_toggled(enabled: bool) -> void:
	environment.sdfgi_enabled = enabled
