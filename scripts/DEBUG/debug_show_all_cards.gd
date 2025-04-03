extends OverlayCardBoard
class_name Debug_ShowAllCards

var allCards : Array[TDCardData]
@onready var button: Button = $Button
static var isOpen : bool = false

func _ready():
	if(Debug_ShowAllCards.isOpen):
		queue_free()
		return
	super._ready()
	ViewRoom()
	button.pressed.connect(ReturnRoom)
	isOpen = true
	return

func ViewRoom():
	Room.card_board.SetBoardActive(false)

	allCards = Deck.Cards + Room.GetRoomCardData()
	allCards.sort_custom(
		func(a, b): 
			if(a.Suit == b.Suit) :
				return a.Value < b.Value
			else:
				return a.Suit < b.Suit )
	var Weapons =  GetAllOfType(allCards, TDCardData_Art.SuitType.Weapons)
	var Potions =  GetAllOfType(allCards, TDCardData_Art.SuitType.Potions)
	var Ghosts  =  GetAllOfType(allCards, TDCardData_Art.SuitType.Ghosts)
	var Beasts =  GetAllOfType(allCards, TDCardData_Art.SuitType.Beasts)
	var Shops =  GetAllOfType(allCards, TDCardData_Art.SuitType.Shops)


	var FirstRow =  Slots.slice(0, 13)
	var SecondRow = Slots.slice(13, 26)
	var ThirdRow =  Slots.slice(26, 39)
	var FourthRow = Slots.slice(39, 52)
	var FifthRow = Slots.slice(52, 65)
	
	
	ApplySlots(Weapons, FirstRow)
	ApplySlots(Potions, SecondRow)
	ApplySlots(Ghosts,  ThirdRow)
	ApplySlots(Beasts,  FourthRow)
	ApplySlots(Shops, FifthRow)
	
	
	return

func GetAllOfType(array : Array[TDCardData], type : TDCardData_Art.SuitType) -> Array[TDCardData]:
	var returnMe : Array[TDCardData]
	for item in array:
		if item.Suit == type:
			returnMe.append(item)
	return returnMe

func ApplySlots(infos : Array[TDCardData], mySlots : Array[TDCardPositionMarker2D]):
	var i = 0
	for info in infos:
		if(!is_instance_valid(info)):
			continue
		var card : TDCard = AddCardFromItsScene(info,false,true, mySlots[i])
		card.scale *= 4
		i+=1
	i = 0
	return

func ReturnRoom():
	for card in _board:
		card.FreeMarker()
		card.queue_free()

	Room.card_board.SetBoardActive(true)
	Debug_ShowAllCards.isOpen = false
	queue_free()
	return
