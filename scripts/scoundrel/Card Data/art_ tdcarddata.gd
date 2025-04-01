extends TDCardData
class_name TDCardData_Art
var Art : Texture2D
var useName : String
var Lore : String = ""
var Wreaths : Array[Wreath]
var Value : int
var Modifier : int
var clickTimer : SceneTreeTimer
var clickTime : float = 0.2
enum SuitType {Weapons, Potions, Ghosts, Beasts, Shop}
var Suit : SuitType

func IsUsable(areaPlayName : String) -> bool:
	return useName.contains(areaPlayName)

func Refresh():
	
	return

func _init(name : String, value : int, art : String, lore : String, suit : SuitType):
	super._init(name)
	Value = value
	Lore = lore
	Suit = suit
	if(ResourceLoader.exists(art)):
		Art = load(art)
	else:
		printerr(art + " does not exist.")
	return

func SpecialSetup(card : TDCard):
	card.Art = card.get_node("Art")
	card.Art.texture = Art
	if(card is TDCard_Base):
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
	#card.get_parent().move_child(card, card.get_parent().get_child_count()-1)
	card.tooltip.show_tooltip = false
	clickTimer = card.get_tree().create_timer(clickTime)
	return

func Preplay(_playArea, card):
	for wreath in Wreaths:
		wreath.PrePlay(self)
	Room.card_board.DeselectCard(card)
	return

func Postplay(_playArea, _card):
	for wreath in Wreaths:
		wreath.PostPlay(self)
	Modifier = 0
	return

func DropAction(card: TDCard):
	var myCard : TDCard_Base = card
	myCard.tooltip.show_tooltip = true
	myCard.tooltip._mouse_entered()
	if(clickTimer.time_left > 0):
		ClickAction(card)
	return

func Frame(card : TDCard) -> void:
	TDCardActions_DefOf.Frame.Run(card)
	return
	
func HoverEnterAction(card : TDCard):
	if(Room.card_board._selectedCards.size() > 0 and Room.card_board._selectedCards[0] != card):
		return false
	card.z_index = 500
	Room.card_board.SelectCard(card)
	return true
	
func HoverExitAction(card : TDCard):
	card.z_index = 0
	Room.card_board.DeselectCard(card)
	return false
	
##card is required for wreath setup.
func AddWreath(wreath : Wreath, card : TDCard):
	if(Wreaths.size() > 4):
		print("Unable to add wreath: Card is at max wreaths.")
		return
	if(!wreath.Setup(card)):
		return
	wreath.Attach(self)
	Wreaths.append(wreath)
	return
	
func RemoveWreath(wreath : Wreath):
	wreath.Detach(self)
	Wreaths.erase(wreath)
	return

func ClickAction(_card : TDCard):
	print("----" + CardName + "----")
	print("Value: " + str(Value))
	print("Wreath count: "+str(Wreaths.size()))
	return
