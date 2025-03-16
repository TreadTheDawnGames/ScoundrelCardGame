extends TDCardData_Potion
class_name TwoOfPotions

func SpecialSetup(card : TDCard):
	AbilityDescription = "+1 Max Health."
	super.SpecialSetup(card)
	return

func PotionAbility(card : TDCard) -> void:
	Health.IncreaseMaxHealth(1)
	card.FreeMarker()
	card.queue_free()
	return
