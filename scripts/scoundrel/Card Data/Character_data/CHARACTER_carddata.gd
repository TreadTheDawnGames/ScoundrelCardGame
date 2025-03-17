extends TDCardData_Art
class_name TDCardData_Character

var Value : int

func _init(name : String, art : String, value:int, lore : String):
	super._init(name, art, lore)
	useName = "Select"
	Value = value
	return

func SpecialSetup(card : TDCard):
	super.SpecialSetup(card)
	#card.StopDoDragDrop()
	return
	
func PlayCard(_playArea : TDCardPlayArea, card : TDCard):
	if(!_playArea.ValidPlayType(useName)):
		return
	var game : GameHub = card.get_tree().root.get_node("Game")
	game.dungeon_nodes.show()
	Health.SetMaxHealth(Value)
	game.pregame.hide()
	SpecialAction()
	return

func SpecialAction():
	return
