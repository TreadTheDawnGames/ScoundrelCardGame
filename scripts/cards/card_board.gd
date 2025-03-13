extends Node2D
class_name TDCardBoard

var _board : Array[TDCard]
var _selectedCards : Array[TDCard]
@export
var cardSceneSource : PackedScene

func AddCard(data : TDCardData, isAesthetic : bool, useGoToPos : bool = false, goToPos : TDCardPositionMarker2D = null) -> TDCard:
	var card = CreateCardFromData(data, isAesthetic, useGoToPos, goToPos)
	if(!card):
		return
	add_child(card)
	card.SetDrawn(true)
	_board.push_back(card)
	return card
	
func AddCardFromSource(source : PackedScene, data : TDCardData, isAesthetic : bool, useGoToPos : bool = false, goToPos : TDCardPositionMarker2D = null):
	var card = CreateCardFromData(data, isAesthetic, useGoToPos, goToPos, source)
	if(!card):
		return
	add_child(card)
	card.SetDrawn(true)
	_board.push_back(card)
	return card
	
func RemoveCard(card : TDCard):
	_board.erase(card)
	card.queue_free()
	return

func ContainsCard(card : TDCard) -> bool:
	return _board.has(card)

func SelectCard(card : TDCard) -> void:
	_selectedCards.push_back(card)
	return

func DeselectCard(card : TDCard) -> void:
	_selectedCards.erase(card)
	return

func DeselectAll() -> void:
	_selectedCards.resize(0)
	return

func CreateCardFromData(data : TDCardData, isAesthetic : bool, useGoToPos : bool = false, goToPos : TDCardPositionMarker2D = null, source : PackedScene = null) -> TDCard:
	if(!data || !cardSceneSource):
		var reason : String = ""
		if(!data):
			reason += "Data was null"
		if(!cardSceneSource):
			if(reason.length() > 0):
				reason += ", "
			reason += "cardSceneSource was invalid"
		reason += "."
		printerr("[CardBoard] Unable to create card: " + reason)
		return null
	var unpackedScene
	if(source):
		unpackedScene = source.instantiate()
	else:
		unpackedScene = cardSceneSource.instantiate()
	
	if(unpackedScene is TDCard):
		unpackedScene.SetUp(data, isAesthetic, useGoToPos, goToPos)
	else:
		printerr("\""+unpackedScene.get_class()+"\"" + " is not a TDCard. The root node of your card object must be a TDCard.")
		unpackedScene.queue_free()
		return null
	return unpackedScene
	
