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
enum SuitType {None, Weapons, Potions, Ghosts, Beasts, Wreaths, Shops}
var Suit : SuitType
var ExtraParams : Dictionary[String, Variant]

var properChildIndex : int = 0

func IsUsable(areaPlayName : String) -> bool:
	return useName.contains(areaPlayName)

func Refresh():
	
	return

func _init(name : String, art : String, value : int, lore : String, suit : SuitType, extraParams : Dictionary[String, Variant]):
	super._init(name)
	Value = value
	Lore = lore
	Suit = suit
	ExtraParams = extraParams
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
		card.tooltip.Setup(card)
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
	card._Played = true
	Room.card_board.DeselectCard(card)
	return

func Postplay(_playArea : TDCardPlayArea, _card : TDCard):
	for wreath in Wreaths:
		wreath.PostPlay(self)
	Modifier = 0
	return

func DropAction(card: TDCard):

	var myCard : TDCard_Base = card
	myCard.tooltip.show_tooltip = true
	myCard.tooltip.TooltipEnd()
	if(card._hovered):
		myCard.tooltip.TooltipStart()

	if(clickTimer.time_left > 0):
		ClickAction(card)
	return

func Frame(card : TDCard, delta : float) -> void:
	TDCardActions_DefOf.Frame.Run(card, delta)
	return
	
func HoverEnterAction(card : TDCard):
	# :PukeFace:
	var hoveredCards = TDCard.hoveredCards
	for otherCard in hoveredCards:
		if(is_instance_valid(otherCard)):
			otherCard.z_index = 0
			otherCard.tooltip.TooltipEnd()
		
	card.z_index = RenderingServer.CANVAS_ITEM_Z_MAX
	card.tooltip.show_tooltip = true
	card.tooltip.TooltipStart()
	if(Room.card_board._selectedCards.size() > 0 and Room.card_board._selectedCards[0] != card):
		return false
	Room.card_board.SelectCard(card)
	return true
	
func HoverExitAction(card : TDCard):
	card.z_index = 0
	Room.card_board.DeselectCard(card)
	card.tooltip.TooltipEnd()
	if(TDCard.hoveredCards.size()>0):
		var curHovCard = TDCard.hoveredCards[-1]
		if(is_instance_valid(curHovCard)):
			curHovCard.Data.HoverEnterAction(curHovCard)
		else:
			TDCard.hoveredCards.erase(curHovCard)
	return false
	
##card is required for wreath setup.
func ShowWreath(wreath : Wreath, card : TDCard):
	wreath.Setup(card)
	return

func ShowAllWreaths(card : TDCard):
	for wreathSpr : Sprite2D in card.WreathContainer.get_children():
		wreathSpr.queue_free()
	for wreath in Wreaths:
		ShowWreath(wreath, card)

func AddWreath(wreath : Wreath):
	if(Wreaths.size() > 4):
		print("Unable to add wreath: Card is at max wreaths.")
		return
	if(!wreath.ValidForData(self) and Suit != SuitType.Wreaths):
		return
	wreath.Attach(self)
	Wreaths.append(wreath)
	return
	
func AddMultipleWreaths(wreaths : Array[Wreath]):
	for wreath in wreaths:
		AddWreath(wreath)
	return
	
func RemoveWreath(wreath : Wreath):
	wreath.Detach(self)
	Wreaths.erase(wreath)
	return

func ClickAction(_card : TDCard):
	print("----" + CardName + "----")
	print("Suit: "+str(SuitType.find_key(Suit)))
	print("Value: " + str(Value))
	print("Wreath count: "+str(Wreaths.size()))
	for wreath in Wreaths:
		print("- " + wreath.WreathName)
	return
