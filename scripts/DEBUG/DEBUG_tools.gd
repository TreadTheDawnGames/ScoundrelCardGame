extends Node
@onready var room_manager: RoomManager = $RoomManager
@onready var card_board: TDCardBoard = $CardBoard


@export
var textures : Array[Texture2D]

func RandTex() -> Texture:
	return textures.pick_random()

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Debug-NewCard")):
		card_board.AddCard(TDCardData_Monster.new("CardName", RandTex(), 14,TDCardData_Monster.MonsterType.Ghost), false)
	if(Input.is_action_just_pressed("Debug-ReplenishRoom")):
		room_manager.ReplenishRoom()
	if(Input.is_action_just_pressed("Debug-PopulateDeck")):
		var cardsToPut : Array[TDCardData] = [
		TDCardData_Monster.new("AceOfGhosts", textures[0], 14,TDCardData_Monster.MonsterType.Ghost),
		TDCardData_Potion.new("AceOfPotions", textures[1], 14),
		TDCardData_Weapon.new("AceOfWeapons", textures[2], 14),
		TDCardData_Monster.new("AceOfGhosts", textures[0], 14,TDCardData_Monster.MonsterType.Ghost),
		TDCardData_Potion.new("AceOfPotions", textures[1], 14),
		TDCardData_Weapon.new("AceOfWeapons", textures[2], 14),
		TDCardData_Monster.new("AceOfGhosts", textures[0], 14,TDCardData_Monster.MonsterType.Ghost),
		TDCardData_Potion.new("AceOfPotions", textures[1], 14),
		TDCardData_Weapon.new("AceOfWeapons", textures[2], 14),
		TDCardData_Monster.new("AceOfGhosts", textures[0], 14,TDCardData_Monster.MonsterType.Ghost),
		TDCardData_Potion.new("AceOfPotions", textures[1], 14),
		TDCardData_Weapon.new("AceOfWeapons", textures[2], 14),
		]
		Deck.PutArray(cardsToPut)
	return
