extends Node2D
class_name GameHub
@onready var card_board: TDCardBoard = $DungeonNodes/CardBoard
@onready var dungeon_nodes: Node2D = $DungeonNodes
@onready var pregame: CharacterCardBoard = $CharacterOverlay
var hoveredCards : Array[TDCard]

@export
var textures : Array[Texture2D]
@export var specialDeck : bool = false

func RandTex() -> Texture:
	return textures.pick_random()
	
func _ready():
	dungeon_nodes.hide()
	pregame.show()
	LoadDeck(Room.standardDeck)
	Deck.Shuffle()
	Room.ReplenishRoom()
	return

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Debug-NewCard")):
		card_board.AddCard(TDCardData_Monster.new("Dev card", RandTex().resource_path, 14,TDCardData_Monster.MonsterType.Ghost, "Dev card: Monster"), false, true)
	if(Input.is_action_just_pressed("Debug-ReplenishRoom")):
		Room.ReplenishRoom()
	if(Input.is_action_just_pressed("Debug-Shuffle")):
		Deck.Shuffle()
	if(Input.is_action_just_pressed("Debug-Flee")):
		Room.Flee()
		Room.ReplenishRoom()
	if(Input.is_action_just_pressed("Debug-AddAttackBonus")):
		WeaponManager.AddToAttackBonus(1)
	if(Input.is_action_just_pressed("Debug-AddPassiveBonus")):
		WeaponManager.AddToPassiveBonus(1)
	if(Input.is_action_just_pressed("Debug-Heal")):
		Health.Heal(Health.maxHealth)
	if(Input.is_action_just_pressed("Debug-AddWreath")):
		for card in card_board._selectedCards:
			if(!is_instance_valid(card)):
				continue
			print(card.CardName)
			const BASE_WREATH = preload("res://scenes/wreaths/sharp_wreath.tscn")
			var Data : TDCardData_Art = card.Data
			Data.AddWreath(BASE_WREATH.instantiate(), card)
	if(Input.is_action_just_pressed("Debug-ShowAllCards")):
		add_child(load("res://scenes/card overlays/Debug/card_board_overlay.tscn").instantiate())
	return
	
func LoadDeck(deck : Array[CardInfo]):
	Deck.PutArray(CardInfo.MultipleCardsFromInfo(deck))
	return
