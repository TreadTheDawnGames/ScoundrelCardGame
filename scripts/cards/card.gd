extends Control
class_name Card
var area2D;

var GrabbableArea : Area2D;
@onready var Art: Sprite2D = $Art

var grabbed : bool = false
var hovered : bool = false;
@export
var beingDrawn : bool = false;
@export var returnToHome : bool = false

var grabbedOffset : Vector2;
var lastMousePos : Vector2;
var OGPos : Vector2;

var Data : CardData

var usable : bool = false

var cardName : String = ""

var OGMask : int;

var myRect : Rect2;

var PlayZone : CardPlayArea = null

var Played : bool

func _ready() -> void:
	#SetUp(Test_CardData.new("", "TestCard"), false)
	# printerr("[Card] Manually setting card to drawn in _ready()")
	#SetDrawn(true)
	return

func SetUp(data : CardData, isAesthetic : bool) -> void:
	GrabbableArea = get_node("GrabArea")
	GrabbableArea.area_entered.connect(CardEnteredZone)
	GrabbableArea.area_exited.connect(CardExitedZone)
	if(not isAesthetic):
		mouse_entered.connect(Hovered)
		mouse_exited.connect(Unhovered)
		GrabbableArea.mouse_entered.connect(Hovered)
		GrabbableArea.mouse_exited.connect(Unhovered)
	OGMask = GrabbableArea.collision_mask
	SetDrawn(isAesthetic)
	if(data):
		Data = data
	cardName = "This is a new card with a new name. It needs to be changed. This line of code is probably near line 40 of card.gd"
	return
	
func SetDrawn(isDrawn : bool) -> void:
	GrabbableArea.collision_mask = OGMask if isDrawn else 0
	GrabbableArea.set_collision_layer_value(17, isDrawn)
	beingDrawn = !beingDrawn
	return
	
func _process(_delta: float) -> void:
	if(PlayZone && Data):
		if(grabbed && usable && not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && not Played):
			Played = true
			usable = false
			Data.PlayCard(PlayZone.PlayType, self)
	
	if(hovered):
		if(grabbed):
			if(not usable):
				Art.scale = Art.scale.lerp(Vector2(1.33,1.33), 0.25)
			else:
				Art.scale = Art.scale.lerp(Vector2(0.75, 0.75), 0.25) 
		else:
			Art.scale = Art.scale.lerp(Vector2(1.25,1.25), 0.25)
	
		if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not grabbed):
			if(IsOnTop()):
				grabbedOffset = position - get_global_mouse_position()
				grabbed = true
				
		elif(not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and grabbed):
			var spaceState = get_world_2d().direct_space_state
			var query = PhysicsRayQueryParameters2D.create(lastMousePos, get_global_mouse_position(), 65536)
			var result = spaceState.intersect_ray(query)
		
			if(result.is_empty()):
				hovered = false
			grabbed = false
		lastMousePos = get_global_mouse_position()
	else:
		Art.scale = Art.scale.lerp(Vector2.ONE, 0.25)
	if(PlayZone!=null):
		usable = true
	else:
		usable = false
		
	
	if(grabbed):
		position = get_global_mouse_position() + grabbedOffset
	elif returnToHome:
		var pos = position
		pos.x = lerp(position.x, OGPos.x, 0.1)
		pos.y = lerp(position.y, OGPos.y, 0.1)
		position = pos
		

	return

func Hovered() -> void:
	if(beingDrawn):
		return
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		return
	add_to_group("DraggableHovered")
	z_index = 500
	
	hovered = true
	return

func Unhovered() -> void:
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		return
	remove_from_group("DraggableHovered")
	z_index = 0
	hovered = false
	return
	
func CardEnteredZone(node : Node2D) -> void:
	print("CardEntered")
	if(node is not CardPlayArea):
		return
	PlayZone = node
	
	return
func CardExitedZone(node : Node2D) -> void:
	if(node is not CardPlayArea):
		return
	print("Card exited zone: " + node.name + " PlayType: " + node.PlayType)
	PlayZone = null
	return
	
	
func IsOnTop() -> bool:
	for card in get_tree().get_nodes_in_group("DraggableHovered"):
		if(card.get_index() > get_index()):
			return false
	return true
