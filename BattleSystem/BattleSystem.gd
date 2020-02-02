extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var enemies = []
export var friendlies = []
var battleActive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	startBattle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if battleActive:
#		
#		doRound()


# input event - runs when the input happens
func _input(event):
	#if battleActive and event.is_action_pressed("jump"):
	if event is InputEventKey:
		if battleActive and event.pressed and event.scancode == KEY_SPACE:
			doRound()


func startBattle():
	# instantiate battlers and position them
	addBattlers()
	# FIXME: enter battle loop
	self.battleActive = true
	# battleLoop()


func addBattlers():
	# FIXME: add battlers
	print("adding battlers")
	pass


func doRound():
	# while battleActive:
		print("new round")
		if hasPlayerWon():
			win()
		if hasPlayerLost():
			lose()
		
		# do player turn
		for battler in friendlies:
			battler.doTurn()
		
		# for each enemy, do turns
		for battler in enemies:
			battler.doTurn()


func hasPlayerWon():
	# are all enemies dead
	var anyAlive = false
	for battler in enemies:
		if battler.alive:
			anyAlive = true 
	return !anyAlive


func hasPlayerLost():
	# are all friendlies dead
	var anyAlive = false
	for battler in friendlies:
		if battler.alive:
			anyAlive = true 
	return !anyAlive


func win():
	# FIXME: go back to map
	print("battle won")
	battleActive = false
	pass


func lose():
	# FIXME: go to gameover
	print("battle lost")
	battleActive = false
	pass
