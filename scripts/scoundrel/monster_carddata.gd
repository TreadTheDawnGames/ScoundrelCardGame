extends CardData
class_name CardData_Monster

var DamageValue : int
enum MonsterType {Ghost, Goblin}
var Type : MonsterType

func _init(cardName : String, art : Texture2D, damageValue : int, type : MonsterType):
	super._init(cardName, art)
	DamageValue = damageValue
	Type = type
	return

func PlayCard(playType : String, card : Card) -> void:
	match playType:
		"Attack":
			print("Attack")
		_: print("Something else went wrong")
	return
	return
