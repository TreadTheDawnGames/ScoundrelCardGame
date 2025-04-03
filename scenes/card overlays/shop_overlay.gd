extends OverlayCardBoard
class_name ShopOverlay

var TopRightMarkers : Array[TDCardPositionMarker2D]
var BottomRightMarkers : Array[TDCardPositionMarker2D]
var LeftMarkers : Array[TDCardPositionMarker2D]
@onready var RerollShopButton: TextureButton = $Panel/RerollShop
@onready var CloseShopButton: TextureButton = $Panel/CloseShop
@onready var priceText: RichTextLabel = $Panel/RerollShop/Price

var rerollPrice : int = 5

func _ready():
	marker_extents = get_node("MarkerExtents")
	#AddShopCards(TDCardData_Art.SuitType.Ghosts)
	for node in get_node("Panel/Slots/TopRight").get_children():
		TopRightMarkers.append(node) 
	for node in  get_node("Panel/Slots/BottomRight").get_children():
		BottomRightMarkers.append(node)
	for node in get_node("Panel/Slots/Left").get_children():
		LeftMarkers.append(node) 

	priceText.text = str(rerollPrice) +"$"
	SetupShop()
	Room.card_board.SetBoardActive(false)
	RerollShopButton.pressed.connect(RerollShop)
	CloseShopButton.pressed.connect(CloseShop)
	return


func SetupShop() -> void:
	AddCardsToShop(TDCardData_Art.SuitType.Potions,  TopRightMarkers, [], false, 1)
	AddCardsToShop(TDCardData_Art.SuitType.Weapons,  BottomRightMarkers, [], false, 1)
	AddCardsToShop(TDCardData_Art.SuitType.Purchase, LeftMarkers, [], true, -1)
	
	return
	
func AddCardsToShop(suit : TDCardData_Art.SuitType, markerArray : Array[TDCardPositionMarker2D], rerollCards : Array[TDCardData] = [], guaranteedWreathCompatibility : bool = false, advantage : int = 0, allowedRerolls : int = 1) -> void:
	var info : Array[CardInfo]
	if(suit == TDCardData_Art.SuitType.Purchase):
		info = [CardInfo.new("PurchaseableCard", suit, "res://assets/cards/PurchaseCard.png", 0, "", {"SaleCard":null})]
	else:
		info = Utils.GetCardInfosOfSuit(suit)
	var rerollIfCards : PackedStringArray
	
	#Prime disallowed cards
	for card in rerollCards:
		rerollIfCards.append(card.CardName)
	
	#Fill each marker
	for marker in markerArray:
		# init chosen card with random
		var chosenCardInfo : CardInfo = info.pick_random()
		#if the card has already been chosen, reroll it up to the number of allowed times
		var rerollCount = 0
		#reroll if not the purchase card suit
		if (suit != TDCardData_Art.SuitType.Purchase):
			while(rerollCount < allowedRerolls):
				if(rerollIfCards.has(chosenCardInfo.CardName)):
					chosenCardInfo = info.pick_random()
					rerollCount += 1
				else:
					break
		rerollIfCards.append(chosenCardInfo.CardName)
		
		var purchaseData : TDCardData_Art = CardInfo.CardDataFromInfo(chosenCardInfo)
		chosenCardInfo.ExtraParams["SaleCard"] = purchaseData
		var chosenWreaths : Array[Wreath]
		
		for i in DetermineWreathCount(advantage):
			if(guaranteedWreathCompatibility):
				chosenWreaths.append(WreathLibrary.RandCompatible(purchaseData))
			else:
				chosenWreaths.append(WreathLibrary.Rand())
		purchaseData.AddMultipleWreaths(chosenWreaths)
		var shopCardData = TDCardData_Purchase.new(chosenCardInfo.CardName, chosenCardInfo.TexturePath, chosenCardInfo.Value, chosenCardInfo.Lore, chosenCardInfo.ExtraParams)
		shopCardData.AddMultipleWreaths(chosenWreaths)
		
		var card = AddCard(shopCardData,false, true, marker)
		purchaseData.ShowAllWreaths(card)
	return

func DetermineWreathCount(advantage : int) -> int:
	if(advantage < 0):
		return abs(advantage)
		
	var numberOfWreaths : int = 0
	for i in advantage:
		var rand : int = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1].pick_random()
		while rand != 0:
			rand = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1].pick_random()
			numberOfWreaths+=1
			if(numberOfWreaths>4):
				return numberOfWreaths
			
	return numberOfWreaths
	


func RerollShop():
	rerollPrice+=1
	priceText.text = str(rerollPrice) +"$"
	for card in _board:
		card.FreeMarker()
		card.queue_free()
	_board.clear()
	SetupShop()
	return

func CloseShop():
	for card in _board:
		card.FreeMarker()
		card.queue_free()
	_board.clear()
	Room.card_board.SetBoardActive(true)
	queue_free()
	return
