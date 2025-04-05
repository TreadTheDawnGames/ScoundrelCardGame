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
	CardLibrary.SetActiveDeck(CardLibrary.DEV)
	LoadDeck(CardLibrary.ActiveDeck)
	Deck.Shuffle()
	Room.ReplenishRoom()
	return

func _process(_delta: float) -> void:
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
			var Data : TDCardData_Art = card.Data
			var wreath : Wreath = WreathLibrary.RandCompatible(Data)
			Data.AddWreath(wreath)
			Data.ShowAllWreaths(card)
	if(Input.is_action_just_pressed("Debug-ShowAllCards")):
		add_child(load("res://scenes/card overlays/Debug/debug-show_all_cards_overlay.tscn").instantiate())
	if(Input.is_action_just_pressed("Debug-OpenShop")):
		var shop = ShopOverlay.CreateNew([ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Weapons, [], false, 1,50,7),
						 ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Weapons,  [], false, 1, 3),
						 ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Wreaths, [], true, -5)])
		add_child(shop)
	return
	
func LoadDeck(deck : Array[CardInfo]):
	Deck.PutArray(CardInfo.MultipleCardsFromInfo(deck))
	return
