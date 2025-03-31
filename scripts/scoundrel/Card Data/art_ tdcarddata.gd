extends TDCardData
class_name TDCardData_Art
var Art : Texture2D
var useName : String
var Lore : String = ""
var Wreaths : Array[Wreath]

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
		card.WreathContainer = card.get_node("Art/WreathContainer")
		for wreath : Wreath in Wreaths:
			wreath.Setup(card)
	pass

func EnterUsable(_playArea : TDCardPlayArea, card : TDCard)->void:
	card.usable = IsUsable(_playArea.GetPlayType())
	return

func GrabAction(card : TDCard):
	card.get_parent().move_child(card, card.get_parent().get_child_count()-1)
	card.tooltip.show_tooltip = false
	print(Wreaths.size())
	return

func Preplay(_playArea, card):
	for wreath in Wreaths:
		wreath.PrePlay(self)
	Room.card_board.DeselectCard(card)
	return

func Postplay(_playArea, _card):
	for wreath in Wreaths:
		wreath.PostPlay(self)
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
	Room.card_board.SelectCard(card)
	print("selected " + card.CardName)
	return
	
func HoverExitAction(card : TDCard):
	card.z_index = 0
	Room.card_board.DeselectCard(card)
	print("deselected " + card.CardName)
	
	return
	
##card is required for wreath setup.
func AddWreath(wreath : Wreath, card : TDCard):
	if(Wreaths.size() > 4):
		print("Unable to add wreath: Card is at max wreaths.")
		return
	wreath.Attach(self)
	wreath.Setup(card)
	Wreaths.append(wreath)
	return
	
func RemoveWreath(wreath : Wreath):
	wreath.Detach(self)
	Wreaths.erase(wreath)
	return
