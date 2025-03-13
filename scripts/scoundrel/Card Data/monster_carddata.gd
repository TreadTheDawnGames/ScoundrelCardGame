extends TDCardData_Art
class_name TDCardData_Monster

var DamageValue : int
enum MonsterType {Ghost, Beast}
var Type : MonsterType

func _init(cardName : String, art : Texture2D, damageValue : int, type : MonsterType):
	super._init(cardName, art)
	DamageValue = damageValue
	Type = type
	return

func EnterUsable(playType : String, card : TDCard):
	return
	
func ExitUsable(card : TDCard):
	return

func PlayCard(playType : String, card : TDCard) -> void:
	if(playType.contains("Attack")):
			print("Attack")
			card.FreeMarker()
			card.queue_free()
	return

func CheckCardValid(card : TDCard) -> bool:
	if(card is not TDCard_Monster):
		return false
	return true
