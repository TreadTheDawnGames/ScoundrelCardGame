extends TDCardData_Art
class_name TDCardData_Ability

var Ability : Callable
var AbilityUseName : String
var destroyAfterUse : bool = false

##Extra params: "Ability", "DestroyAfterUse"
func _init(name : String, art : String, value : int, abilityDescription : String,  suit : SuitType, extraParams : Dictionary[String, Variant], abilityUseName : String):
	debugClassName = "TDCardData_Ability"
	super._init(name, art, value, abilityDescription, suit, extraParams)
	useName += abilityUseName
	AbilityUseName = abilityUseName
	#if(extraParams.has("Ability")):
		#Ability = extraParams["Ability"]
	#else:
		#printerr(name + " was expecting an extra parameter: Ability, but none was found.")
	#if(extraParams.has("DestroyAfterUse")):
		#destroyAfterUse = extraParams["DestroyAfterUse"]
	#else:
		#printerr(name + " was expecting an extra parameter: DestroyAfterUse, but none was found.")
	return
	
func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.ValidPlayType(AbilityUseName)):
		Ability.call(card)
		if(!destroyAfterUse):
			Transitioner.AddToDiscard(self)
		card.queue_free()
	Room.RemoveFromRoom(card)
	return
