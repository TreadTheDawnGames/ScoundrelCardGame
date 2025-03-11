extends TDCardData
class_name TDCardData_Art
var Art : Texture2D

func _init(name : String, art : Texture2D):
	super._init(name)
	Art = art
	return

func SpecialSetup(card : TDCard):
	card.Art = card.get_node("Art")
	card.Art.texture = Art
	pass

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
