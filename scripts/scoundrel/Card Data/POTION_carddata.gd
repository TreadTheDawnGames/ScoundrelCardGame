extends TDCardData_Art
class_name TDCardData_Potion

var HealthValue : int
var AbilityDescription : String

func PotionAbility(card : TDCard) -> void:
	print("Potion Ability")
	Health.IncreaseMaxHealth(1)
	card.FreeMarker()
	card.queue_free()
	return

func _init(name : String, art : String, healthValue : int, lore : String):
	super._init(name, art, lore)
	useName = "Heal, Potion"
	HealthValue = healthValue
	return

func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.ValidPlayType("Heal")):
		print("Heal")
		card.FreeMarker()
		Health.Heal(HealthValue)
		card.queue_free()
	elif(playArea.ValidPlayType("Potion")):
		PotionAbility(card)
	Room.RemoveFromRoom(card)
	return
