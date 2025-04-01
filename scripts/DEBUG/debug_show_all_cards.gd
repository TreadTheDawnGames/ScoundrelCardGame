extends OverlayCardBoard
class_name Debug_ShowAllCards

var nextRoom : Array[TDCardData]
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

	nextRoom = Deck.Cards + Room.GetRoomCardData()
	nextRoom.sort_custom(
		func(a, b): 
			if(a.Suit == b.Suit) :
				return a.Value < b.Value
			else:
				return a.Suit < b.Suit )
	var Weapons =  GetAllOfType(nextRoom, TDCardData_Art.SuitType.Weapons)
	var Potions =  GetAllOfType(nextRoom, TDCardData_Art.SuitType.Potions)
	var Ghosts  =  GetAllOfType(nextRoom, TDCardData_Art.SuitType.Ghosts)
	var Beasts =  GetAllOfType(nextRoom, TDCardData_Art.SuitType.Beasts)

	var FirstRow =  Slots.slice(0, 13)
	var SecondRow = Slots.slice(13, 26)
	var ThirdRow =  Slots.slice(26, 39)
	var FourthRow = Slots.slice(39, 52)
	
	ApplySlots(Weapons, FirstRow)
	ApplySlots(Potions, SecondRow)
	ApplySlots(Ghosts,  ThirdRow)
	ApplySlots(Beasts,  FourthRow)
	
	
	return

func GetAllOfType(array : Array[TDCardData], type : TDCardData_Art.SuitType) -> Array[TDCardData]:
	var returnMe : Array[TDCardData]
	for item in array:
		if item.Suit == type:
			print(item.Suit)
			returnMe.append(item)
	return returnMe

func ApplySlots(infos : Array[TDCardData], mySlots : Array[TDCardPositionMarker2D]):
	var i = 0
	for info in infos:
		if(!is_instance_valid(info)):
			continue
		print(info.CardName)
		var card = AddCard(info,false,true, mySlots[i])
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
