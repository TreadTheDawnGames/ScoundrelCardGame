extends Area2D
class_name TDCardPlayArea

@export
var PlayType : String

func _ready() -> void:
	if(!PlayType or PlayType.length() <= 0):
		printerr("[CardPlayArea] PlayType not set. Card will not play properly when attempting to play here.")
	return
