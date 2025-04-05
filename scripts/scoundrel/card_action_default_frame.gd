extends TDCardAction
class_name TDCardAction_Frame

func Run(card : TDCard, _delta : float) -> void:
	if(TDCard.hoveredCards.size() > 0):
		if(TDCard.hoveredCards[-1] != card):
			card._hovered = false
		else:
			card._hovered = true
	if(card._hovered):
		if(card.grabbed):
			if(not card.usable):
				card.Art.scale = card.Art.scale.lerp(Vector2(1.33,1.33), 0.25)
			else:
				card.Art.scale = card.Art.scale.lerp(Vector2(0.75, 0.75), 0.25) 
		else:
			card.Art.scale = card.Art.scale.lerp(Vector2(1.25,1.25), 0.25)
	else:
		card.Art.scale = card.Art.scale.lerp(Vector2.ONE, 0.25)
	return
