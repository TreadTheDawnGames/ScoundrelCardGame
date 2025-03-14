extends TDCardData_Art
class_name TDCardData_Monster

var DamageValue : int
enum MonsterType {Ghost, Beast}
var Type : MonsterType

func EnterUsable(_playArea : TDCardPlayArea, card : TDCard)->void:
	if(IsUsable(_playArea.GetPlayType())):
		card.usable = true
	else:
		card.usable = false
	return


func _init(cardName : String, art : Texture2D, damageValue : int, type : MonsterType):
	super._init(cardName, art)
	useName = "Monster"
	DamageValue = damageValue
	Type = type
	return


func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.GetPlayType().contains("Monster")):
		print("Attack")
		card.FillMarker(playArea.get_parent().monster_pos_marker)
	return

func CheckCardValid(card : TDCard) -> bool:
	if(card is not TDCard_Monster):
		return false
	return true
