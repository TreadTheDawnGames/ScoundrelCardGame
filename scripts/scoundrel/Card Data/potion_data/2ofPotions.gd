extends TDCardData_Potion
class_name TwoOfPotions

func SpecialSetup(card : TDCard):
	super.SpecialSetup(card)
	Lore = "+1 Max Health."
	return

func PotionAbility(card : TDCard) -> void:
	Health.IncreaseMaxHealth(1)
	card.FreeMarker()
	card.queue_free()
	return
