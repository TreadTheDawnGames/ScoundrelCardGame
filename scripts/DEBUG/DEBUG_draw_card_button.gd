extends Button

func _ready() -> void:
	button_down.connect(ButtonAction)

func ButtonAction():
	var card = CardFactory.CreateCardFromData(Deck.DrawCard())
	if(card):
		card.SetDrawn(true)
		owner.get_node("CanvasLayer").add_child(card)
	else:
		print("no card")
	return
