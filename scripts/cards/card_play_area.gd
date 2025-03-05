extends Area2D
class_name CardPlayArea

@export
var PlayType : String

func _ready() -> void:
	if(!PlayType):
		printerr("[CardPlayArea] PlayType not set. Card will not play properly when attempting to play here.")
	return
