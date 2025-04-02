extends TDCardData_Art
class_name TDCardData_Purchase

var AbilityDescription : String
var SaleCard : TDCardData

func _init(name : String, art : String, value : int, lore : String, saleCard : TDCardData):
	super._init(name, value, art, lore, SuitType.Purchase)
	useName = "Buy"
	SaleCard = saleCard
	return
	
	
func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.ValidPlayType("Buy")):
		print("bought Card")
	Room.RemoveFromRoom(card)
	return
