extends TDCardBoard
class_name OverlayCardBoard
@onready var slotsNode: Node2D = $Panel/Slots
@onready var board_title: RichTextLabel = $Panel/BoardTitle
@onready var marker_extents: ReferenceRect = $MarkerExtents

@export
var slots : int = 0
@export 
var Title : String = "Placeholder"
@export
var MaxWidth : int = 10

func _ready() -> void:
	if(slots == 0):
		printerr("There are no card slots on "+ name +" because the slot count is set to 0.")
	board_title = get_node("Panel/BoardTitle")
	marker_extents = get_node("MarkerExtents")
	Initialize(slots, MaxWidth)
	board_title.text = Title
	return

var Slots : Array[TDCardPositionMarker2D]
var RevealedCards : Array[TDCard]

func Initialize(slotCount : int, maxWidth : int = 10):
	
	var anotherThing = (max(slotCount%maxWidth,min(maxWidth, slotCount)))
	var x = marker_extents.get_rect().size.x
	var cellWidth : float = x / anotherThing
	var wOffset : float = cellWidth/2
	
	var thing = ceil(float(slotCount) / float(maxWidth))
	var cellHeight : float = marker_extents.get_rect().size.y / thing
	var hOffset : float = cellHeight/2
	
	for i in slotCount:
		var marker : TDCardPositionMarker2D = TDCardPositionMarker2D.new()
		slotsNode.add_child(marker)
		marker.position = Vector2((cellWidth*(i%maxWidth))+wOffset, cellHeight*floor((float(i) / float(maxWidth)))+hOffset)
		Slots.append(marker)
	return
