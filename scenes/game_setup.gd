extends Node2D

@onready var _cardBoard: TDCardBoard = $TDCardBoard

func _ready() -> void:
	var royalty : Array[CardInfo] = [
	CardInfo.new("JackofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/JackofWeapons.png", 11, "11 Health \n +2 Passive Weapon Bonus"),
	CardInfo.new("QueenofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/QueenofWeapons.png", 12, "12 Health"),
	CardInfo.new("KingofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/KingofWeapons.png", 13, "13 Health"),
	]
	
	var children = get_node("/root/Game/Pregame/StartingCardsSlots").find_children("*", "TDCardPositionMarker2D", false) as Array[TDCardPositionMarker2D]

	var roomSlots = children
	
	var i = 0
	for info in royalty:
		var data
		if(info.CardName.contains("Jack")):
			data = Character_Jack.new(info.CardName, info.TexturePath, info.Value, info.Lore)
		else:
			data = TDCardData_Character.new(info.CardName, info.TexturePath, info.Value, info.Lore)
		_cardBoard.AddCard(data,false,true, roomSlots[i])
		i+=1
		
