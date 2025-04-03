extends TDCardData_Art
class_name TDCardData_Purchase

var AbilityDescription : String
var SaleCard : TDCardData
var Luckiness : int

##Extra params: SaleCard
func _init(name : String, art : String, value : int, lore : String, extraParams : Dictionary[String, Variant]):
	super._init(name, art, value, lore, SuitType.Purchases, extraParams)
	useName += "Buy"
	SaleCard = extraParams["SaleCard"]
	return
	
	
func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.ValidPlayType("Buy")):
		print("bought Card")
	Room.RemoveFromRoom(card)
	return
