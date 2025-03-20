extends Node
class_name RoomManager

@export
var roomSlots : Array[Node]
var roomCards : Array[TDCard]
@onready var card_board: TDCardBoard = $"/root/Game/DungeonNodes/CardBoard"
@export var monsterCard : PackedScene
@export var potionCard : PackedScene
@export var weaponCard : PackedScene
var specialDeck : Array[CardInfo]=[
	#Weapons
	CardInfo.new("2ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/2ofWeapons.png", 2),
	CardInfo.new("3ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/3ofWeapons.png", 3),
	CardInfo.new("4ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/4ofWeapons.png", 4),
	CardInfo.new("5ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/5ofWeapons.png", 5),
	CardInfo.new("6ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/6ofWeapons.png", 6),
	CardInfo.new("7ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/7ofWeapons.png", 7),
	CardInfo.new("8ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/8ofWeapons.png", 8),
	CardInfo.new("9ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/9ofWeapons.png", 9),
	CardInfo.new("10ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/10ofWeapons.png", 10),
	CardInfo.new("AceofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/AceofWeapons.png", 14),
	#Potions
	CardInfo.CreatePotion("2ofPotions", "res://assets/cards/2ofPotions.png", 2, "+1 Max Health.", PotionAbilities.TwoOfPotions),
	CardInfo.new("3ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/3ofPotions.png", 3),
	CardInfo.new("4ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/4ofPotions.png", 4),
	CardInfo.new("5ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/5ofPotions.png", 5),
	CardInfo.new("6ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/6ofPotions.png", 6),
	CardInfo.new("7ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/7ofPotions.png", 7),
	CardInfo.new("8ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/8ofPotions.png", 8),
	CardInfo.new("9ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/9ofPotions.png", 9),
	CardInfo.new("10ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/10ofPotions.png", 10),
	CardInfo.new("JackofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/JackofPotions.png", 11),
	CardInfo.new("QueenofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/QueenofPotions.png", 12),
	CardInfo.new("KingofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/KingofPotions.png", 13),
	CardInfo.new("AceofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/AceofPotions.png", 14),
	#Ghosts
	CardInfo.new("2ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/2ofGhosts.png", 2, "", TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("3ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/3ofGhosts.png", 3, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("4ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/4ofGhosts.png", 4, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("5ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/5ofGhosts.png", 5, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("6ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/6ofGhosts.png", 6, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("7ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/7ofGhosts.png", 7, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("8ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/8ofGhosts.png", 8, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("9ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/9ofGhosts.png", 9, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("10ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/10ofGhosts.png", 10,"", TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("JackofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/JackofGhosts.png", 11,"", TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("QueenofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/QueenofGhosts.png", 12, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("KingofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/KingofGhosts.png", 13,"", TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("AceofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/AceofGhosts.png", 14,"", TDCardData_Monster.MonsterType.Ghost),
	#Beasts
	CardInfo.new("2ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/2ofBeasts.png", 2, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("3ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/3ofBeasts.png", 3, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("4ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/4ofBeasts.png", 4, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("5ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/5ofBeasts.png", 5, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("6ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/6ofBeasts.png", 6, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("7ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/7ofBeasts.png", 7, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("8ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/8ofBeasts.png", 8, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("9ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/9ofBeasts.png", 9, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("10ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/10ofBeasts.png", 10, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("JackofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/JackofBeasts.png", 11, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("QueenofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/QueenofBeasts.png", 12, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("KingofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/KingofBeasts.png", 13, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("AceofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/AceofBeasts.png", 14, "",TDCardData_Monster.MonsterType.Ghost),
	]

var standardDeck : Array[CardInfo] = [
	#Weapons
	CardInfo.new("2ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/2ofWeapons.png", 2),
	CardInfo.new("3ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/3ofWeapons.png", 3),
	CardInfo.new("4ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/4ofWeapons.png", 4),
	CardInfo.new("5ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/5ofWeapons.png", 5),
	CardInfo.new("6ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/6ofWeapons.png", 6),
	CardInfo.new("7ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/7ofWeapons.png", 7),
	CardInfo.new("8ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/8ofWeapons.png", 8),
	CardInfo.new("9ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/9ofWeapons.png", 9),
	CardInfo.new("10ofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/10ofWeapons.png", 10),
	CardInfo.new("JackofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/JackofWeapons.png", 11),
	CardInfo.new("QueenofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/QueenofWeapons.png", 12),
	CardInfo.new("KingofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/KingofWeapons.png", 13),
	CardInfo.new("AceofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/AceofWeapons.png", 14),
	#Potions
	CardInfo.new("2ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/2ofPotions.png", 2, "+1 Max Health"),
	CardInfo.new("3ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/3ofPotions.png", 3),
	CardInfo.new("4ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/4ofPotions.png", 4),
	CardInfo.new("5ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/5ofPotions.png", 5),
	CardInfo.new("6ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/6ofPotions.png", 6),
	CardInfo.new("7ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/7ofPotions.png", 7),
	CardInfo.new("8ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/8ofPotions.png", 8),
	CardInfo.new("9ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/9ofPotions.png", 9),
	CardInfo.new("10ofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/10ofPotions.png", 10),
	CardInfo.new("JackofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/JackofPotions.png", 11),
	CardInfo.new("QueenofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/QueenofPotions.png", 12),
	CardInfo.new("KingofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/KingofPotions.png", 13),
	CardInfo.new("AceofPotions", CardInfo.SuitType.Potions, false, "res://assets/cards/AceofPotions.png", 14),
	#Ghosts
	CardInfo.new("2ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/2ofGhosts.png", 2, "", TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("3ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/3ofGhosts.png", 3, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("4ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/4ofGhosts.png", 4, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("5ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/5ofGhosts.png", 5, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("6ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/6ofGhosts.png", 6, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("7ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/7ofGhosts.png", 7, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("8ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/8ofGhosts.png", 8, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("9ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/9ofGhosts.png", 9, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("10ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/10ofGhosts.png", 10,"", TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("JackofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/JackofGhosts.png", 11,"", TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("QueenofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/QueenofGhosts.png", 12, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("KingofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/KingofGhosts.png", 13,"", TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("AceofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/AceofGhosts.png", 14,"", TDCardData_Monster.MonsterType.Ghost),
	#Beasts
	CardInfo.new("2ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/2ofBeasts.png", 2, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("3ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/3ofBeasts.png", 3, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("4ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/4ofBeasts.png", 4, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("5ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/5ofBeasts.png", 5, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("6ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/6ofBeasts.png", 6, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("7ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/7ofBeasts.png", 7, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("8ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/8ofBeasts.png", 8, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("9ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/9ofBeasts.png", 9, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("10ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/10ofBeasts.png", 10, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("JackofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/JackofBeasts.png", 11, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("QueenofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/QueenofBeasts.png", 12, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("KingofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/KingofBeasts.png", 13, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("AceofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/AceofBeasts.png", 14, "",TDCardData_Monster.MonsterType.Ghost),
	]

signal ReplenishedRoom


func _ready() -> void:
	var children = get_node("/root/Game/DungeonNodes/RoomSlots").find_children("*", "TDCardPositionMarker2D", false) as Array[TDCardPositionMarker2D]
	roomSlots = children
	return

func Flee():
	var roomData : Array[TDCardData]
	for card in roomCards:
		roomData.append(card.Data)
		card.FreeMarker()
		card.queue_free()
	roomData.shuffle()
	roomCards.clear()
	Deck.BuryArray(roomData)
	return

func ReplenishRoom():
	if(_GetFilledRoomSlotsCount() < 2):
		for card in roomCards:
				if(card.LocationMarker):
					if(card.LocationMarker != roomSlots.front()):
						card.FreeMarker()
						card.FillMarker(_GetUnfilledRoomSlot())

		while _GetUnfilledRoomSlot():
			if(Deck.Count()>0):
				var slot = _GetUnfilledRoomSlot()
				if(slot):
					var data = Deck.Peek()
					var card : TDCard
					if(data is TDCardData_Monster):
						card = card_board.AddCardFromSource(monsterCard, Deck.DrawCard(), false, true, slot)
					elif(data is TDCardData_Weapon):
						card = card_board.AddCardFromSource(weaponCard, Deck.DrawCard(), false, true, slot)
					elif(data is TDCardData_Potion):
						card = card_board.AddCardFromSource(potionCard, Deck.DrawCard(), false, true, slot)
					else:
						if(data):
							printerr("Unrecognized CardData: " + data.CardName)
						else:
							printerr("Unreconglized CardData: null")
					roomCards.push_back(card)
			else: 
				break
		ReplenishedRoom.emit()
	else:
		print("Room not cleared yet.")
	return

func _GetUnfilledRoomSlot() -> TDCardPositionMarker2D:
	for slot in roomSlots:
		if(!slot.isFilled):
			return slot
	return null

func _GetFilledRoomSlotsCount() -> int:
	var i = 0
	for slot in roomSlots:
		if(slot.isFilled):
			i += 1 
	return i

func RemoveFromRoom(card : TDCard):
	roomCards.erase(card)
	if(roomCards.size()<2):
		ReplenishRoom()
	return
