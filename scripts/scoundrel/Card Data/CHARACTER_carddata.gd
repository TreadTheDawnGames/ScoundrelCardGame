extends TDCardData_Ability
class_name TDCardData_Character


func _init(name : String, art : String, value:int, lore : String, suit : SuitType, extraParams : Dictionary[String, Variant]):
	super._init(name, art, value, lore, suit, extraParams, "Select")
	Ability = extraParams["Ability"]
	return

func PlayCard(_playArea : TDCardPlayArea, card : TDCard):
	if(!_playArea.ValidPlayType(useName)):
		return
	var game : GameHub = card.get_tree().root.get_node("Game")
	game.dungeon_nodes.show()
	Health.SetMaxHealth(Value)
	if(Ability):
		Ability.call(card)
	for theCard in game.pregame._board:
		theCard.FreeMarker()
	game.pregame.queue_free()
	return
