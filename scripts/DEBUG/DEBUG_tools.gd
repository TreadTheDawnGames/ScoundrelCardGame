extends Node2D
@onready var card_board: TDCardBoard = $CardBoard


@export
var textures : Array[Texture2D]

func RandTex() -> Texture:
	return textures.pick_random()
	
func _ready():
	LoadDeck()
	Deck.Shuffle()
	Room.ReplenishRoom()
	return

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Debug-NewCard")):
		card_board.AddCard(TDCardData_Monster.new("CardName", RandTex().resource_path, 14,TDCardData_Monster.MonsterType.Ghost), false, true)
	if(Input.is_action_just_pressed("Debug-ReplenishRoom")):
		Room.ReplenishRoom()
	if(Input.is_action_just_pressed("Debug-PopulateDeck")):
		print("The P button was pressed")
		LoadDeck()
	if(Input.is_action_just_pressed("Debug-Shuffle")):
		Deck.Shuffle()
	if(Input.is_action_just_pressed("Debug-Flee")):
		Room.Flee()
		Room.ReplenishRoom()
	return
	
func LoadDeck():
	var cardsToPut : Array[TDCardData] = []
	
	for info in Room.standardDeck:
		var data
		match (info.Suit):
			info.SuitType.Monsters:
				data = TDCardData_Monster.new(info.CardName, info.TexturePath, info.Value, info.MonsterType)
				pass
			info.SuitType.Potions:
				data = TDCardData_Potion.new(info.CardName, info.TexturePath, info.Value, info.PodDes)
				pass
			info.SuitType.Weapons:
				data = TDCardData_Weapon.new(info.CardName, info.TexturePath, info.Value)
				pass
		if(data):
			cardsToPut.append(data)
	Deck.PutArray(cardsToPut)
	return
