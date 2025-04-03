extends TDCardData_Ability
class_name TDCardData_Potion

func _init(name : String, art : String, value : int, abilityDescription : String,  suit : SuitType, extraParams : Dictionary[String, Variant]):
	super._init(name,art, value, abilityDescription, suit, extraParams, "Ability")
	useName += "Heal, PEquip"
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
	var handled : bool = false
	
	if(playArea.ValidPlayType("Heal")):
		print("Heal")
		card.FreeMarker()
		Health.Heal(Value)
		Transitioner.AddToDiscard(self)
		card.queue_free()
		handled = true
	elif(playArea.ValidPlayType("PEquip")):
		var slot : TDCardPositionMarker2D = playArea.get_node("EquippedSlot")
		if(!slot.isFilled):
			card.FillMarker(slot)
			card._Played = false
			handled = true
	if(handled):
		Room.RemoveFromRoom(card)
	else:
		super.PlayCard(playArea, card)
	return
