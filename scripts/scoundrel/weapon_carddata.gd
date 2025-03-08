extends CardData
class_name CardData_Weapon

var WeaponStrength : int

func _init(name : String, art : Texture2D, weaponStrength : int) -> void:
	super._init(name, art)
	WeaponStrength = weaponStrength
	return

func PlayCard(name : String, card : Card) -> void:
	match name:
		"Equip":
			print("Equipped " + CardName)
	return
