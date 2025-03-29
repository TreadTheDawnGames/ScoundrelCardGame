extends TDCardBoard
class_name OverlayCardBoard
@onready var slotsNode: Node2D = $Panel/Slots
@onready var board_title: RichTextLabel = $Panel/BoardTitle
@onready var marker_extents: ReferenceRect = $MarkerExtents

@export
var slots : int = 0
@export 
var label : String = "Placeholder"
@export
var MaxWidth : int = 10

func _ready() -> void:
	if(slots == 0):
		printerr("There are no card slots on "+ name +" because the slot count is set to 0.")
	board_title = get_node("Panel/BoardTitle")
	marker_extents = get_node("MarkerExtents")
	Initialize(slots, label, MaxWidth)
	return

var Slots : Array[TDCardPositionMarker2D]
var RevealedCards : Array[TDCard]

func Initialize(slotCount : int, title : String, maxWidth : int = 10):
	board_title.text = title
	
	var anotherThing = (max(slotCount%maxWidth,min(maxWidth, slotCount)))
	var x = marker_extents.get_rect().size.x
	var cellWidth : float = x / anotherThing
	var wOffset : float = cellWidth/2
	
	var thing = ceil(float(slotCount) / float(maxWidth))
	var cellHeight : float = marker_extents.get_rect().size.y / thing
	var hOffset : float = cellHeight/2
	
	for i in slotCount:
		#var marker : Sprite2D = Sprite2D.new()
		#marker.texture = load("res://assets/cards/2ofGhosts.png")
		#marker.scale *= 4
		var marker : TDCardPositionMarker2D = TDCardPositionMarker2D.new()
		slotsNode.add_child(marker)
		marker.position = Vector2((cellWidth*(i%maxWidth))+wOffset, cellHeight*floor((float(i) / float(maxWidth)))+hOffset)
		Slots.append(marker)
	return
