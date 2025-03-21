class_name WeaponAbilities

static func TwoOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return
	

static func ThreeOfWeapons(card : TDCard):
	print("Performed " + str(card.CardName)+"'s action.")
	card.FreeMarker()
	card.queue_free()
	return

static func FourOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func FiveOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func SixOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func SevenOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func EightOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func NineOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func TenOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func JackOfWeapons(card : TDCard):
	AttackBonus.AddToPassiveBonus(2)
	card.FreeMarker()
	card.queue_free()
	return

static func QueenOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func KingOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func AceOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return
