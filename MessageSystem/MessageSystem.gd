extends Node

var is_showing_message: bool = false
var label: Label
var box: Control


func _ready():
	box = self.find_node("MessageBox")
	label = self.find_node("MessageLabel")
	hideMessage()


func _input(event):
	if self.is_showing_message:
		if event is InputEventKey and Input.is_action_pressed("ui_accept"):
			hideMessage()


func showMessage(message):
	print("showMessage: " + message)
	self.box.show()
	self.label.text = message
	self.is_showing_message = true


func hideMessage():
	print("hideMessage")
	self.box.hide()
	self.is_showing_message = false
	
