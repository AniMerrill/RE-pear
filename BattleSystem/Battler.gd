extends Node


export var type = ""
export var moniker = ""
export var hp = 5
export var attack = 1
export var defense = 1
export var isPlayer = false
var alive = true

var battleSystem = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func doTurn(battleSystem):
	if (alive):
		self.battleSystem = battleSystem
		if (isPlayer):
			doPlayerTurn()
		else:
			doAITurn()


func doPlayerTurn():
	# FIXME: get choice from player
	var choice = "Attack"
	match choice:
		"Attack":
			# FIXME: get target from player
			var target = null
			doAttack(target)
		_:
			# choice not found
			pass


func doAITurn():
	var choice = getAIChoice()
	match choice:
		"Attack":
			var target = getAITarget()
			doAttack(target)
		_:
			# choice not found
			pass


func getAIChoice ():
	# FIXME: determine choice randomly based on type
	return "Attack"


func getAITarget ():
	# FIXME: determine target randomly
	return null


func animateAttack():
	# FIXME: jump forward, wait 0.2 sec, jump back
	if (self.isPlayer):
		# forward is left
		pass
	else:
		# forward is right
		pass


func doAttack(target):
	# FIXME: message(moniker + " attacks!")
	var damage = defenderCalcDamageFrom(self.attack, self.power)
	target.takeDamage(damage)


func defenderCalcDamageFrom(attack, power):
	var damage = (attack * power) / self.defense
	return damage

func takeDamage(amount):
	# FIXME: message(moniker + " takes " + amount + "damage!")
	hp -= amount
	if hp < 0:
		die()


func die():
	self.alive = false
	# FIXME: destroy the battler object
