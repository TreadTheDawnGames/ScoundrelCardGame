class_name CardData

var PathToPhysObj : String
var CardName : String
var discardable : bool
var playable : bool
var Slot : CardSlot

func _init(path : String, cardName : String) -> void:
	PathToPhysObj = path
	CardName = cardName
	return
	
func _to_string() -> String:
	var other = "null"
	if(PathToPhysObj != null):
		other = PathToPhysObj
	return "Name: " + CardName + " | Value: " + other
	
func PlayCard(playType : String, card : Card) -> void:
	printerr("[CardData] PlayCard has not been implemented. card: " + card.cardName + " playType: " + playType)
	return
