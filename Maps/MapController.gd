extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var map_rect : Rect2 = $base.get_used_rect()
	$Player/Camera2D.limit_left = map_rect.position.x * Globals.UNIT_SIZE
	$Player/Camera2D.limit_top = map_rect.position.y * Globals.UNIT_SIZE
	$Player/Camera2D.limit_right = map_rect.end.x * Globals.UNIT_SIZE
	$Player/Camera2D.limit_bottom = map_rect.end.y * Globals.UNIT_SIZE


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
