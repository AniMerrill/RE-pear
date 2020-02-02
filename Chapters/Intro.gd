extends Node2D

export var delay : float
export var nextChapter : String

func _ready():
	yield(get_tree().create_timer(delay), "timeout")
#	ChapterManager.gotoChapter(self, self.nextChapter)
	queue_free()
	get_tree().change_scene(nextChapter)
