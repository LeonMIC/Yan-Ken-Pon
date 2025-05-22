extends Control
var x: String

func _ready():
	$AnimationPlayer.play("prueba")
	$AnimationPlayer.queue("Logo")
	$Volumen.hide()

func _input(event):
	if event is InputEventMouseButton:
		$AnimationPlayer.seek(2.0)
	
func _on_b_creditos_pressed() -> void:
	$EfectoBoton.play()
	x = "res://Escenas/Creditos.tscn"
	
func _on_b_galeria_pressed() -> void:
	x = "res://Escenas/Galeria.tscn"
	$EfectoBoton.play()
	
func _on_b_jugar_pressed() -> void:
	x = "res://Escenas/Presentacion.tscn"
	$EfectoBoton.play()

func _on_volume_control_pressed() -> void:
		x = "no"
		$EfectoBoton.play()

func _on_efecto_boton_finished() -> void:
	if x == "no" and $Volumen.visible == false:
		$Volumen.visible = true
	elif x == "no" and $Volumen.visible == true:
		$Volumen.visible = false
	else:
		get_tree().change_scene_to_file(x)
