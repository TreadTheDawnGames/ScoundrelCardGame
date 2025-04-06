extends OverlayCardBoard
class_name ShopOverlay

var TopRightMarkers : Array[TDCardPositionMarker2D]
var BottomRightMarkers : Array[TDCardPositionMarker2D]
var LeftMarkers : Array[TDCardPositionMarker2D]
@onready var RerollShopButton: TextureButton = $Panel/RerollShop
@onready var CloseShopButton: TextureButton = $Panel/CloseShop
@onready var priceText: RichTextLabel = $Panel/RerollShop/Price
var CardTypes : Array[TDCardData_Art.SuitType]
const ShopOverlayScene = preload("res://scenes/card overlays/shop_overlay.tscn")

var rerollPrice : int = 5
var RerollIfCards : PackedStringArray

var ShopInfo : Array[ShopData] 
var wreathProbability : Array[int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1] # 22.73% chance of success
var Luck : int = 0
var _luckMult : int = 2

var BoughtWreaths : Array[Wreath]

const APPLY_WREATHS : PackedScene = preload("res://scenes/card overlays/assign_wreaths_overlay.tscn")
#func _init(shopInfo : Array[ShopData]):
	#ShopInfo = shopInfo
##	ShopInfo = [ShopData.new(TDCardData_Art.SuitType.Potions, [], false, 1),ShopData.new(TDCardData_Art.SuitType.Weapons,  [], false, 1,  ),ShopData.new(TDCardData_Art.SuitType.Purchase, [], true, -1)]
	#return
	
static func CreateNew(shopInfo : Array) -> ShopOverlay:
	var shop = ShopOverlayScene.instantiate()
	for info in shopInfo:
		if info is not ShopData:
			if info == shopInfo[-1]:
				if info is not int:
					printerr("Error initializing shop: Given element in shopInfo was not ShopData")
			else:
				printerr("Error initializing shop: Given element in shopInfo was not ShopData")
	
	if(shopInfo[-1] is int):
		shop.Luck = shopInfo[-1]
		shopInfo.resize(3)
	
	var trueInfo : Array[ShopData] = []
	for info in shopInfo.filter(func(a): return a is ShopData):
		trueInfo.append(info as ShopData)
	shopInfo = trueInfo
	shop.ShopInfo = shopInfo
	return shop

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
	
	var currCount : int = ShopInfo.size() 
	while currCount < 3:
		ShopInfo.append(ShopInfo[-1])
		currCount+=1
		pass
	board_title.text = GetShopName()
	
	SetupShop(ShopInfo)
	Room.card_board.SetBoardActive(false)
	RerollShopButton.pressed.connect(RerollShop)
	CloseShopButton.pressed.connect(CloseShop)
	return


func SetupShop(shopDatas : Array[ShopData]) -> void:
	AddCardsToShop(shopDatas[0], LeftMarkers)
	AddCardsToShop(shopDatas[1], TopRightMarkers)
	AddCardsToShop(shopDatas[2], BottomRightMarkers,)
	
	return
	
func AddCardsToShop(shopData : ShopData, MarkerArray) -> void:
	##get card pool
	var availableCardInfos : Array[CardInfo]
	if(shopData.Suit == TDCardData_Art.SuitType.Wreaths):
		availableCardInfos = [CardInfo.new("PurchaseableCard", TDCardData_Art.SuitType.Wreaths, "res://assets/cards/PurchaseCard.png", 0, "", {"SaleCard":null})]
	else:
		availableCardInfos = Utils.GetCardInfosOfSuit(shopData.Suit)
	
	#if there's a minimum value, remove all other cards from the available pool
	if(shopData.MinimumValue > 0):
		var trueAvailables = availableCardInfos.filter(func(a): return a.Value >= shopData.MinimumValue)
		availableCardInfos = trueAvailables
	
	#Prime disallowed cards
	for card in shopData.RerollCards:
		RerollIfCards.append(card.CardName)
	
	#Fill each marker
	for marker in MarkerArray:
		# init chosen card with random
		var chosenCardInfo : CardInfo = availableCardInfos.pick_random()
		
		#if the card has already been chosen, reroll it up to the number of allowed times
		var rerollCount = -1
		#reroll if not the purchase card suit
		if (shopData.Suit != TDCardData_Art.SuitType.Wreaths):
			while(rerollCount < shopData.AllowedRerolls):
				if(RerollIfCards.has(chosenCardInfo.CardName)):
					chosenCardInfo = availableCardInfos.pick_random()
					rerollCount += 1
				else:
					break
		#add the chosen card to the reroll cards. This will mean it will reroll if it picks the same card twice in a row, which may pick the same card again.
		RerollIfCards.append(chosenCardInfo.CardName)
		
		var purchaseData : TDCardData_Art = CardInfo.CardDataFromInfo(chosenCardInfo)
		print("purchaseData suit: " + str(TDCardData_Art.SuitType.find_key(purchaseData.Suit)))
		chosenCardInfo.ExtraParams["SaleCard"] = purchaseData
		var chosenWreaths : Array[Wreath]
		var chosenWreathNames : Array[String]
		
		for i in DetermineWreathCount(shopData):
			var compatWreath : Wreath = WreathLibrary.RandCompatible(purchaseData)
			#No duplicate wreaths
			if(!compatWreath.WreathName in chosenWreathNames):
				chosenWreaths.append(compatWreath)
				chosenWreathNames.append(compatWreath.WreathName)
		#Cards always have a chance of rolling a wreath. If it's compatible, add it. Else ignore.
		#if(!shopData.GuaranteedWreathCompatibility):
			#var randWreath : Wreath = WreathLibrary.Rand()
			#if(randWreath.ValidForData(purchaseData)):
				#chosenWreaths.append(randWreath)
		
		purchaseData.AddMultipleWreaths(chosenWreaths)
		var shopCardData = TDCardData_Purchase.new(chosenCardInfo.CardName, chosenCardInfo.TexturePath, chosenCardInfo.Value, chosenCardInfo.Lore, chosenCardInfo.Suit, chosenCardInfo.ExtraParams)
		shopCardData.Wreaths = chosenWreaths
		
		var card = AddCardFromItsScene(shopCardData,false, true, marker)
		card.scale *= 4
		purchaseData.ShowAllWreaths(card)
	return

func DetermineWreathCount(shopData : ShopData) -> int:
	var timesToRoll = shopData.Advantage
	if(timesToRoll < 0):
		return abs(timesToRoll)
		
	var numberOfWreaths : int = 0
	
	for i in timesToRoll + (Luck * _luckMult):
		var rand : int = wreathProbability.pick_random()
		while rand != 0:
			rand = wreathProbability.pick_random()
			numberOfWreaths+=1
			if(numberOfWreaths>4):
				return numberOfWreaths
	
	#Wreath suited cards always have at least one wreath
	if(shopData.Suit == TDCardData_Art.SuitType.Wreaths):
		if (numberOfWreaths == 0):
			numberOfWreaths = 1
			
	return numberOfWreaths
	


func RerollShop():
	rerollPrice+=1
	RerollIfCards.clear()
	priceText.text = str(rerollPrice) +"$"
	for card in _board:
		if(is_instance_valid(card)):
			card.FreeMarker()
			card.queue_free()
	_board.clear()
	SetupShop(ShopInfo)
	return

func CloseShop():
	for card in _board:
		if(is_instance_valid(card)):
			card.FreeMarker()
			card.queue_free()
	_board.clear()
	Room.card_board.SetBoardActive(true)
	if(BoughtWreaths.size() > 0):
		var wreathApplyScene = APPLY_WREATHS.instantiate()
		get_parent().add_child(wreathApplyScene)
	
	queue_free()
	return

func GetShopName() -> String:
	var shopName : String = ""
	
	var types = []
	for data in ShopInfo:
		var cardType = (TDCardData_Art.SuitType.find_key(data.Suit))
		if(!types.has(cardType)):
			types.append(cardType)
	
	if(types.size() == 1):
		shopName += types[0]
		pass
	elif types.size() == 3:
		shopName += "General"
	elif(types.size() > 1):
		for type : String in types:
			shopName += type.substr(0,3)
			if(types[-1] != type):
				shopName+=", "
	else:
		printerr("[ShopOverlay] ShopInfo was invalid.")
		shopName += "El Shoppe"
	for i in range(Luck+1):
		if(i==0):
			continue
		shopName += "+"
	
	print(types)
	
	return shopName

func AddBoughtWreaths(array : Array[Wreath]):
	BoughtWreaths.append_array(array)
	return


class ShopData:
	var Suit : TDCardData_Art.SuitType
	var RerollCards : Array[TDCardData] = []
	var GuaranteedWreathCompatibility : bool = false
	var Advantage : int = 0
	var AllowedRerolls : int = 1
	var MinimumValue : int = 0
	func _init(suit : TDCardData_Art.SuitType, rerollCards : Array[TDCardData] = [], guaranteedWreathCompatibility : bool = false, advantage : int = 0, allowedRerolls : int = 1, minimumValue : int = 0):
		Suit = suit
		RerollCards = rerollCards
		GuaranteedWreathCompatibility = guaranteedWreathCompatibility
		Advantage = advantage
		AllowedRerolls = allowedRerolls
		MinimumValue = minimumValue
		return
