class_name PotionAbilities

##Max health +1
static func TwoOfPotions(card : TDCard):
	Health.IncreaseMaxHealth(1)
	card.FreeMarker()
	card.queue_free()
	return
	

static func ThreeOfPotions(card : TDCard):
	print("Performed " + str(card.CardName)+"'s action.")
	card.FreeMarker()
	card.queue_free()
	return

static func FourOfPotions(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

##Weapon bonus +2
static func FiveOfPotions(card : TDCard):
	WeaponManager.AddToAttackBonus(2)
	card.FreeMarker()
	card.queue_free()
	return

static func SixOfPotions(card : TDCard):
	WeaponManager.GetActiveWeapon().CleanWeapon()
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

##Flee for free
static func SevenOfPotions(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	Room.RemoveFromRoom(card)
	Room.Flee()
	Room.ReplenishRoom()
	return

##Peek next room
static func EightOfPotions(card : TDCard):
	var nextRoom = load("res://scenes/card overlays/NextRoomOverlay.tscn").instantiate()
	card.get_tree().root.get_node("Game").add_child(nextRoom)
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func NineOfPotions(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func TenOfPotions(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func JackOfPotions(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func QueenOfPotions(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func KingOfPotions(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func AceOfPotions(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return
