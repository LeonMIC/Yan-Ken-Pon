extends Button

func _on_pressed() -> void:
	$"../EfectoBoton".play()
	pass # Replace with function body.

func _on_efecto_boton_finished() -> void:
	get_tree().change_scene_to_file("res://Escenas/Menu.tscn")
	pass # Replace with function body.
	
