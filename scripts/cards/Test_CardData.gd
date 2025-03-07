extends CardData
class_name Test_CardData


func PlayCard(playType : String, card : Card) -> void:
	match playType:
		"Type1":
			print("Played Type1")
			Deck.StackCard(self)
			card.queue_free()
		_: print("Something else went wrong")
	return

func SetGoToPos(card : Card) -> void:
	card.returnToHome = true
	card.OGPos = card.PlayZone.position
	return
