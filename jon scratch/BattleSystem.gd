extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemies = []
var friendlies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func battleLoop ():
	
	if(hasPlayerWon()):
		win()
	if(hasPlayerLost()):
		lose()
	
	# do player turn
	for battler in friendlies:
		battler.doTurn()
	
	# for each enemy, do turns
	for battler in enemies:
		battler.doTurn()


func hasPlayerWon():
	if(enemies.size() == 0):
		return true


func hasPlayerLost():
	if(enemies.size() == 0):
		return true


func win():
	# go back to map
	pass


func lose():
	# go to gameover
	pass
