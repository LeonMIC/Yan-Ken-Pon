extends Marker2D

@export var character_id: String

func _ready():
	await get_tree().process_frame  # Espera al menos 1 frame
	if Dialogic.VAR.has("character_nodes"):
		print("Registrando personaje: ", character_id)
		Dialogic.VAR.character_nodes[character_id] = self
