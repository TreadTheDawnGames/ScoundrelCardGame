extends TDCardData_Art
class_name TDCardData_Potion

var AbilityDescription : String
var PotionAbility : Callable
#
#func PotionAbility(card : TDCard) -> void:
	#print("Potion Ability")
	#Health.IncreaseMaxHealth(1)
	#card.FreeMarker()
	#card.queue_free()
	#return

func _init(name : String, art : String, value : int, abilityDescription : String, potionAbility : Callable):
	super._init(name, value, art, abilityDescription)
	useName = "Heal, Potion, PEquip"
	PotionAbility = potionAbility
	Suit = SuitType.Potion
	return
	
func EnterUsable(playArea : TDCardPlayArea, card : TDCard)->void:
	if(playArea is not PotionEquipArea):
		return
	var slot : TDCardPositionMarker2D = playArea.get_node("EquippedSlot")
	if(!slot):
		return
	if(slot.isFilled):
		card.usable = false
		return
	super.EnterUsable(playArea, card)
	return
	
func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.ValidPlayType("Heal")):
		print("Heal")
		card.FreeMarker()
		Health.Heal(Value)
		Transitioner.AddToDiscard(self)
		card.queue_free()
	elif(playArea.ValidPlayType("Potion")):
		PotionAbility.call(card)
		Transitioner.AddToDiscard(self)
		card.queue_free()
		
	elif(playArea.ValidPlayType("PEquip")):
		var slot : TDCardPositionMarker2D = playArea.get_node("EquippedSlot")
		if(!slot.isFilled):
			card.FillMarker(slot)
			card._Played = false
	Room.RemoveFromRoom(card)
	return
