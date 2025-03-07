extends Button

func _ready() -> void:
	button_down.connect(ButtonAction)

func ButtonAction():
	var card = CardFactory.CreateCardFromData(Deck.DrawCard())
	card.SetDrawn(true)
	owner.get_node("CanvasLayer").add_child(card)
	return
