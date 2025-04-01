extends RichTextLabel

func _process(_delta: float) -> void:
	var count = str(Transitioner.Discard.Count())
	text = "Cards in Discard: " + count
	return
