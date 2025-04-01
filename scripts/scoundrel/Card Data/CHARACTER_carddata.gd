extends TDCardData_Art
class_name TDCardData_Character

var Ability : Callable

func _init(name : String, art : String, value:int, lore : String, ability : Callable, suit : SuitType):
	super._init(name, value, art, lore, suit)
	useName = "Select"
	Ability = ability
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
