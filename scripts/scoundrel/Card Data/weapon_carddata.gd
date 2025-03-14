extends TDCardData_Art
class_name TDCardData_Weapon

var WeaponStrength : int

func _init(name : String, art : Texture2D, weaponStrength : int) -> void:
	super._init(name, art)
	useName = "Equip"
	WeaponStrength = weaponStrength
	return
	
func SpecialSetup(card:TDCard)->void:
	super.SpecialSetup(card)
	if(CheckCardValid(card)):
		var myCard : TDCard_Weapon = card
		myCard.useMonsterCollisionShape = myCard.get_node("UseMonsterArea/CollisionShape2D")
		print(myCard.useMonsterCollisionShape)
		myCard.useMonsterCollisionShape.disabled = true
	else:
		printerr("Unable to set up card: \"" + card.CardName + ".\" It is not of type TDCard_Weapon. " + card.get_class())
	return

func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.GetPlayType().contains("Equip")):
		print("Equipped " + CardName)
		card.FreeMarker()
		card.FillMarker(playArea.get_node("EquippedSlot"))
		card.useMonsterCollisionShape.disabled = false
	return

func CheckCardValid(card : TDCard) -> bool:
	if(card is not TDCard_Weapon):
		return false
	return true
