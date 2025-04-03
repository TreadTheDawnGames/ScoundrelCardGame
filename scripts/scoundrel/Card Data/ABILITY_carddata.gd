extends TDCardData_Art
class_name TDCardData_Ability

var AbilityDescription : String
var PotionAbility : Callable

##Extra params: "PotionAbility"
func _init(name : String, art : String, value : int, abilityDescription : String,  suit : SuitType, extraParams : Dictionary[String, Variant]):
	super._init(name, value, art, abilityDescription, suit, extraParams)
	useName = "Heal, Potion, PEquip"
	PotionAbility = extraParams["Ability"]
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
