class_name Levels

static func Get(which : int) -> Array[TDCardData]:
	return Level(8 + which)

static func CreateMonsterCard(value : int, monsterType : TDCardData_Monster.MonsterType, lore : String = "") -> TDCardData:
	var cardName = Utils.ConvertToCardName(value) +"of"+TDCardData_Monster.MonsterType.keys()[monsterType] + "s"
	print(TDCardData_Monster.MonsterType.keys()[monsterType])
	var info = CardInfo.new(cardName, CardInfo.SuitType.Monsters, false, "res://assets/cards/"+cardName+".png", value, lore, monsterType)
	return CardInfo.CardFromInfo(info)
	
static func Level(num : int) -> Array[TDCardData]:
	return [CreateMonsterCard(num, TDCardData_Monster.MonsterType.Beast),
			CreateMonsterCard(num, TDCardData_Monster.MonsterType.Ghost)]

static func LevelOne() -> Array[TDCardData]:
	return CardInfo.MultipleCardsFromInfo([
	CardInfo.new("9ofGhosts", CardInfo.SuitType.Monsters, false, "res://assets/cards/9ofGhosts.png", 9, "",TDCardData_Monster.MonsterType.Ghost),
	CardInfo.new("9ofBeasts", CardInfo.SuitType.Monsters, false, "res://assets/cards/9ofBeasts.png", 9, "",TDCardData_Monster.MonsterType.Beast),
])
