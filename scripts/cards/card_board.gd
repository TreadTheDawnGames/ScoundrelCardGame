extends Node2D
class_name TDCardBoard

var _board : Array[TDCard]
var _selectedCards : Array[TDCard]
@export
var cardSceneSource : PackedScene
var MONSTER_CARD : PackedScene = preload("res://scenes/cards/TDCard_Monster.tscn")
var WEAPON_CARD : PackedScene = preload("res://scenes/cards/TDCard_Weapon.tscn")
var BASE_CARD : PackedScene = preload("res://scenes/cards/card.tscn")
var POTION_CARD : PackedScene = preload("res://scenes/cards/TDCard_base.tscn")
var SHOP_CARD : PackedScene = preload("res://scenes/cards/TDCard_Shop.tscn")



func AddCard(data : TDCardData, isAesthetic : bool, useGoToPos : bool = false, goToPos : TDCardPositionMarker2D = null) -> TDCard:
	var card = CreateCardFromData(data, isAesthetic, useGoToPos, goToPos)
	if(!card):
		printerr("[TDCardBoard] Unable to create card to add to board.")
		return
	add_child(card)
	card.SetUsable(true)
	card.scale *= 4
	_board.push_back(card)
	return card

func AddCardFromItsScene(data : TDCardData, isAesthetic : bool, useGoToPos : bool = false, slot : TDCardPositionMarker2D = null) -> TDCard:
	var card
	if(data is TDCardData_Monster):
		card = AddCardFromSource(MONSTER_CARD, data, isAesthetic, useGoToPos, slot)
	elif(data is TDCardData_Weapon):
		card = AddCardFromSource(WEAPON_CARD, data, isAesthetic, useGoToPos, slot)
	elif(data is TDCardData_Ability):
		card = AddCardFromSource(POTION_CARD, data, isAesthetic, useGoToPos, slot)
	elif(data is TDCardData_Shop):
		card = AddCardFromSource(SHOP_CARD, data, isAesthetic, useGoToPos, slot)
	else:
		if(data):
			printerr("CardData not recognize for card \"" + data.CardName +".\" Defaulting to Base Card")
			card = AddCardFromSource(BASE_CARD, data, isAesthetic, useGoToPos, slot)
		else:
			printerr("Unreconglized CardData: null")
	return card

func AddCardFromSource(source : PackedScene, data : TDCardData, isAesthetic : bool, useGoToPos : bool = false, goToPos : TDCardPositionMarker2D = null):
	var card = CreateCardFromData(data, isAesthetic, useGoToPos, goToPos, source)
	if(!card):
		return
	add_child(card)
	card.SetUsable(true)
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
	if(!data):
		var reason : String = ""
		if(!data):
			reason += "Data was null"
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
	
func SetBoardActive(active : bool):
	for card in _board:
		if(is_instance_valid(card)):
			card.SetUsable(active)
	return
