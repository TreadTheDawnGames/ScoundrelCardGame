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
var OGPos : Vector2;

var Data : TDCardData

var usable : bool = false

var CardName : String = ""

var _OGMask : int;

var _PlayZone : TDCardPlayArea = null

var _Played : bool

func SetUp(data : TDCardData, isAesthetic : bool) -> void:
	area_entered.connect(CardEnteredZone)
	area_exited.connect(CardExitedZone)
	if(not isAesthetic):
		mouse_entered.connect(Hovered)
		mouse_exited.connect(Unhovered)
	_OGMask = collision_mask
	SetDrawn(isAesthetic)
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
			Data.PlayCard(_PlayZone.PlayType, self)
	return

func _DragDropLogic() -> void:
	if(_hovered):
		if(Data):
			Data.WhileHovered(self)
			
		if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not grabbed):
			if(IsOnTop()):
				_grabbedOffset = position - get_global_mouse_position()
				if(Data):
					Data.GrabAction(self)
				grabbed = true
				
		elif(not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and grabbed):
			if(Data):
				Data.DropAction(self)
			grabbed = false
			
		_lastMousePos = get_global_mouse_position()
	if(_PlayZone!=null):
		usable = true
	else:
		usable = false
	
	if(grabbed):
		position = get_global_mouse_position() + _grabbedOffset
	elif returnToHome:
		position.lerp(OGPos, returnSpeed)
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
	z_index = 500
	_hovered = true
	return

func Unhovered() -> void:
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		return
	remove_from_group("DraggableHovered")
	if(Data):
		Data.HoverExitAction(self)
	z_index = 0
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
	print("Card exited zone: " + node.name + " PlayType: " + node.PlayType)
	_PlayZone = null
	return
	
	
func IsOnTop() -> bool:
	for card in get_tree().get_nodes_in_group("DraggableHovered"):
		if(card.get_index() > get_index()):
			return false
	return true
