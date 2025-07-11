extends TDCardData_Art
class_name TDCardData_Purchase

var AbilityDescription : String
var SaleCard : TDCardData
var Luckiness : int

func SpecialSetup(card : TDCard):
	super.SpecialSetup(card)
	var baseCard = card as TDCard_Base
	if(Suit == SuitType.None or Suit == SuitType.Wreaths):
		baseCard.valueDisplay.hide()
	return

##Extra params: SaleCard
func _init(name : String, art : String, value : int, lore : String, suit : TDCardData_Art.SuitType, extraParams : Dictionary[String, Variant]):
	super._init(name, art, value, lore, suit, extraParams)
	useName += "Buy"
	SaleCard = extraParams["SaleCard"]
	debugClassName = "TDCardData_Purchase"

	return
	
	
func Postplay(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.ValidPlayType("Buy")):
		if(Dungeon.instance.Money.TryBuy(SaleCard.Value)):
			super.Postplay(playArea, card)
			print("bought " + SaleCard.CardName)
			if(SaleCard.Suit != SuitType.Wreaths):
				Dungeon.instance.Deck.BuryCard(SaleCard)
#				Transitioner.AddToDiscard(SaleCard)
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
			Dungeon.instance.Room.RemoveFromRoom(card)
			TDCard.hoveredCards.erase(card)
		else:
			card._Played = false
	return
