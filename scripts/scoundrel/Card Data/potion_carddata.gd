extends TDCardData_Art
class_name TDCardData_Potion

var HealthValue : int

func PotionAbility() -> void:
	print("Potion Ability")
	return

func _init(name : String, art : Texture2D, healthValue : int):
	super._init(name, art)
	HealthValue = healthValue
	return

func PlayCard(name : String, card : TDCard) -> void:
	if(name.contains("Equip")):
			print("Heal")
			card.FreeMarker()
			card.queue_free()
	elif(name.contains("Equip")):
			PotionAbility()
	return
