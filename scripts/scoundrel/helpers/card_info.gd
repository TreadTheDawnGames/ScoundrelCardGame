class_name CardInfo

var CardName : String
var IsMonster : bool
var TexturePath : String
var Value : int
var MonsterType : TDCardData_Monster.MonsterType
enum SuitType {Monsters, Potions, Weapons}
var Suit : SuitType
var Lore : String

func _init(cardName : String, suit : SuitType, isMonster : bool, texturePath : String, value : int,  lore : String = "", monsterType : TDCardData_Monster.MonsterType = TDCardData_Monster.MonsterType.Ghost):
	CardName = cardName
	IsMonster = isMonster
	TexturePath = texturePath
	Value = value
	Suit = suit
	if(IsMonster):
		MonsterType = monsterType
	Lore = lore
	return
