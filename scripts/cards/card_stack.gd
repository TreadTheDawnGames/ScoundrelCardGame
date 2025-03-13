extends Node
class_name TDCardStack

var Cards : Array[TDCardData]

##Returns the number of cards in the stack
func Count() -> int:
	return Cards.size()

##Places card on top of the stack.
func PutCard(card : TDCardData) -> void:
	Cards.push_back(card)
	return

##Places card on the bottom of the stack.
func BuryCard(card : TDCardData) -> void:
	Cards.push_front(card)
	return

## Returns and removes the card on top of the stack. If fromBottom, returns the bottom.
func DrawCard(fromBottom : bool = false) -> TDCardData:
	if(Count() > 0):
		if(fromBottom):
			return Cards.pop_front()
		else:
			return Cards.pop_back()
	else:
		print("There are no cards in " + name + " to draw.")
		return null

##Returns and removes the card at index.
func DrawCardAt(index : int) -> TDCardData:
	return Cards.pop_at(index)

## Returns the card on top of the deck
func Peek() -> TDCardData:
	return Cards.back()
	
## Returns the card data at index.
func PeekAt(index : int) -> TDCardData:
	return Cards.get(index)
##Places card at index.
func BuryAt(index : int, card : TDCardData):
	return Cards.insert(index, card)
	
##Places parameter stack on top of this stack.
func PutStack(stack : TDCardStack) -> void:
	Cards.append_array(stack.cards)
	return

##Places parameter stack on top of this stack.
func PutArray(stack : Array[TDCardData]) -> void:
	Cards.append_array(stack)
	return

##Places parameter stack on the bottom of this stack.
func BuryStack(stack : TDCardStack) -> void:
	stack.Cards.append_array(Cards)
	Cards = stack.Cards
	return

##Places parameter stack on the bottom of this stack.
func BuryArray(stack : Array[TDCardData]) -> void:
	stack.append_array(Cards)
	Cards = stack
	return

func Shuffle() -> void:
	Cards.shuffle()
	return
