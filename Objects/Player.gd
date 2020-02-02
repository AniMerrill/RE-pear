extends KinematicBody2D


export var tiles_per_second := 10.0

var velocity := Vector2.ZERO
var speed := Globals.UNIT_SIZE * tiles_per_second


# NOTE: Player's origin point is the top right of their hitbox
func _ready():
	if Globals.set_player_to_position:
		global_position = Globals.player_new_position
		Globals.set_player_to_position = false

func _physics_process(delta):
	var left := Input.is_action_pressed("ui_left")
	var right := Input.is_action_pressed("ui_right")
	var up := Input.is_action_pressed("ui_up")
	var down := Input.is_action_pressed("ui_down")
	
	var dir_x := int(right) - int(left)
	var dir_y := int(down) -int(up)
	
	if dir_x == 0 or dir_y == 0:
		if dir_x != 0:
			if dir_x > 0:
				$Sprite.flip_h = false
			elif dir_x < 0:
				$Sprite.flip_h = true
			
			$Sprite.frame = 2
			
			velocity.x = speed * dir_x
			velocity.y = 0
		elif dir_y != 0:
			if dir_y > 0:
				$Sprite.frame = 0
			elif dir_y < 0:
				$Sprite.frame = 1
			
			$Sprite.flip_h = false
			
			velocity.y = speed * dir_y
			velocity.x = 0
		else:
			velocity = Vector2.ZERO
	
	move_and_slide(velocity)
