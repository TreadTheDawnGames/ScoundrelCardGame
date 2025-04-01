class_name CardInfo

var CardName : String
var IsMonster : bool
var TexturePath : String
var Value : int
var MonsterType : TDCardData_Monster.MonsterType
enum SuitType {Monsters, Potions, Weapons}
var Suit : SuitType
var Lore : String
var Ability : Callable

func _init(cardName : String, suit : SuitType, isMonster : bool, texturePath : String, value : int,  lore : String = "", monsterType : TDCardData_Monster.MonsterType = TDCardData_Monster.MonsterType.Default):
	CardName = cardName
	IsMonster = isMonster
	TexturePath = texturePath
	Value = value
	Suit = suit
	MonsterType = monsterType
	Lore = lore
	return

static func CreateCardWithAbility(cardName : String, suit : SuitType, isMonster : bool, texturePath : String, value : int,  lore : String, ability:Callable, monsterType : TDCardData_Monster.MonsterType = TDCardData_Monster.MonsterType.Ghost) -> CardInfo:
	var card = CardInfo.new(cardName, suit, isMonster, texturePath, value, lore, monsterType)
	card.Ability = ability
	return card

static func MultipleCardsFromInfo(deck : Array[CardInfo]) -> Array[TDCardData]:
	var cardsToPut : Array[TDCardData] = []
	for info in deck:
		print(TDCardData_Monster.MonsterType.keys()[info.MonsterType] + " | " + info.SuitType.keys()[info.Suit] + " | " + info.CardName)
		cardsToPut.append(CardFromInfo(info))
	return cardsToPut
	
static func CardFromInfo(info : CardInfo) -> TDCardData:
	var data : TDCardData
	match (info.Suit):
		info.SuitType.Monsters:
			data = TDCardData_Monster.new(info.CardName, info.TexturePath, info.Value, info.MonsterType, info.Lore)
			pass
		info.SuitType.Potions:
			data = TDCardData_Potion.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Ability)
			pass
		info.SuitType.Weapons:
			data = TDCardData_Weapon.new(info.CardName, info.TexturePath, info.Value, info.Lore)
			pass
	return data
