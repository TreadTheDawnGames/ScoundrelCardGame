class_name CardInfo

var CardName : String
var TexturePath : String
var Value : int
var Suit : TDCardData_Art.SuitType
var Lore : String
var Ability : Callable

func _init(cardName : String, suit : TDCardData_Art.SuitType, texturePath : String, value : int, lore : String = ""):
	CardName = cardName
	TexturePath = texturePath
	Value = value
	Suit = suit
	Lore = lore
	return

static func CreateCardWithAbility(cardName : String, suit : TDCardData_Art.SuitType, texturePath : String, value : int,  lore : String, ability:Callable) -> CardInfo:
	var card = CardInfo.new(cardName, suit, texturePath, value, lore)
	card.Ability = ability
	return card

static func MultipleCardsFromInfo(deck : Array[CardInfo]) -> Array[TDCardData]:
	var cardsToPut : Array[TDCardData] = []
	for info in deck:
		cardsToPut.append(CardFromInfo(info))
	return cardsToPut
	
static func CardFromInfo(info : CardInfo) -> TDCardData:
	var data : TDCardData
	match (info.Suit):
		TDCardData_Art.SuitType.Beasts:
			data = TDCardData_Monster.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit)
		TDCardData_Art.SuitType.Ghosts:
			data = TDCardData_Monster.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit)
			pass
		TDCardData_Art.SuitType.Potions:
			data = TDCardData_Potion.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Ability, info.Suit)
			pass
		TDCardData_Art.SuitType.Weapons:
			data = TDCardData_Weapon.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Suit)
			pass
		_:
			printerr("Unable to create card data from info: " + info.CardName)
	return data
