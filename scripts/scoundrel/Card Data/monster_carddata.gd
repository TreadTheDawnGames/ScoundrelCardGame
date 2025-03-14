extends TDCardData_Art
class_name TDCardData_Monster

var MonsterStrength : int
enum MonsterType {Ghost, Beast}
var Type : MonsterType

func _init(cardName : String, art : Texture2D, monsterStrength : int, type : MonsterType):
	super._init(cardName, art)
	useName = "Monster"
	MonsterStrength = monsterStrength
	Type = type
	return


func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.get_parent() is not TDCard_Weapon):
		Attack(MonsterStrength)
		card.FreeMarker()
		card.queue_free()
	else:
		var weaponCard : TDCard_Weapon = playArea.get_parent()
		var weaponCardData : TDCardData_Weapon = playArea.get_parent().Data
		var monsterCard : TDCard_Monster = card
		if(playArea.GetPlayType().contains("Monster")):
			if(_WeaponValid(weaponCardData)):
				Attack(MonsterStrength - weaponCardData.WeaponStrength)
				monsterCard.FillMarker(weaponCard.Data.GetUnfilledCardSlot())
				weaponCardData.MonsterSlots.append(monsterCard.monster_stack_marker)
				weaponCardData.UpdateLastMonster(MonsterStrength)
				weaponCardData.AddSlainMonster(monsterCard)
			else:
				Attack(MonsterStrength)
				monsterCard.FreeMarker()
				card.queue_free()
	Room.RemoveFromRoom(card)
	return

func _CheckCardValid(card : TDCard) -> bool:
	if(card is not TDCard_Monster):
		return false
	return true

func _WeaponValid(weaponData : TDCardData_Weapon) -> bool:
	if(weaponData.WeaponStrength >= MonsterStrength and weaponData.LastMonsterValue > MonsterStrength):
		return true
	return false

func Attack(amount : int):
	print("Attack")
	Health.Damage(amount)
	return
