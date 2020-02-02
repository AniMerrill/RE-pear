extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func playMusic(music):
	var musicNode = get_node(music)
	if musicNode is AudioStreamPlayer:
		if !musicNode.playing:
			stopMusic()
			musicNode.play()

func stopMusic():
	for musicNode in get_children():
		if musicNode is AudioStreamPlayer:
			musicNode.stop()
