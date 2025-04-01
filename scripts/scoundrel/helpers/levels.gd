class_name Levels

static func Get(which : int) -> Array[TDCardData]:
	return Level(8 + which)

static func CreateCard(value : int, suit : TDCardData_Art.SuitType, lore : String = "") -> TDCardData:
	var cardName = Utils.ConvertToCardName(value) +"of"+TDCardData_Art.SuitType.keys()[suit]
	print(TDCardData_Art.SuitType.keys()[suit])
	var info = CardInfo.new(cardName, suit, "res://assets/cards/"+cardName+".png", value, lore)
	return CardInfo.CardFromInfo(info)
	
static func Level(num : int) -> Array[TDCardData]:
	return [CreateCard(num, TDCardData_Art.SuitType.Beasts),
			CreateCard(num, TDCardData_Art.SuitType.Ghosts)]

static func LevelOne() -> Array[TDCardData]:
	return CardInfo.MultipleCardsFromInfo([
	CardInfo.new("9ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/9ofGhosts.png", 9, ""),
	CardInfo.new("9ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/9ofBeasts.png", 9, ""),
])
