extends Node
class_name RoomManager

@export
var roomSlots : Array[Node]
var roomCards : Array[TDCard]
@onready var card_board: TDCardBoard = $"/root/Game/DungeonNodes/CardBoard"
@export var monsterCard : PackedScene
@export var potionCard : PackedScene
@export var weaponCard : PackedScene

signal ReplenishingRoom
signal ReplenishedRoom


func _ready() -> void:
	var children = get_node("/root/Game/DungeonNodes/RoomSlots").find_children("*", "TDCardPositionMarker2D", false) as Array[TDCardPositionMarker2D]
	roomSlots = children
	return

func Flee():
	var roomData : Array[TDCardData]
	for card in roomCards:
		if(!is_instance_valid(card)):
			continue
		roomData.append(card.Data)
		card.FreeMarker()
		card.queue_free()
	roomData.shuffle()
	roomCards.clear()
	Deck.BuryArray(roomData)
	return

func ReplenishRoom():
	ReplenishingRoom.emit()
	
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
					elif(data is TDCardData_Ability):
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

func GetRoomCardData() -> Array[TDCardData]:
	var datas : Array[TDCardData]
	for card in roomCards:
		if(is_instance_valid(card)):
			datas.append(card.Data)
	return datas
