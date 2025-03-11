extends Node
class_name RoomManager

@export
var roomSlots : Array[TDCardPositionMarker2D]
var revealedCards : Array[TDCard]
@onready var card_board: TDCardBoard = $"../CardBoard"

func ReplenishRoom():
	while _GetUnfilledRoomSlot():
		if(Deck.Count()>0):
			var slot = _GetUnfilledRoomSlot()
			if(slot):
				var card : TDCard = card_board.AddCard(Deck.DrawCard(), false, true, slot)
				revealedCards.push_back(card)
		else: 
			break
	return

func _GetUnfilledRoomSlot() -> TDCardPositionMarker2D:
	for slot in roomSlots:
		if(!slot.isFilled):
			return slot
	return null
