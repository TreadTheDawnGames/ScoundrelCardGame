extends TDCardData_Character
class_name Character_Jack

func SpecialSetup(card:TDCard):
	Lore = "11 Health | +2 Passive Weapon Strength"
	super.SpecialSetup(card)
	return

func SpecialAction():
	AttackBonus.AddToPassiveBonus(2)
