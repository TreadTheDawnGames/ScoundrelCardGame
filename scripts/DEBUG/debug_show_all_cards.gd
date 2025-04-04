extends OverlayCardBoard
class_name Debug_ShowAllCards

@onready var button: Button = $Button
static var isOpen : bool = false
func _ready():
	if(Debug_ShowAllCards.isOpen):
		queue_free()
		return
	
	board_title = get_node("Panel/BoardTitle")
	marker_extents = get_node("MarkerExtents")
	board_title.text = label
	var allCards = Deck.Cards + Room.GetRoomCardData()
	MaxWidth = NumOfCardsInPredominantSuit(allCards)
	
	Initialize(GetNumberOfNeededMarkers(allCards), MaxWidth)
	ViewRoom(allCards)
	button.pressed.connect(ReturnRoom)
	isOpen = true
	return

func Initialize(slotCount : int, maxWidth : int = 10):
	
	var anotherThing = (max(slotCount%maxWidth,min(maxWidth, slotCount)))
	var x = marker_extents.get_rect().size.x
	var cellWidth : float = x / anotherThing
	var wOffset : float = cellWidth/2
	
	var thing = ceil(float(slotCount) / float(maxWidth))
	var cellHeight : float = marker_extents.get_rect().size.y / thing
	var hOffset : float = cellHeight/2
	
	for i in slotCount:
		var marker : TDCardPositionMarker2D = TDCardPositionMarker2D.new()
		slotsNode.add_child(marker)
		marker.position = Vector2((cellWidth*(i%maxWidth))+wOffset, cellHeight*floor((float(i) / float(maxWidth)))+hOffset)
		Slots.append(marker)
	return

func ViewRoom(allCards : Array[TDCardData]):
	Room.card_board.SetBoardActive(false)

	
	allCards.sort_custom(
		func(a, b): 
			if(a.Suit == b.Suit) :
				return a.Value < b.Value
			else:
				return a.Suit < b.Suit )
				
	var startIndex : int = 0
	for suit in TDCardData_Art.SuitType:
		print(suit)
		var cardsOfSuit =  GetAllOfType(allCards, TDCardData_Art.SuitType.get(suit))
		if(cardsOfSuit.size() > 0):
			var row =  Slots.slice(startIndex, startIndex + MaxWidth)
			ApplySlots(cardsOfSuit, row)
			startIndex += MaxWidth
		
		pass
	
	return

func GetAllOfType(array : Array[TDCardData], type : TDCardData_Art.SuitType) -> Array[TDCardData]:
	var returnMe : Array[TDCardData]
	for item in array:
		if item.Suit == type:
			returnMe.append(item)
	return returnMe

func GetNumberOfNeededMarkers(array:Array[TDCardData]) -> int:
	var needed : int = NumSuitsPresent(array) * NumOfCardsInPredominantSuit(array)
	return needed

func NumSuitsPresent(array : Array[TDCardData]) -> int:
	var presentSuits : int = 0
	for suit in TDCardData_Art.SuitType:
		if (array.filter(func(a): return a.Suit == TDCardData_Art.SuitType.get(suit)).size() > 0):
			presentSuits+=1
			continue
	return presentSuits

func NumOfCardsInPredominantSuit(array : Array[TDCardData]) -> int:
	var mostCards : int = 0
	for suit in TDCardData_Art.SuitType:
		var suitCount : int = GetAllOfType(array, TDCardData_Art.SuitType.get(suit)).size()
		if(suitCount > mostCards):
			mostCards = suitCount
	return mostCards


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
