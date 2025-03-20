extends TDCardData_Art
class_name TDCardData_Potion

var HealthValue : int
var AbilityDescription : String
var PotionAbility : Callable
#
#func PotionAbility(card : TDCard) -> void:
	#print("Potion Ability")
	#Health.IncreaseMaxHealth(1)
	#card.FreeMarker()
	#card.queue_free()
	#return

func _init(name : String, art : String, healValue : int, abilityDescription : String, potionAbility : Callable):
	super._init(name, art, abilityDescription)
	useName = "Heal, Potion"
	HealthValue = healValue
	PotionAbility = potionAbility
	return

func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea.ValidPlayType("Heal")):
		print("Heal")
		card.FreeMarker()
		Health.Heal(HealthValue)
		card.queue_free()
	elif(playArea.ValidPlayType("Potion")):
		PotionAbility.call(card)
	Room.RemoveFromRoom(card)
	return
