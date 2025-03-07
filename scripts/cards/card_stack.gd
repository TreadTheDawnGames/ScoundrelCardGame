extends Node
class_name CardStack

var Cards : Array[CardData]

func Count() -> int:
	return Cards.size()

func StackCard(card : CardData) -> void:
	Cards.push_front(card)
	return
	
func BuryCard(card : CardData) -> void:
	Cards.push_back(card)
	return
	
func DrawCard(fromBottom : bool = false) -> CardData:
	if(fromBottom):
		return Cards.pop_back()
	else:
		return Cards.pop_front()
	
func DrawCardAt(index : int) -> CardData:
	return Cards.pop_at(index)

func BuryAt(index : int, card : CardData) -> void:
	Cards.insert(index, card)
	return
	
