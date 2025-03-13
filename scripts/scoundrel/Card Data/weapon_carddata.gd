extends TDCardData_Art
class_name TDCardData_Weapon

var WeaponStrength : int

func _init(name : String, art : Texture2D, weaponStrength : int) -> void:
	super._init(name, art)
	WeaponStrength = weaponStrength
	return
	
func SpecialSetup(card:TDCard)->void:
	if(CheckCardValid(card)):
		card.collision_shape_2d.disabled = true
	else:
		printerr("Unable to set up card: \"" + card.CardName + ".\" It is not of type TDCard_Weapon. " + card.get_class())
	return

func PlayCard(name : String, card : TDCard) -> void:
	if(name.contains("Equip")):
		print("Equipped " + CardName)
		card.FreeMarker()
		card.queue_free()
	return

func CheckCardValid(card : TDCard) -> bool:
	if(card is not TDCard_Weapon):
		return false
	return true
