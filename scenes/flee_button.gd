extends Button

var fleedLast : bool = false

func _ready() -> void:
	button_up.connect(Flee)
	Room.ReplenishedRoom.connect(ResetButton)
	return

func _process(_delta):
	if(Room.roomCards.size()<4):
		disabled = true

func ResetButton():
	disabled = false
	return

func Flee():
	Room.Flee()
	Room.ReplenishRoom()
	disabled = true
	return
