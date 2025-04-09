extends OverlayCardBoard
class_name AssignWreathsOverlay

const WREATH_VISUAL : PackedScene = preload("res://scenes/wreaths/wreath_visual.tscn")
const CARD_DISPLAY : PackedScene = preload("res://scenes/cards/assign_wreath_card.tscn")
var boughtWreaths : Array[Wreath]

func _ready():
	#super._ready()

	Slots.append(MakeWreaths(Initialize(boughtWreaths.size(), cardAreas[1], 5)))
	Slots.append(MakeCards(Initialize(4, cardAreas[0])))


func MakeWreaths(slots : Array) -> Array[TDCardPositionMarker2D]:
	var slotCount : int = 0
	for slot in slots:
		AddCardFromSource(WREATH_VISUAL, boughtWreaths[slotCount], false, true, slot).scale *= 4
		slotCount+=1
	return slots
	
func MakeCards(slots : Array) -> Array[TDCardPositionMarker2D]:
	for slot in slots:
		AddCardFromSource(CARD_DISPLAY, Deck.DrawCard(), false, true, slot).scale *= 4
	return slots
