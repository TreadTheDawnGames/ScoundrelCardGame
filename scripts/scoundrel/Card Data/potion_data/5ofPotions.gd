extends TDCardData_Potion
class_name FiveOfPotions

func SpecialSetup(card : TDCard):
	Lore = "Next attack +2."
	super.SpecialSetup(card)
	return

func PotionAbility(card : TDCard) -> void:
	AttackBonus.AddToAttackBonus(2)
	card.FreeMarker()
	card.queue_free()
	test(card, func(param : String):print(param))
	return

func test(card:TDCard, hello : Callable):
	hello.call()
	return
