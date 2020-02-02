extends Node


export var next_scene := ""
export var seconds_to_wait := -1


func _ready():
	SceneTransition.fade_in()
	yield(SceneTransition.get_node("AnimationPlayer"), "animation_finished")
	
	if seconds_to_wait >= 0:
		$Timer.connect("timeout", self, "_on_timeout")
		$Timer.start(seconds_to_wait)


func _on_timeout():
	$Timer.stop()
	
	SceneTransition.fade_out()
	yield(SceneTransition.get_node("AnimationPlayer"), "animation_finished")
	
	get_tree().change_scene("res://Screens/TitleScreen.tscn")
