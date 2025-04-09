class_name CardInfo

var CardName : String
var TexturePath : String
var Value : int
var Suit : TDCardData_Art.SuitType
var Lore : String
var ExtraParams : Dictionary[String, Variant]

func _init(cardName : String, suit : TDCardData_Art.SuitType, texturePath : String, value : int, lore : String, extraParams : Dictionary[String, Variant]):
	CardName = cardName
	TexturePath = texturePath
	Value = value
	Suit = suit
	Lore = lore
	ExtraParams = extraParams
	return

static func MultipleCardsFromInfo(deck : Array[CardInfo]) -> Array[TDCardData]:
	var cardsToPut : Array[TDCardData] = []
	for info in deck:
		cardsToPut.append(CardDataFromInfo(info))
	return cardsToPut
	
static func CardDataFromInfo(info : CardInfo) -> TDCardData:
	var data : TDCardData
	
	match (info.Suit):
		TDCardData_Art.SuitType.Beasts:
			data = TDCardData_Monster.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit, info.ExtraParams)
		TDCardData_Art.SuitType.Ghosts:
			data = TDCardData_Monster.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit, info.ExtraParams)
			pass
		TDCardData_Art.SuitType.Potions:
			data = TDCardData_Potion.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit, info.ExtraParams)
			pass
		TDCardData_Art.SuitType.Weapons:
			data = TDCardData_Weapon.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit, info.ExtraParams)
		TDCardData_Art.SuitType.Shops:
			data = TDCardData_Shop.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.ExtraParams)
			pass
		_:
			#Default to base type
			data = TDCardData_Art.new(info.CardName,info.TexturePath,info.Value,  info.Lore, info.Suit, info.ExtraParams)
	return data

static func GetRandomCardArray(infoArray : Array[CardInfo]) -> TDCardData:
	return CardInfo.CardDataFromInfo(infoArray.pick_random())
