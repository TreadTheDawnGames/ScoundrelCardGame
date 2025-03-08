class_name CardData

var CardName : String
var discardable : bool
var playable : bool
var Slot : CardSlot
var Art : Texture2D

func _init(cardName : String, art : Texture2D) -> void:
	CardName = cardName
	Art = art
	return
	
func _to_string() -> String:
	var other = "null"
	return "Name: " + CardName + " | Value: " + other
	
func PlayCard(playType : String, card : Card) -> void:
	printerr("[CardData] PlayCard has not been implemented. card: " + card.cardName + " playType: " + playType)
	return

func SpecialSetup():
	# printerr("[CardData] SpecialSetup has not been implemented. card: " + CardName)
	return
