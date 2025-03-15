extends TDCardData_Art
class_name TDCardData_Potion

var HealthValue : int
var AbilityDescription : String

func SpecialSetup(card : TDCard):
	super.SpecialSetup(card)
	if(card is TDCard_Base):
		var potionCard : TDCard_Base = card
		var potionTT : Tooltip_Potion = potionCard.tooltip
		potionTT._visuals.abilityDescription = AbilityDescription
	pass

func PotionAbility(card : TDCard) -> void:
	print("Potion Ability")
	Health.IncreaseMaxHealth(1)
	card.FreeMarker()
	card.queue_free()
	return

func _init(name : String, art : String, healthValue : int, abilityDescription : String):
	super._init(name, art)
	useName = "Heal, Potion"
	HealthValue = healthValue
	AbilityDescription = abilityDescription
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
