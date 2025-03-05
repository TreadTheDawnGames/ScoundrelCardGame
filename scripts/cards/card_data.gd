extends Node
class_name CardData

var PathToPhysObj : String
var CardName : String
var discardable : bool
var playable : bool
var Slot : CardSlot

func _init(path : String, cardName:String) -> void:
	PathToPhysObj = path
	CardName = cardName
	return
	
func _to_string() -> String:
	var other = "null"
	if(PathToPhysObj != null):
		other = PathToPhysObj
	return "Name: " + name + " | Value: " + other
	
