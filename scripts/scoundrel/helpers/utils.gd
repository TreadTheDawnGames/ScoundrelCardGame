class_name Utils

static func ConvertToCardName(num : int) -> String:
	match(num):
		11:
			return "Jack"
		12:
			return "Queen"
		13:
			return "King"
		14:
			return "Ace"
		_:
			return str(num)

static func GetCardsOfSuit(type : TDCardData_Art.SuitType) -> Array[TDCardData]:
	return CardLibrary.ActiveDeck.filter(func(item): return item.Suit == type)
