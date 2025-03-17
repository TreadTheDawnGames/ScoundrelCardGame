extends Area2D
class_name TDCard
var area2D;

var grabbed : bool = false
var _hovered : bool = false;
var _beingDrawn : bool = false;
## If true, the card will return to its original position with a Lerp function.
@export
var returnToHome : bool = false
## The speed at which to return. Only matters if beingDrawn is true.
@export
var returnSpeed : float = 0.1

var _grabbedOffset : Vector2;
var _lastMousePos : Vector2;
var LocationMarker : TDCardPositionMarker2D;
@onready var grab_area: CollisionShape2D = $GrabArea

var Data : TDCardData

var usable : bool = false

var CardName : String = ""

var _OGMask : int;

var _PlayZone : TDCardPlayArea = null

var _Played : bool

func SetUp(data : TDCardData, isAesthetic : bool, useGoToPos : bool = false, marker : TDCardPositionMarker2D = null) -> void:
	area_entered.connect(CardEnteredZone)
	area_exited.connect(CardExitedZone)
	grab_area = get_node("GrabArea")
	if(not isAesthetic):
		mouse_entered.connect(Hovered)
		mouse_exited.connect(Unhovered)
	_OGMask = collision_mask
	SetDrawn(isAesthetic)
	returnToHome = useGoToPos
	if(returnToHome):
		FillMarker(marker)
	
	if(data):
		Data = data
		CardName = Data.CardName
		Data.SpecialSetup(self)
	return
	
func SetDrawn(isDrawn : bool) -> void:
	collision_mask = _OGMask if isDrawn else 0
	set_collision_layer_value(17, isDrawn)
	_beingDrawn = !_beingDrawn
	return

func _PlayCard() -> void:
	if(_PlayZone && Data):
		if(grabbed && usable && not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && not _Played):
			_Played = true
			usable = false
			Data.PlayCard(_PlayZone, self)
	return

func _DragDropLogic() -> void:
	if(_hovered):
		if(Data):
			Data.WhileHovered(self)
			
		if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not grabbed):
			if(IsOnTop()):
				_grabbedOffset = global_position - get_global_mouse_position()
				if(Data):
					Data.GrabAction(self)
				grabbed = true
				
		elif(not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and grabbed):
			if(Data):
				Data.DropAction(self)
			grabbed = false
		_lastMousePos = get_global_mouse_position()

	if(_PlayZone):
		usable = true
		if(Data):
			Data.EnterUsable(_PlayZone, self)
	else:
		usable = false
		if(Data):
			Data.ExitUsable(self)

	if(grabbed):
		global_position = get_global_mouse_position() + _grabbedOffset
	elif returnToHome:
		if(LocationMarker):
			if(global_position.distance_to(LocationMarker.global_position) > 0.01):
				global_position = global_position.lerp(LocationMarker.global_position, returnSpeed)
	return

func _process(_delta: float) -> void:
	if(Data):
		Data.Frame(self)
		
	_PlayCard()
	_DragDropLogic()
	


	return

func Hovered() -> void:
	if(_beingDrawn):
		return
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		return
	add_to_group("DraggableHovered")
	if(Data):
		Data.HoverEnterAction(self)
	_hovered = true
	return

func Unhovered() -> void:
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		return
	remove_from_group("DraggableHovered")
	if(Data):
		Data.HoverExitAction(self)
	_hovered = false
	return
	
func CardEnteredZone(node : Node2D) -> void:
	print("CardEntered")
	if(node is not TDCardPlayArea):
		return
	_PlayZone = node
	return
	
func CardExitedZone(node : Node2D) -> void:
	if(node is not TDCardPlayArea):
		return
	print("Card exited zone: " + node.name + " PlayType: " + node.GetPlayType())
	_PlayZone = null
	return
	
func IsOnTop() -> bool:
	for card in get_tree().get_nodes_in_group("DraggableHovered"):
		if(card.get_index() > get_index()):
			return false
	return true

##Remember to free the marker before freeing the card.
func FreeMarker():
	if(LocationMarker):
		LocationMarker.SetUnfilled()
	LocationMarker = null
	return

## Automatically frees the current marker if the card already has one.
func FillMarker(marker : TDCardPositionMarker2D):
	if(LocationMarker):
		FreeMarker()
	if(marker):
		marker.SetFilled()
		LocationMarker = marker
	else:
		printerr("Attempted to set card marker to a null instance.")
	return

#technically got this name from Brave AI
func _exit_tree() -> void:
	if(LocationMarker):
		printerr(name + ": Make sure to free the card marker first!")
	return

func StopMouseDetectable():
	grab_area.disabled = true
	grabbed = false
	return
func StartMouseDetectable():
	grab_area.disabled = false
	return
