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
	Dungeon.instance.WeaponManager.AddToPassiveBonus(2)
	card.FreeMarker()
	card.queue_free()
	return

static func QueenOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	var info = CardLibrary.Pot3()
	var data1 : TDCardData = TDCardData_Potion.new(info.CardName, info.TexturePath, info.Value, info.Lore, TDCardData_Art.SuitType.Potions, info.ExtraParams)
	var info2 = CardLibrary.Pot4()
	var data2 : TDCardData = TDCardData_Potion.new(info2.CardName, info2.TexturePath, info2.Value, info2.Lore, TDCardData_Art.SuitType.Potions, info2.ExtraParams)
	var bonusPots : Array[TDCardData] = [data1, data2]

	Dungeon.instance.Deck.PutArray(bonusPots)
	Dungeon.instance.Deck.Shuffle()
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func KingOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	Dungeon.instance.Money.AlterMoney(20)
	print("Performed " + str(card.CardName)+"'s action.")
	return

static func AceOfWeapons(card : TDCard):
	card.FreeMarker()
	card.queue_free()
	print("Performed " + str(card.CardName)+"'s action.")
	return
