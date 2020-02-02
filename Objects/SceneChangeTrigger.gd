extends Area2D


export var scene : String
export var player_position := Vector2.ZERO


func _ready():
	connect("body_entered", self, "_on_body_entered")


func _on_body_entered(body):
	if body.name == "Player":
		queue_free()
		get_tree().change_scene(scene)
		
		Globals.player_new_position = player_position
		Globals.set_player_to_position = true
