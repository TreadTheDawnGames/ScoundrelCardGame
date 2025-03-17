extends TDCardData_Character

func SpecialSetup(card:TDCard):
	Lore = "11 Health | +2 Passive Weapon Strength"
	super.SpecialSetup(card)
	return

func SpecialAction():
	AttackBonus.AddToPassiveBonus(2)
