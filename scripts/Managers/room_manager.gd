extends Manager
class_name RoomManager

@export var roomSlotsPath : NodePath 
var roomSlots : Array[Node]
var roomCards : Array[TDCard]
@export var card_board: TDCardBoard
@export var monsterCard : PackedScene
@export var potionCard : PackedScene
@export var weaponCard : PackedScene
@export var shopCard : PackedScene
signal ReplenishingRoom
signal ReplenishedRoom
var roomPaused : bool = false

func Setup() -> void:
	var children = get_node(roomSlotsPath)
	if(children):
		roomSlots = children.find_children("*", "TDCardPositionMarker2D", false)
	else:
		printerr("No room slots in scene.")
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
	Dungeon.instance.Deck.BuryArray(roomData)
	return

func ReplenishRoom():
	if(roomPaused):
		return;
		
	ReplenishingRoom.emit()
	
	if(_GetFilledRoomSlotsCount() < 2):
		for card in roomCards:
			if(card.LocationMarker):
				if(card.LocationMarker != roomSlots.front()):
					card.FreeMarker()
					card.FillMarker(_GetUnfilledRoomSlot())

		while _GetUnfilledRoomSlot():
			if(Dungeon.instance.Deck.Count()>0):
				var slot = _GetUnfilledRoomSlot()
				if(slot):
					var card : TDCard = card_board.AddCardFromItsScene(Dungeon.instance.Deck.DrawCard(), true, true, slot)
					roomCards.push_back(card)
			else: 
				break
		ReplenishedRoom.emit()
	else:
		print("Room not cleared yet. Filled slots: " + str(_GetFilledRoomSlotsCount()))
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

func PauseRoom(isPaused : bool):
	roomPaused = isPaused
	card_board.SetBoardActive(!isPaused)
	return
