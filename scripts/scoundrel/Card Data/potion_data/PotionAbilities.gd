class_name PotionAbilities

static func TwoOfPotions(card : TDCard):
	Health.IncreaseMaxHealth(1)
	card.FreeMarker()
	card.queue_free()
	return
