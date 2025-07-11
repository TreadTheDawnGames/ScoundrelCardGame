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
	Dungeon.instance.Room.card_board.SetBoardActive(false)

	nextRoom = Dungeon.instance.Deck.DrawMultipleCards(4)
		
	var i = 0
	for info in nextRoom:
		if(!is_instance_valid(info)):
			continue
		#fully aware this is proably the wrong choice in making the card draggable but not usable.
		AddCardFromItsScene(info,true,false, Slots[0][i]).scale *= 4
		i+=1
	return

func ReturnRoom():
	nextRoom.shuffle()
	Dungeon.instance.Deck.PutArray(nextRoom)
	nextRoom.clear()
	
	for card in _board:
		if(is_instance_valid(card)):
			card.FreeMarker()
			card.queue_free()
	_board.clear()
	Dungeon.instance.Room.card_board.SetBoardActive(true)
	queue_free()
	return
