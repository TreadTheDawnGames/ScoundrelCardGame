extends Node
class_name CardFactory

static func CreateCardFromData(data : CardData) -> Card:
	if(!data):
		return null
	var unpackedScene : Card = load("res://scenes/cards/card.tscn").instantiate()
	unpackedScene.SetUp(data, false)
	return unpackedScene
