extends Control
var x 

func _ready() -> void:
	$VideoStreamPlayer.set_stream(load("res://Assets/Yan-Ken-Pon.ogv"))
	$VideoStreamPlayer.play()
	#$VideoStreamPlayer.autoplay()
	
func _on_volver_pressed() -> void:
	x = "res://Escenas/Menu.tscn"
	$EfectoBoton.play()
	
func _on_imgs_pressed() -> void:
	x = "res://Escenas/Galeria.tscn"
	$EfectoBoton.play()
	
func _on_play_pressed() -> void:
	$VideoStreamPlayer.set_paused(false)

func _on_pause_pressed() -> void:
	$VideoStreamPlayer.set_paused(true)

func _on_efecto_boton_finished() -> void:
	if x == null:
		pass
	else:
		get_tree().change_scene_to_file(x)
