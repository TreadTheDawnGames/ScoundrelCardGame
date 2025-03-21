extends OverlayCardBoard
class_name NextRoomOverlayBoard

var nextRoom : Array[TDCardData]
@onready var button: Button = $Button

func _ready():
	super._ready()
	ViewRoom()
	button.pressed.connect(ReturnRoom)

func ViewRoom():
	nextRoom = [
	Deck.DrawCard(),
	Deck.DrawCard(),
	Deck.DrawCard(),
	Deck.DrawCard()
	]
		
	var i = 0
	for info in nextRoom:
		var card = AddCard(info,true,true, Slots[i])
		card.scale *= 4
		i+=1
		

func ReturnRoom():
	Deck.PutArray(nextRoom)
	nextRoom.clear()
	
	for card in _board:
		card.FreeMarker()
		card.queue_free()
	
	queue_free()
