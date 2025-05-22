extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Prota.play("Caminar")
	$OldMan.play("default")
	$AnimationPlayer.play("Intro")
	Dialogic.signal_event.connect(_DialogicSignal)
	pass # Replace with function body.

func _DialogicSignal(arg: String):
	if arg == "Empezar":
		$AnimationPlayer.play("Irse")

func _on_animation_player_animation_finished(nombre: String) -> void:
	if nombre == "Intro":
		Dialogic.start("D_Presentador")
	elif nombre == "Irse":
		$AnimationPlayer.play("Ronda1")
	elif nombre == "Ronda1":
		get_tree().change_scene_to_file("res://Escenas/Ronda1.tscn")
	
