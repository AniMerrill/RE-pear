extends Node2D

export var title : String
export var nextChapter : String

func _ready():
	if self.title:
		MessageSystem.showMessage(self.title)
	print(self.name)

# input event - runs when the input happens
func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("ui_accept"):
			queue_free()
			get_tree().change_scene(nextChapter)
#			ChapterManager.gotoChapter(self, self.nextChapter)
