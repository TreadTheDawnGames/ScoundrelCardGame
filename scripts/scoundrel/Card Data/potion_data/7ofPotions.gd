extends TDCardData_Potion
class_name SevenOfPotions

func SpecialSetup(card : TDCard):
	AbilityDescription = "Flee a room for free."
	super.SpecialSetup(card)
	return

func PotionAbility(card : TDCard) -> void:
	card.FreeMarker()
	card.queue_free()
	Room.RemoveFromRoom(card)
	Room.Flee()
	Room.ReplenishRoom()
	return
