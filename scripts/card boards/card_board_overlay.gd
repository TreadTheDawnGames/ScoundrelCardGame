extends TDCardBoard
class_name OverlayCardBoard
@onready var board_title: RichTextLabel = $Panel/BoardTitle
@export
var cardAreas : Array[ReferenceRect]
@export
var slotCounts : Array[int]
@export 
var Title : String = "Placeholder"
@export
var MaxWidth : Array[int] = [10]
var Slots : Array[Array]

func _ready() -> void:
	var whichIndex : int = 0
	print(slotCounts)
	if(slotCounts.size() == 0):
		printerr("NOTHING EXISTS IN THIS STUPID ARRAY. STUFF SHOULD EXIST IN THIS STUPID ARRAY, BUT IT DOESN'T AND I DON'T KNOW WHY")
	for slotCount in slotCounts:
		if(slotCount == 0):
			printerr("There are no card slots on "+ name +" because the slot count is set to 0.")
		board_title = get_node("Panel/BoardTitle")
		Slots.append(Initialize(slotCount, cardAreas[whichIndex], MaxWidth[whichIndex]))
		board_title.text = Title
		whichIndex+=1
	return

var RevealedCards : Array[TDCard]

func Initialize(slotCount : int, markerExtents : ReferenceRect, maxWidth : int = 10) -> Array[TDCardPositionMarker2D]:
	var initedSlots : Array[TDCardPositionMarker2D]
	var anotherThing = (max(slotCount%maxWidth,min(maxWidth, slotCount)))
	var x = markerExtents.get_rect().size.x
	var cellWidth : float = x / anotherThing
	var wOffset : float = cellWidth/2
	
	var thing = ceil(float(slotCount) / float(maxWidth))
	var cellHeight : float = markerExtents.get_rect().size.y / thing
	var hOffset : float = cellHeight/2
	
	for i in slotCount:
		var marker : TDCardPositionMarker2D = TDCardPositionMarker2D.new()
		markerExtents.add_child(marker)
		marker.position = Vector2((cellWidth*(i%maxWidth))+wOffset, cellHeight*floor((float(i) / float(maxWidth)))+hOffset)
		initedSlots.append(marker)
	return initedSlots
