extends Node
class_name TooltipManager

@onready var show_timer: Timer = $ShowTimer
@export var tooltipScene : PackedScene
@export var wreathTipScene : PackedScene
@export var offsetVec : Vector2

var wreathTips : Array[Tip] = []

var tooltip : Tip

var _card : TDCard

func _ready():
	show_timer.timeout.connect(_show)
	tooltip = tooltipScene.instantiate()
	get_tree().root.add_child.call_deferred(tooltip)
	tooltip.hide()
	Room.ReplenishedRoom.connect(End)
	#print("Tooltip Hidden: " + str(!tooltip.visible))
	return
	
func Start(card : TDCard):
	End()
	show_timer.start()
	_card = card
	var wreathTypes : Array = []
	var reversedWreaths = _card.Data.Wreaths
	reversedWreaths.reverse()
	for wreath : Wreath in reversedWreaths:
		if(wreathTypes.has(wreath.WreathName)):
			continue
		#draw wreath tooltip
		var wreathTip : Tip = wreathTipScene.instantiate()
		wreathTips.append(wreathTip)
		get_tree().root.add_child(wreathTip)
		wreathTypes.append(wreath.WreathName)
		
		
	return
	
func End():
	show_timer.stop()
	_hide()
	for wreathTip in wreathTips:
		wreathTip.queue_free()
	wreathTips.clear()
	return
	
func _show():
	if(!is_instance_valid(_card)):
		_card = null
		return
	print(_card)
	
	var extraSpaceForWreath : int = 0
	if(_card.Data.Wreaths.size() > 0):
		extraSpaceForWreath = 10
	var cardArtData : TDCardData_Art = _card.Data #
	tooltip.global_position = _card.global_position + Vector2(-tooltip.size.x/2, cardArtData.Art.get_size().y*2.6 + extraSpaceForWreath)
	tooltip.SetLore(_card.Data.Lore)
	
	var wreathIndex : int = 0
	var totalAdditionalSpace : int = 0
	for wreathTip in wreathTips:
		var wreath = _card.Data.Wreaths[wreathIndex]
		wreathTip.SetLore(wreath.Lore)
		wreathTip.global_position = Vector2(tooltip.global_position.x + tooltip.size.x + 15, tooltip.global_position.y + ((totalAdditionalSpace)))
		wreathIndex += 1
		totalAdditionalSpace += int(wreathTip.size.y) + 2
	
	for wreathTip in wreathTips:
		wreathTip.global_position.y-=totalAdditionalSpace
	
	tooltip.show()
	return

func _hide():
	if(tooltip.hovered):
		return
	if(!tooltip.visible):
		return
	print("Hiding")
	tooltip.hide()
	return
