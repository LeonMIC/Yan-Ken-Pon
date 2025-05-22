extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Menu.visible = false
	$Prota.play("Caminar")
	$OldMan.play("default")
	$AnimationPlayer.play("Intro")
	Dialogic.signal_event.connect(_DialogicSignal)

func _DialogicSignal(arg: String):
	if arg == "Siguiente":
		$AnimationPlayer.play("Ronda1")

func _on_animation_player_animation_finished(nombre: String) -> void:
	if nombre == "Intro":
		Dialogic.start("DF_Presentador")
	elif nombre == "Ronda1":
		$Menu.visible = true
	
func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Menu.tscn")
