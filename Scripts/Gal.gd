extends Control

var textura
var image
var i = 0
var i_totales = 3
var x = null

var textura_piedra = preload("res://Assets/Mano_Piedra.png")
var textura_papel = preload("res://Assets/Mano_Papel.png")
var textura_tijera = preload("res://Assets/Mano_Tijera.PNG")

func _ready() -> void:
	var img = [textura_papel, textura_piedra, textura_tijera]
	#image = Image.load_from_file(img[i])
	#textura = ImageTexture.create_from_image(image)
	$Sprite2D.texture = img[i]

func _on_next_pressed() -> void:
	$EfectoBoton.play()
	i = i + 1
	if i == (i_totales):
		i = 0
	_ready()

func _on_past_pressed() -> void:
	$EfectoBoton.play()
	i = i - 1
	if i == -1:
		i = (i_totales-1)
	_ready()

func _on_volver_pressed() -> void:
	x = "res://Escenas/Menu.tscn"
	$EfectoBoton.play()
	
func _on_video_pressed() -> void:
	x = "res://Escenas/GaleriaVideo.tscn"
	$EfectoBoton.play()

func _on_efecto_boton_finished() -> void:
	if x == null:
		pass
	else:
		get_tree().change_scene_to_file(x)
