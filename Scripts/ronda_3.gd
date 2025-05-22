extends Node2D

var resultado_partida = ""

func _ready() -> void:
	$Juego.visible = false
	$Prota.play("Caminar")
	$Morado.play("default")
	$AnimationPlayer.play("Comienzo")
	Dialogic.signal_event.connect(_DialogicSignal)
	$Juego.connect("partida_terminada", Callable(self, "_on_partida_terminada"))

func _DialogicSignal(arg: String):
	if arg == "Empezar":
		$Juego.visible = true
	if arg == "Siguiente":
		$Juego.visible = false
		$AnimationPlayer.play("Irse")

func _on_partida_terminada(resultado: String) -> void:
	resultado_partida = resultado
	print("Señal partida_terminada recibida con resultado:", resultado)
	if $Juego.emit_signal("gano"):
		Dialogic.start("DV_Morado")
	elif $Juego.emit_signal("pierde"):
		Dialogic.start("DD_Morado")
	$Juego.visible = false

func _on_animation_player_animation_finished(nombre: String) -> void:
	if nombre == "Comienzo":
		Dialogic.start("D1_Morado")
	elif nombre == "Irse":
		$AnimationPlayer.play("Ronda2")
	elif nombre == "Ronda2":
		get_tree().change_scene_to_file("res://Escenas/Victoria.tscn")
