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
		if(SaleCard.Suit != SuitType.Wreaths):
			Transitioner.AddToDiscard(SaleCard)
		else:
			var maybeShop = playArea.owner
			if !maybeShop is ShopOverlay:
				printerr("Play area was not a shop! unable to continue")
				return
			var shop : ShopOverlay = maybeShop
			shop.AddBoughtWreaths(Wreaths)
			print("Applyable wreaths: ", shop.BoughtWreaths)
			pass
	card.FreeMarker()
	card.queue_free()
	Room.RemoveFromRoom(card)
	TDCard.hoveredCards.erase(card)
	return
