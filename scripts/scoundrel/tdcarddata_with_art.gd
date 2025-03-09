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
