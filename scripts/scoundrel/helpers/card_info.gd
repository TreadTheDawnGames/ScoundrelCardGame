class_name CardInfo

var CardName : String
var IsMonster : bool
var TexturePath : String
var Value : int
var MonsterType : TDCardData_Monster.MonsterType
enum SuitType {Monsters, Potions, Weapons}
var Suit : SuitType
var Lore : String
var PotionAbility : Callable

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

static func CreatePotion(cardName : String, texturePath : String, value : int,  lore : String, ability : Callable) -> CardInfo:
	var card = CardInfo.new(cardName, SuitType.Potions, false, texturePath, value, lore)
	card.PotionAbility = ability
	return card
