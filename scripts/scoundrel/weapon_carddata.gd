extends TDCardData_Art
class_name TDCardData_Weapon

var WeaponStrength : int

func _init(name : String, art : Texture2D, weaponStrength : int) -> void:
	super._init(name, art)
	WeaponStrength = weaponStrength
	return

func PlayCard(name : String, card : TDCard) -> void:
	if(name.contains("Equip")):
		print("Equipped " + CardName)
		card.FreeMarker()
		card.queue_free()
	return
