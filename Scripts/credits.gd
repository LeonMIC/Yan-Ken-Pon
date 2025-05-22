extends Control

var x

func _ready() -> void:
	$AnimationPlayer.play("Créditos")

### BOTONES ###

func _on_volver_pressed() -> void:
	x = "res://Escenas/Menu.tscn"
	$EfectoBoton.play()

func _on_efecto_boton_finished() -> void:
	get_tree().change_scene_to_file(x)
