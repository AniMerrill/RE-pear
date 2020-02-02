extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func fade_in():
	$AnimationPlayer.play("scene_fade_transition")


func fade_out():
	$AnimationPlayer.play_backwards("scene_fade_transition")
