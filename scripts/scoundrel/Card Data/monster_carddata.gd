extends TDCardData_Art
class_name TDCardData_Monster

var slain : bool = false

func _init(cardName : String, art : String, value : int, lore : String, suit : SuitType):
	super._init(cardName, value, art, lore, suit)
	useName = "Monster"
	Suit = suit

	return

func HoverEnterAction(card : TDCard):
	if(!slain):
		return super.HoverEnterAction(card)
	return true
	
func Frame(card : TDCard):
	if(slain):
		card.Art.scale = card.Art.scale.lerp(Vector2.ONE, 0.25)
	else:
		super.Frame(card)
	return

func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.get_parent() is not TDCard_Weapon): #without weapon
		Transitioner.AddToDiscard(self)
		Attack(Value - WeaponManager.GetAndResetBonus())
		card.FreeMarker()
		card.queue_free()
	else:
		var weaponCard : TDCard_Weapon = playArea.get_parent()
		var weaponCardData : TDCardData_Weapon = playArea.get_parent().Data
		var monsterCard : TDCard_Monster = card
		if(playArea.GetPlayType().contains("Monster")): #With weapon
			if(_WeaponValid(weaponCardData)):
				Attack(Value - weaponCardData.Value - WeaponManager.GetAndResetBonus())
				monsterCard.FillMarker(weaponCard.Data.GetUnfilledCardSlot())
				weaponCardData.MonsterSlots.append(monsterCard.monster_stack_marker)
				weaponCardData.UpdateLastMonster(Value)
				weaponCardData.AddSlainMonster(monsterCard)
				slain = true
			else: #weapon too damaged
				Attack(Value - WeaponManager.GetAndResetBonus())
				Transitioner.AddToDiscard(self)
				monsterCard.FreeMarker()
				card.queue_free()
	Room.RemoveFromRoom(card)
	card.StopMouseDetectable()
	return

func _CheckCardValid(card : TDCard) -> bool:
	if(card is not TDCard_Monster):
		return false
	return true

func _WeaponValid(weaponData : TDCardData_Weapon) -> bool:
	if(weaponData.LastMonsterValue > Value):
		return true
	return false

func Attack(amount : int):
	Health.Damage(amount)
	return
	
func ClickAction(card : TDCard):
	super.ClickAction(card)
	return

func Revive():
	slain = false
	return
