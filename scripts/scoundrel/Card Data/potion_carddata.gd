extends TDCardData_Art
class_name TDCardData_Potion

var HealthValue : int

func PotionAbility() -> void:
	print("Potion Ability")
	return

func _init(name : String, art : Texture2D, healthValue : int):
	super._init(name, art)
	useName = "HealAbility"
	HealthValue = healthValue
	return

func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.GetPlayType().contains("Heal")):
		print("Heal")
		card.FreeMarker()
		card.queue_free()
	elif(playArea.GetPlayType().contains("Ability")):
		PotionAbility()
	return
