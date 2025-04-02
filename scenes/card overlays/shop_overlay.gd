extends OverlayCardBoard
class_name ShopOverlay

var PotionMarkers : Array[TDCardPositionMarker2D]
var WeaponMarkers : Array[TDCardPositionMarker2D]
var WreathMarkers : Array[TDCardPositionMarker2D]
@onready var RerollShopButton: TextureButton = $Panel/RerollShop
@onready var CloseShopButton: TextureButton = $Panel/CloseShop
@onready var priceText: RichTextLabel = $Panel/RerollShop/Price

var rerollPrice : int = 5

func _ready() -> void:
	marker_extents = get_node("MarkerExtents")
	#AddShopCards(TDCardData_Art.SuitType.Ghosts)
	for node in get_node("Panel/Slots/PotionMarkers").get_children():
		PotionMarkers.append(node) 
	for node in  get_node("Panel/Slots/WeaponMarkers").get_children():
		WeaponMarkers.append(node)
	for node in get_node("Panel/Slots/WreathMarkers").get_children():
		WreathMarkers.append(node) 

	priceText.text = str(rerollPrice) +"$"
	SetupShop()
	Room.card_board.SetBoardActive(false)
	RerollShopButton.pressed.connect(RerollShop)
	CloseShopButton.pressed.connect(CloseShop)
	
	return

func SetupShop() -> void:
	AddCardsToShop(TDCardData_Art.SuitType.Potions, PotionMarkers, [], false, 1)
	AddCardsToShop(TDCardData_Art.SuitType.Weapons, WeaponMarkers, [], false, 1)
	AddCardsToShop(TDCardData_Art.SuitType.Purchase, WreathMarkers, [], true, -1)
	
	return
	
func AddCardsToShop(suit : TDCardData_Art.SuitType, markerArray : Array[TDCardPositionMarker2D], rerollCards : Array[TDCardData] = [], guaranteedWreathCompatibility : bool = false, advantage : int = 0, allowedRerolls : int = 1) -> void:
	var info : Array[CardInfo]
	if(suit == TDCardData_Art.SuitType.Purchase):
		info = [CardInfo.new("PurchaseableCard", suit, "res://assets/cards/PurchaseCard.png", 0)]
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
				else:
					break
		rerollIfCards.append(chosenCardInfo.CardName)
		
		var purchaseData :TDCardData_Art = CardInfo.CardDataFromInfo(chosenCardInfo)
		
		for i in DetermineWreathCount(advantage):
			if(guaranteedWreathCompatibility):
				purchaseData.AddWreath(WreathLibrary.GuaranteedCompat(purchaseData))
			else:
				purchaseData.AddWreath(WreathLibrary.Rand())
				
		var card = AddCard(TDCardData_Purchase.new(chosenCardInfo.CardName, chosenCardInfo.TexturePath, chosenCardInfo.Value, chosenCardInfo.Lore, purchaseData),false, true, marker)
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
