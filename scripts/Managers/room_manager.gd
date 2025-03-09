extends Node
class_name RoomManager

var revealedCards : Array[TDCard]
@onready var card_board: TDCardBoard = $"../CardBoard"

func ReplenishRoom():
	while revealedCards.size() < 4:
		if(Deck.Count()>0):
			revealedCards.push_back(card_board.AddCard(Deck.DrawCard(), false))
		else: 
			break
	return
