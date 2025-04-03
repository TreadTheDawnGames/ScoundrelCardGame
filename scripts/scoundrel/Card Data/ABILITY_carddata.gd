extends TDCardData_Art
class_name TDCardData_Ability

var Ability : Callable
var AbilityUseName : String

##Extra params: "Ability"
func _init(name : String, art : String, value : int, abilityDescription : String,  suit : SuitType, extraParams : Dictionary[String, Variant], abilityUseName : String):
	super._init(name, art, value, abilityDescription, suit, extraParams)
	useName += abilityUseName
	AbilityUseName = abilityUseName
	if(extraParams.has("Ability")):
		Ability = extraParams["Ability"]
	return
	
func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.ValidPlayType(AbilityUseName)):
		Ability.call(card)
		Transitioner.AddToDiscard(self)
		card.queue_free()
	Room.RemoveFromRoom(card)
	return
