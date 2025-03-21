extends TDCardData
class_name TDCardData_Art
var Art : Texture2D
var useName : String
var Lore : String = ""

func IsUsable(areaPlayName : String) -> bool:
	return useName.contains(areaPlayName)

func _init(name : String, art : String, lore : String):
	super._init(name)
	Lore = lore
	if(ResourceLoader.exists(art)):
		Art = load(art)
	else:
		printerr(art + " does not exist.")
	return

func SpecialSetup(card : TDCard):
	card.Art = card.get_node("Art")
	card.Art.texture = Art
	if(card is TDCard_Base):
		print(CardName)
		card.tooltip = card.get_node("Tooltip")
		card.tooltip.Setup(Lore)
	pass

func EnterUsable(_playArea : TDCardPlayArea, card : TDCard)->void:
	card.usable = IsUsable(_playArea.GetPlayType())
	return

func GrabAction(card : TDCard):
	card.get_parent().move_child(card, card.get_parent().get_child_count()-1)
	card.tooltip.show_tooltip = false
	return

func DropAction(card: TDCard):
	var myCard : TDCard_Base = card
	myCard.tooltip.show_tooltip = true
	myCard.tooltip._mouse_entered()
	return

func Frame(card : TDCard) -> void:
	TDCardActions_DefOf.Frame.Run(card)
	return
	
func HoverEnterAction(card : TDCard):
	card.z_index = 500
	return
	
func HoverExitAction(card : TDCard):
	card.z_index = 0
	return
