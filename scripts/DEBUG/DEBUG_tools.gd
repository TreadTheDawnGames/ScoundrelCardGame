extends Node2D
class_name GameHub
#@export var card_board: TDCardBoard = $DungeonNodes/CardBoard
#@onready var UICanvas = $DungeonNodes/Canvas
#@onready var dungeon_nodes: Node2D = $DungeonNodes
#@onready var pregame: CharacterCardBoard = $CharacterOverlay
var hoveredCards : Array[TDCard]

@export
var textures : Array[Texture2D]
@export var specialDeck : bool = false

func RandTex() -> Texture:
	return textures.pick_random()
	
func _ready():
	#dungeon_nodes.hide()
	#UICanvas.hide()
	#pregame.show()
	CardLibrary.SetActiveDeck(CardLibrary.SPECIAL)
	LoadDeck(CardLibrary.DEV)
	Dungeon.instance.Deck.Shuffle()
	Dungeon.instance.Room.ReplenishRoom()
	#var wreathApplyScene :AssignWreathsOverlay = ShopOverlay.APPLY_WREATHS.instantiate()
	#wreathApplyScene.SetTitle("Assign Gold Wreaths")
	#wreathApplyScene.boughtWreaths = [WreathLibrary.Gold(),WreathLibrary.Gold(),WreathLibrary.Gold(),WreathLibrary.Gold(),]
	#dungeon_nodes.add_child.call_deferred(wreathApplyScene)
	#wreathApplyScene.scale *= 0.25
	#wreathApplyScene.shuffleOnClose = true
	return

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Debug-Shuffle")):
		Dungeon.instance.Deck.Shuffle()
	if(Input.is_action_just_pressed("Debug-Flee")):
		Dungeon.instance.Room.Flee()
		Dungeon.instance.Room.ReplenishRoom()
	if(Input.is_action_just_pressed("Debug-AddAttackBonus")):
		Dungeon.instance.WeaponManager.AddToAttackBonus(1)
	if(Input.is_action_just_pressed("Debug-AddPassiveBonus")):
		Dungeon.instance.WeaponManager.AddToPassiveBonus(1)
	if(Input.is_action_just_pressed("Debug-Heal")):
		Dungeon.instance.Health.Heal(Dungeon.instance.Health.maxHealth)
	if(Input.is_action_just_pressed("Debug-AddWreath")):
		for card in Dungeon.instance.Room.card_board._selectedCards:
			if(!is_instance_valid(card)):
				push_warning("Invalid card instance in GameHub.Debug-AddWreath.")
				continue
			print(card.CardName)
			var Data : TDCardData_Art = card.Data
			var wreath : Wreath = WreathLibrary.RandCompatible(Data)
			Data.AddWreath(wreath)
			Data.ShowAllWreaths(card)
	if(Input.is_action_just_pressed("Debug-ShowAllCards")):
		Dungeon.instance.Canvas.add_child(load("res://scenes/card overlays/Debug/debug-show_all_cards_overlay.tscn").instantiate())
	if(Input.is_action_just_pressed("Debug-OpenShop")):
		var shop = ShopOverlay.CreateNew([ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Weapons, [], false, 1,50,7),
						 ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Weapons,  [], false, 1, 3),
						 ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Wreaths, [], true, -5)])
		add_child(shop)
	if(Input.is_action_just_pressed("Debug-AddMoney")):
		Dungeon.instance.Money.AlterMoney(10)
	return
	
func LoadDeck(deck : Array[CardInfo]):
	Dungeon.instance.Deck.PutArray(CardInfo.MultipleCardsFromInfo(deck))
	return
