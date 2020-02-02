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
	self.enemies = get_tree().get_nodes_in_group("enemies")
	self.friendlies = get_tree().get_nodes_in_group("friendlies")
#	self.enemies.append(self.get_node("BattlerLettuce1"))
#	self.enemies.append(self.get_node("BattlerLettuce2"))
#	self.enemies.append(self.get_node("BattlerLettuce3"))
#	self.friendlies.append(self.get_node("BattlerPear1"))
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
			battler.doTurn(self)
		
		# for each enemy, do turns
		for battler in enemies:
			battler.doTurn(self)


func hasPlayerWon():
	# are all enemies dead
	var anyAlive = false
	for battler in enemies:
		print(battler)
		if battler.alive:
			anyAlive = true 
	return !anyAlive


func hasPlayerLost():
	# are all friendlies dead
	var anyAlive = false
	for battler in friendlies:
		print(battler)
		if battler.alive:
			anyAlive = true 
	return !anyAlive


func win():
	# FIXME: go back to map
	MessageSystem.message("Battle won!")
	print("battle won")
	battleActive = false
	pass


func lose():
	# FIXME: go to gameover
	MessageSystem.message("Battle lost!")
	print("battle lost")
	battleActive = false
	pass


func getRandomFriendly():
	# FIXME: make random
	# FIXME: guard vs out of bounds
	var result = self.friendlies[0]
	print("get random friendly:", self.friendlies, result)
	return result
	
func getRandomEnemy():
	# FIXME: make random
	# FIXME: guard vs out of bounds
	var result = self.enemies[0]
	print("get random friendly:", self.enemies, result)
	return result
