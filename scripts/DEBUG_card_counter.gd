extends RichTextLabel

func _process(_delta: float) -> void:
	var count = str(Deck.Count())
	text = "Cards in deck: " + count
	return
