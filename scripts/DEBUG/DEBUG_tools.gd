extends Node2D
class_name GameHub
@onready var card_board: TDCardBoard = $DungeonNodes/CardBoard
@onready var dungeon_nodes: Node2D = $DungeonNodes
@onready var pregame: CharacterCardBoard = $CharacterOverlay


@export
var textures : Array[Texture2D]
@export var specialDeck : bool = false

func RandTex() -> Texture:
	return textures.pick_random()
	
func _ready():
	dungeon_nodes.hide()
	pregame.show()
	LoadDeck(specialDeck)
	Deck.Shuffle()
	Room.ReplenishRoom()
	return

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Debug-NewCard")):
		card_board.AddCard(TDCardData_Monster.new("Dev card", RandTex().resource_path, 14,TDCardData_Monster.MonsterType.Ghost, "Dev card: Monster"), false, true)
	if(Input.is_action_just_pressed("Debug-ReplenishRoom")):
		Room.ReplenishRoom()
	if(Input.is_action_just_pressed("Debug-PopulateDeck")):
		print("The P button was pressed")
		LoadDeck(specialDeck)
	if(Input.is_action_just_pressed("Debug-Shuffle")):
		Deck.Shuffle()
	if(Input.is_action_just_pressed("Debug-Flee")):
		Room.Flee()
		Room.ReplenishRoom()
	if(Input.is_action_just_pressed("Debug-AddAttackBonus")):
		WeaponManager.AddToAttackBonus(1)
	if(Input.is_action_just_pressed("Debug-AddPassiveBonus")):
		WeaponManager.AddToPassiveBonus(1)
	if(Input.is_action_just_pressed("Debug-AddWreath")):
		for card in card_board._selectedCards:
			if(!is_instance_valid(card)):
				continue
			print(card.CardName)
			const BASE_WREATH = preload("res://scenes/wreaths/base_wreath.tscn")
			var Data : TDCardData_Art = card.Data
			Data.AddWreath(BASE_WREATH.instantiate(), card)
		pass
	return
	
func LoadDeck(special : bool):
	var cardsToPut : Array[TDCardData] = []
	
	var deckToUse
	if(special):
		deckToUse = Room.specialDeck
	else:
		deckToUse = Room.standardDeck
		
	for info in deckToUse:
		var data
		match (info.Suit):
			info.SuitType.Monsters:
				data = TDCardData_Monster.new(info.CardName, info.TexturePath, info.Value, info.MonsterType, info.Lore)
				pass
			info.SuitType.Potions:
				data = TDCardData_Potion.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Ability)
				pass
			info.SuitType.Weapons:
				data = TDCardData_Weapon.new(info.CardName, info.TexturePath, info.Value, info.Lore)
				pass
		if(data):
			cardsToPut.append(data)
	Deck.PutArray(cardsToPut)
	return
