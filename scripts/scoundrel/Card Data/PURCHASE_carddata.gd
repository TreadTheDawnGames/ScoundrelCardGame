extends TDCardData_Art
class_name TDCardData_Purchase

var AbilityDescription : String
var SaleCard : TDCardData
var Luckiness : int

##Extra params: SaleCard
func _init(name : String, art : String, value : int, lore : String, suit : TDCardData_Art.SuitType, extraParams : Dictionary[String, Variant]):
	super._init(name, art, value, lore, suit, extraParams)
	useName += "Buy"
	SaleCard = extraParams["SaleCard"]
	return
	
	
func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.ValidPlayType("Buy")):
		print("bought Card")
	Transitioner.AddToDiscard(SaleCard)
	card.FreeMarker()
	card.queue_free()
	#Room.RemoveFromRoom(card)
	return
