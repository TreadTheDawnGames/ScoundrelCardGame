extends CardData
class_name Test_CardData


func PlayCard(playType : String, card : Card) -> void:
	match playType:
		"Type1":
			print("Played Type1")
			card.Played = false
		"Type2":
			print("Played Type2")
			card.Played = false
		"Type3":
			print("Played Type3")
			card.Played = false
		"Type4":
			print("Played Type4")
			card.queue_free()
		_: print("Something else went wrong")
	return
