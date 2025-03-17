extends TDCardData_Potion
class_name SevenOfPotions

func SpecialSetup(card : TDCard):
	super.SpecialSetup(card)
	Lore = "Flee a room for free."
	return

func PotionAbility(card : TDCard) -> void:
	card.FreeMarker()
	card.queue_free()
	Room.RemoveFromRoom(card)
	Room.Flee()
	Room.ReplenishRoom()
	return
