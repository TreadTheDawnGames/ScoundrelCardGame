class_name CardInfo

var CardName : String
var TexturePath : String
var Value : int
var Suit : TDCardData_Art.SuitType
var Lore : String
var Ability : Callable
var ExtraParams : Dictionary[String, Variant]

func _init(cardName : String, suit : TDCardData_Art.SuitType, texturePath : String, value : int, lore : String, extraParams : Dictionary[String, Variant]):
	CardName = cardName
	TexturePath = texturePath
	Value = value
	Suit = suit
	Lore = lore
	ExtraParams = extraParams
	return

static func CreateCardWithAbility(cardName : String, suit : TDCardData_Art.SuitType, texturePath : String, value : int,  lore : String, ability:Callable) -> CardInfo:
	var card = CardInfo.new(cardName, suit, texturePath, value, lore)
	card.Ability = ability
	return card

static func MultipleCardsFromInfo(deck : Array[CardInfo]) -> Array[TDCardData]:
	var cardsToPut : Array[TDCardData] = []
	for info in deck:
		cardsToPut.append(CardDataFromInfo(info))
	return cardsToPut
	
static func CardDataFromInfo(info : CardInfo) -> TDCardData:
	var data : TDCardData
	var extraParams : Dictionary[String, Variant]
	match (info.Suit):
		TDCardData_Art.SuitType.Beasts:
			data = TDCardData_Monster.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit, extraParams)
		TDCardData_Art.SuitType.Ghosts:
			data = TDCardData_Monster.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit, extraParams)
			pass
		TDCardData_Art.SuitType.Potions:
			extraParams.get_or_add("Ability", info.Ability)
			data = TDCardData_Ability.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit, extraParams)
			pass
		TDCardData_Art.SuitType.Weapons:
			data = TDCardData_Weapon.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit, extraParams)
			pass
		_:
			#Default to base type
			data = TDCardData_Art.new(info.CardName,info.Value, info.TexturePath, info.Lore, info.Suit, extraParams)
	return data

static func GetRandomCardArray(infoArray : Array[CardInfo]) -> TDCardData:
	return CardInfo.CardDataFromInfo(infoArray.pick_random())
