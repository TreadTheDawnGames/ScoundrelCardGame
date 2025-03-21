extends TDCardData_Art
class_name TDCardData_Monster

var MonsterStrength : int
enum MonsterType {Ghost, Beast}
var Type : MonsterType
var slain : bool = false

func _init(cardName : String, art : String, monsterStrength : int, type : MonsterType, lore : String):
	super._init(cardName, art, lore)
	useName = "Monster"
	MonsterStrength = monsterStrength
	Type = type
	return

func HoverEnterAction(card : TDCard):
	if(!slain):
		super.HoverEnterAction(card)
	return
	
func Frame(card : TDCard):
	if(slain):
		card.Art.scale = card.Art.scale.lerp(Vector2.ONE, 0.25)
	else:
		super.Frame(card)
	return

func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.get_parent() is not TDCard_Weapon):
		Attack(MonsterStrength - WeaponManager.GetAndResetBonus())
		card.FreeMarker()
		card.queue_free()
	else:
		var weaponCard : TDCard_Weapon = playArea.get_parent()
		var weaponCardData : TDCardData_Weapon = playArea.get_parent().Data
		var monsterCard : TDCard_Monster = card
		if(playArea.GetPlayType().contains("Monster")):
			if(_WeaponValid(weaponCardData)):
				Attack(MonsterStrength - weaponCardData.WeaponStrength - WeaponManager.GetAndResetBonus())
				monsterCard.FillMarker(weaponCard.Data.GetUnfilledCardSlot())
				weaponCardData.MonsterSlots.append(monsterCard.monster_stack_marker)
				weaponCardData.UpdateLastMonster(MonsterStrength)
				weaponCardData.AddSlainMonster(monsterCard)
			else:
				Attack(MonsterStrength - WeaponManager.GetAndResetBonus())
				monsterCard.FreeMarker()
				card.queue_free()
	Room.RemoveFromRoom(card)
	slain = true
	card.StopMouseDetectable()
	return

func _CheckCardValid(card : TDCard) -> bool:
	if(card is not TDCard_Monster):
		return false
	return true

func _WeaponValid(weaponData : TDCardData_Weapon) -> bool:
	if(weaponData.LastMonsterValue > MonsterStrength):
		return true
	return false

func Attack(amount : int):
	print("Attack")
	Health.Damage(amount)
	return
