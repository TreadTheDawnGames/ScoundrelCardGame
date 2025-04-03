class_name Levels

static func Get(which : int) -> Array[TDCardData]:
	return Level(8 + which)

static func CreateCard(value : int, suit : TDCardData_Art.SuitType, lore : String, extraParams : Dictionary[String, Variant]) -> TDCardData:
	var cardName = Utils.ConvertToCardName(value) +"of"+TDCardData_Art.SuitType.keys()[suit]
	print(TDCardData_Art.SuitType.keys()[suit])
	var info = CardInfo.new(cardName, suit, "res://assets/cards/"+cardName+".png", value, lore, extraParams)
	return CardInfo.CardDataFromInfo(info)
	
static func Level(num : int) -> Array[TDCardData]:
	return [CreateCard(num, TDCardData_Art.SuitType.Beasts, "Need to create a system to get lore", {}),
			CreateCard(num, TDCardData_Art.SuitType.Ghosts, "Need to create a system to get lore", {})]
