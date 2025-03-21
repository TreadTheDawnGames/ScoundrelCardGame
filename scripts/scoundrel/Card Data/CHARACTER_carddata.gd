extends TDCardData_Art
class_name TDCardData_Character

var Value : int
var Ability : Callable

func _init(name : String, art : String, value:int, lore : String, ability : Callable):
	super._init(name, art, lore)
	useName = "Select"
	Value = value
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
	game.pregame.queue_free()
	return
