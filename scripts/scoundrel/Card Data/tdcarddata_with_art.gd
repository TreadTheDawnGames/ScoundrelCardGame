extends TDCardData
class_name TDCardData_Art
var Art : Texture2D
var useName : String

func IsUsable(playName : String) -> bool:
	if(playName.contains(useName)):
		return true
	return false


func _init(name : String, art : Texture2D):
	super._init(name)
	Art = art
	return

func SpecialSetup(card : TDCard):
	card.Art = card.get_node("Art")
	card.Art.texture = Art
	pass


func EnterUsable(_playArea : TDCardPlayArea, card : TDCard)->void:
	if(IsUsable(_playArea.GetPlayType())):
		card.usable = true
	else:
		card.usable = false
	return

func Frame(card : TDCard) -> void:
	TDCardActions_DefOf.Frame.Run(card)
	
func HoverEnterAction(card : TDCard):
	card.z_index = 500
	card.get_parent().move_child(card, 0)
	return
	
func HoverExitAction(card : TDCard):
	card.z_index = 0
	card.get_parent().move_child(card, card.get_parent().get_child_count()-1)
	return
