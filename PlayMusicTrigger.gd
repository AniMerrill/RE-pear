extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var music = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.playMusic(music)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
