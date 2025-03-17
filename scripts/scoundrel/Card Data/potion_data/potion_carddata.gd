extends TDCardData_Art
class_name TDCardData_Potion

var HealthValue : int

func SpecialSetup(card : TDCard):
	super.SpecialSetup(card)
	pass

func PotionAbility(_card : TDCard) -> void:
	print("Potion Ability: " + CardName)
	return

func _init(name : String, art : String, healthValue : int, lore : String = ""):
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
