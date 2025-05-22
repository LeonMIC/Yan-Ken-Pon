extends Control

signal partida_terminada(resultado)
var opciones = ["piedra", "papel", "tijera"]
var selec_opp
var image
var textura
var player_opc
var player_selec
var player_points = 0
var opp_points = 0

#texturas
var textura_piedra = preload("res://Assets/CPiedra.png")
var textura_papel = preload("res://Assets/CPapel.png")
var textura_tijera = preload("res://Assets/CTijera.png")

func _ready():
	randomize()

func _opp():
	selec_opp = opciones[randi_range(0, 2)]

func _on_piedra_pressed() -> void:
	player_opc = 0
	_play()

func _on_papel_pressed() -> void:
	player_opc = 1
	_play()

func _on_tijera_pressed() -> void:
	player_opc = 2
	_play()

func _ShowCardsPlayer():
	match player_selec:
		"piedra":
			image = textura_piedra
		"papel":
			image = textura_papel
		"tijera":
			image = textura_tijera
	$Carta2.texture = image

func _ShowCardsOpp():
	match selec_opp:
		"piedra":
			image = textura_piedra
		"papel":
			image = textura_papel
		"tijera":
			image = textura_tijera
	$Carta.texture = image

func _play():
	_disable_buttons()

	$AnimationPlayer.play("mov_cards")

	player_selec = opciones[player_opc]
	_opp()

	_ShowCardsPlayer()
	_ShowCardsOpp()

	# Resultado
	if player_selec == "piedra" and selec_opp == "tijera" \
	or player_selec == "tijera" and selec_opp == "papel" \
	or player_selec == "papel" and selec_opp == "piedra":
		player_points += 1
		$Declaracion.text = "+1 punto para el jugador"
		$"Puntos Jugador/NumPuntos".text = str(player_points)

	elif selec_opp == "piedra" and player_selec == "tijera" \
	or selec_opp == "tijera" and player_selec == "papel" \
	or selec_opp == "papel" and player_selec == "piedra":
		opp_points += 1
		$Declaracion.text = "+1 punto para el contrincante"
		$"Puntos Enemigo/NumPuntos".text = str(opp_points)
	else:
		$Declaracion.text = "Empate"

	await get_tree().create_timer(1.5).timeout

	# Verificar
	if player_points >= 2:
		$Declaracion.text = "¡El jugador gana la partida!"
		emit_signal("partida_terminada", "gano")
		print("Señal emitida.")
	elif opp_points >= 2:
		$Declaracion.text = "¡El contrincante gana la partida!"
		#emit_signal("partida_terminada", "pierde")
		#print("Señal emitida.")
		$Reiniciar.visible = true
		$Menu.visible = true
	else:
		$AnimationPlayer.play("RESET")
		_enable_buttons() 

func _on_reiniciar_pressed() -> void:
	player_points = 0
	opp_points = 0
	$Declaracion.text = ""
	$"Puntos Jugador/NumPuntos".text = "0"
	$"Puntos Enemigo/NumPuntos".text = "0"
	$AnimationPlayer.play("RESET")
	
	# Botonoes invisibles
	$Reiniciar.visible = false
	$Menu.visible = false

	_enable_buttons()

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Menu.tscn")

func _disable_buttons():
	$Piedra.disabled = true
	$Papel.disabled = true
	$Tijera.disabled = true

func _enable_buttons():
	$Piedra.disabled = false
	$Papel.disabled = false
	$Tijera.disabled = false
