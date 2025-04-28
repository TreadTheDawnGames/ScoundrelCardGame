extends Node
class_name TooltipManager

@onready var show_timer: Timer = $ShowTimer

var _card : TDCard

func _ready():
	show_timer.timeout.connect(_show)
	return
	
func Start(card : TDCard):
	show_timer.start()
	_card = card
	return
	
func End():
	show_timer.stop()
	_hide()
	return
	
func _show():
	print(_card)
	return

func _hide():
	print("Hiding")
	return
