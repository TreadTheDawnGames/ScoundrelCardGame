extends TDCardData_Art
class_name TDCardData_Shop


var AbilityDescription : String
var SaleCard : TDCardData
var Luckiness : int #Will determine the spawn rate of wreaths (not implimented)
var ShopData : Array

##Extra params: Ability, Luckiness, ShopData
func _init(name : String, art : String, value : int, lore : String, extraParams : Dictionary[String, Variant]):
	super._init(name,art, value, lore, SuitType.Shops, extraParams)
	Luckiness = extraParams["Luckiness"]
	ShopData = extraParams["ShopData"]
	useName += "Ability"
	return
	
func SpecialSetup(card : TDCard):
	super.SpecialSetup(card)
	card.LuckinessDisplay = card.get_node("Art/LuckinessDisplay")
	clamp(Luckiness, 0, 3)
	for i in range(Luckiness+1):
		print(str(i))
		if(i==0):
			continue
		card.LuckinessDisplay.text += "*"
	return
	
func PlayCard(playArea:TDCardPlayArea, card : TDCard):
	if(playArea.ValidPlayType("Ability")):
		card.get_tree().root.get_node("Game").add_child(ShopOverlay.CreateNew(ShopData))
		Transitioner.AddToDiscard(self)
		card.FreeMarker()
		card.queue_free()
	Room.RemoveFromRoom(card)
	return

func ClickAction(card : TDCard):
	super.ClickAction(card)
	print("Luckiness: " + str(Luckiness))
	return
