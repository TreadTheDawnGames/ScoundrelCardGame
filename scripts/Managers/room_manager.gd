extends Node
class_name RoomManager

@export
var roomSlots : Array[TDCardPositionMarker2D]
var revealedCards : Array[TDCard]
@onready var card_board: TDCardBoard = $"../CardBoard"
@export var monsterCard : PackedScene
@export var potionCard : PackedScene
@export var weaponCard : PackedScene

func ReplenishRoom():
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
					printerr("Unrecognized CardData: " + data)
				revealedCards.push_back(card)
		else: 
			break
	return

func _GetUnfilledRoomSlot() -> TDCardPositionMarker2D:
	for slot in roomSlots:
		if(!slot.isFilled):
			return slot
	return null
