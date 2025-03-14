extends TDCardData
class_name Test_CardData

func PlayCard(_playArea : TDCardPlayArea, card : TDCard) -> void:
	match _playArea.GetPlayType():
		"Type1":
			print("Played Type1")
			Deck.StackCard(self)
			card.queue_free()
		"Type2":
			print("Played Type2")
			card.queue_free()
		_: print("Something else went wrong")
	return

func SetGoToPos(card : TDCard) -> void:
	card.returnToHome = true
	card.OGPos = card.PlayZone.position
	return
