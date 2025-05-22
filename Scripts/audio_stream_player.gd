extends AudioStreamPlayer

const music = preload("res://Assets/Audio/arcade-beat.mp3")

func play_music(audio: AudioStream, volume = 0):
	if stream == audio:
		pass
	stream = music
	volume_db = volume
	play()
	
func play_music_intro():
	play_music(music, -8)
