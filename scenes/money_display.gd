extends RichTextLabel

func _process(_delta: float) -> void:
	text = "Money: " + str(Money.CurrentMoney())
	return
