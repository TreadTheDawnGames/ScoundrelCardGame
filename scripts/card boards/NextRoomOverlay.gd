extends OverlayCardBoard
class_name NextRoomOverlayBoard

var nextRoom : Array[TDCardData]
@onready var button: Button = $Button

func _ready():
	super._ready()
	ViewRoom()
	button.pressed.connect(ReturnRoom)
	return

func ViewRoom():
	Room.card_board.SetBoardActive(false)

	nextRoom = Deck.DrawMultipleCards(4)
		
	var i = 0
	for info in nextRoom:
		if(!is_instance_valid(info)):
			continue
		AddCardFromItsScene(info,false,true, Slots[i])
		i+=1
	return

func ReturnRoom():
	nextRoom.shuffle()
	Deck.PutArray(nextRoom)
	nextRoom.clear()
	
	for card in _board:
		card.FreeMarker()
		card.queue_free()
	_board.clear()
	Room.card_board.SetBoardActive(true)
	queue_free()
	return
