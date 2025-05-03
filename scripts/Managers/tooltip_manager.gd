extends Node
class_name TooltipManager

@onready var show_timer: Timer = $ShowTimer
@export var tooltipScene : PackedScene
@export var offsetVec : Vector2
var tooltip : Tip

var _card : TDCard

func _ready():
	show_timer.timeout.connect(_show)
	tooltip = tooltipScene.instantiate()
	get_tree().root.add_child.call_deferred(tooltip)
	tooltip.hide()
	#print("Tooltip Hidden: " + str(!tooltip.visible))
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
	tooltip.global_position = _card.global_position + Vector2(tooltip.size.x/2, 40)
	tooltip.lore = _card.Data.Lore
	tooltip.show()
	return

func _hide():
	print("Hiding")
	tooltip.hide()
	return
