class_name CardLibrary

#region
static func Wep2() -> CardInfo: return CardInfo.new("TwoOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/TwoOfWeapons.png", 2, "", {})
static func Wep3() -> CardInfo: return CardInfo.new("ThreeOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/ThreeOfWeapons.png", 3, "", {})
static func Wep4() -> CardInfo: return CardInfo.new("FourOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/FourOfWeapons.png", 4, "", {})
static func Wep5() -> CardInfo: return CardInfo.new("FiveOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/FiveOfWeapons.png", 5, "", {})
static func Wep6() -> CardInfo: return CardInfo.new("SixOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/SixOfWeapons.png", 6, "", {})
static func Wep7() -> CardInfo: return CardInfo.new("SevenOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/SevenOfWeapons.png", 7, "", {})
static func Wep8() -> CardInfo: return CardInfo.new("EightOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/EightOfWeapons.png", 8, "", {})
static func Wep9() -> CardInfo: return CardInfo.new("NineOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/NineOfWeapons.png", 9, "", {})
static func Wep10() -> CardInfo: return CardInfo.new("TenOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/TenOfWeapons.png", 10, "", {})
static func WepJ() -> CardInfo: return CardInfo.new("JackOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/JackOfWeapons.png", 11, "11 Health \n +2 Passive Weapon Bonus", {"Ability": WeaponAbilities.JackOfWeapons})
static func WepQ() -> CardInfo: return CardInfo.new("QueenOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/QueenOfWeapons.png", 12, "12 Health \n Start with an extra 3 and 4 Potion", {"Ability": WeaponAbilities.QueenOfWeapons})
static func WepK() -> CardInfo: return CardInfo.new("KingOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/KingOfWeapons.png", 13, "13 Health \n Start with $20", {"Ability": WeaponAbilities.KingOfWeapons})
static func WepA() -> CardInfo: return CardInfo.new("AceOfWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/Weapons/AceOfWeapons.png", 14, "Swird: Killer of many.", {})
	#Potions
static func Pot2() -> CardInfo: return CardInfo.new("TwoOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/TwoOfPotions.png", 2, "+1 Max Health", {"Ability": PotionAbilities.TwoOfPotions})
static func Pot3() -> CardInfo: return CardInfo.new("ThreeOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/ThreeOfPotions.png", 3, "Ability Description: Three",{"Ability": PotionAbilities.ThreeOfPotions})
static func Pot4() -> CardInfo: return CardInfo.new("FourOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/FourOfPotions.png", 4, "Ability Description: Four",{"Ability": PotionAbilities.FourOfPotions})
static func Pot5() -> CardInfo: return CardInfo.new("FiveOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/FiveOfPotions.png", 5, "+2 to next Attack.",{"Ability": PotionAbilities.FiveOfPotions})
static func Pot6() -> CardInfo: return CardInfo.new("SixOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/SixOfPotions.png", 6, "Repair your weapon.",{"Ability": PotionAbilities.SixOfPotions})
static func Pot7() -> CardInfo: return CardInfo.new("SevenOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/SevenOfPotions.png", 7, "Flee a room for free.",{"Ability": PotionAbilities.SevenOfPotions})
static func Pot8() -> CardInfo: return CardInfo.new("EightOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/EightOfPotions.png", 8, "Peek at the next room.",{"Ability": PotionAbilities.EightOfPotions})
static func Pot9() -> CardInfo: return CardInfo.new("NineOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/NineOfPotions.png", 9, "Ability Description: Nine",{"Ability": PotionAbilities.NineOfPotions})
static func Pot10()-> CardInfo: return CardInfo.new("TenOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/TenOfPotions.png", 10, "Ability Description: Ten",{"Ability": PotionAbilities.TenOfPotions})
static func PotJ() -> CardInfo: return CardInfo.new("JackOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/JackOfPotions.png", 11, "Ability Description: Jack",{"Ability": PotionAbilities.JackOfPotions})
static func PotQ() -> CardInfo: return CardInfo.new("QueenOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/QueenOfPotions.png", 12, "Ability Description: Queen",{"Ability": PotionAbilities.QueenOfPotions})
static func PotK() -> CardInfo: return CardInfo.new("KingOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/KingOfPotions.png", 13, "Ability Description: King",{"Ability": PotionAbilities.KingOfPotions})
static func PotA() -> CardInfo: return CardInfo.new("AceOfPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/Potions/AceOfPotions.png", 14, "Doesn't do anything. It just has art right now.",{"Ability": PotionAbilities.AceOfPotions})

	#Ghosts
static func Gho2() -> CardInfo: return CardInfo.new("TwoOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/TwoOfGhosts.png", 2, "Ghost", {})
static func Gho3() -> CardInfo: return CardInfo.new("ThreeOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/ThreeOfGhosts.png", 3, "Ghost", {})
static func Gho4() -> CardInfo: return CardInfo.new("FourOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/FourOfGhosts.png", 4, "Ghost", {})
static func Gho5() -> CardInfo: return CardInfo.new("FiveOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/FiveOfGhosts.png", 5, "Ghost", {})
static func Gho6() -> CardInfo: return CardInfo.new("SixOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/SixOfGhosts.png", 6, "Ghost", {})
static func Gho7() -> CardInfo: return CardInfo.new("SevenOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/SevenOfGhosts.png", 7, "Ghost", {})
static func Gho8() -> CardInfo: return CardInfo.new("EightOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/EightOfGhosts.png", 8, "Ghost", {})
static func Gho9() -> CardInfo: return CardInfo.new("NineOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/NineOfGhosts.png", 9, "Ghost", {})
static func Gho10()-> CardInfo: return CardInfo.new("TenOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/TenOfGhosts.png", 10, "Ghost", {})
static func GhoJ() -> CardInfo: return CardInfo.new("JackOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/JackOfGhosts.png", 11, "Ghost", {})
static func GhoQ() -> CardInfo: return CardInfo.new("QueenOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/QueenOfGhosts.png", 12, "Ghost", {})
static func GhoK() -> CardInfo: return CardInfo.new("KingOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/KingOfGhosts.png", 13, "Ghost", {})
static func GhoA() -> CardInfo: return CardInfo.new("AceOfGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/Ghosts/AceOfGhosts.png", 14, "King Ghost, something something lore.", {})
	#Beasts
static func Bea2() : return CardInfo.new("TwoOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/TwoOfBeasts.png", 2, "Beast", {})
static func Bea3() : return CardInfo.new("ThreeOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/ThreeOfBeasts.png", 3, "Beast", {})
static func Bea4() : return CardInfo.new("FourOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/FourOfBeasts.png", 4, "Beast", {})
static func Bea5() : return CardInfo.new("FiveOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/FiveOfBeasts.png", 5, "Beast", {})
static func Bea6() : return CardInfo.new("SixOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/SixOfBeasts.png", 6, "Beast", {})
static func Bea7() : return CardInfo.new("SevenOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/SevenOfBeasts.png", 7, "Beast", {})
static func Bea8() : return CardInfo.new("EightOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/EightOfBeasts.png", 8, "Beast", {})
static func Bea9() : return CardInfo.new("NineOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/NineOfBeasts.png", 9, "Beast", {})
static func Bea10() : return CardInfo.new("TenOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/TenOfBeasts.png", 10, "Beast\nIssa kitteh. He wants to eat your face.", {})
static func BeaJ() : return CardInfo.new("JackOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/JackOfBeasts.png", 11, "Beast", {})
static func BeaQ() : return CardInfo.new("QueenOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/QueenOfBeasts.png", 12, "Beast", {})
static func BeaK() : return CardInfo.new("KingOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/KingOfBeasts.png", 13, "Beast", {})
static func BeaA() : return CardInfo.new("AceOfBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/Beasts/AceOfBeasts.png", 14, "Beast", {})
#endregion

static var SPECIAL : Array[CardInfo]=[
	#Weapons
	Wep2(), Wep3(), Wep4(), Wep5(), Wep6(), Wep7(), Wep8(), Wep9(), Wep10(), WepA(), 
#Potions
	Pot2(), Pot3(), Pot4(), Pot5(), Pot6(), Pot7(), Pot8(), Pot9(), Pot10(), PotJ(), PotQ(), PotK(), PotA(),
#Ghosts
	Gho2(), Gho3(), Gho4(), Gho5(), Gho6(), Gho7(), Gho8(), Gho9(), Gho10(), GhoJ(), GhoQ(), GhoK(), GhoA(),
#Beasts
	Bea2(), Bea3(), Bea4(), Bea5(), Bea6(), Bea7(), Bea8(), Bea9(), Bea10(), BeaJ(), BeaQ(), BeaK(), BeaA(),
	]
static var DEV : Array[CardInfo] = [
	#Weapons
	Wep2(), Wep3(), Wep4(), Wep5(), WepA(),
	#Potions
	Pot2(), Pot3(), Pot4(), Pot5(),
	#Ghosts
	Gho2(), Gho3(), Gho4(), Gho5(), Gho6(), Gho7(), Gho8(),
	##Beasts
	Bea2(), Bea3(), Bea4(), Bea5(), Bea6(), Bea7(), Bea8(),

	CardInfo.new("BasicShop", TDCardData_Art.SuitType.Shops, "res://assets/cards/ShopCards/BasicShopCard.png", 1, "General store for Wreaths, Potions, and Weapons.", 
	{"Luckiness":1,
	"ShopData": [ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Wreaths, [], false, -1, 0, 0),
				ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Weapons, [], false, 0, 0, 0),
				ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Potions, [], false, 0, 0, 0)]}),
	
	CardInfo.new("BasicShop", TDCardData_Art.SuitType.Shops, "res://assets/cards/ShopCards/PotionShopCard.png", 1, "General store for Wreaths, Potions, and Weapons.", 
	{"Luckiness":0,
	"ShopData": [ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Potions, [], false, 0, 0, 0)]}),
	
	CardInfo.new("BasicShop", TDCardData_Art.SuitType.Shops, "res://assets/cards/ShopCards/WeaponShopCard.png", 1, "General store for Wreaths, Potions, and Weapons.", 
	{"Luckiness":2,
	"ShopData": [ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Weapons, [], false, 0, 0, 0),
				ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Weapons, [], false, -1, 0, 0)]}),
				
	CardInfo.new("WreathShop", TDCardData_Art.SuitType.Shops, "res://assets/cards/ShopCards/PotionShopCard.png", 1, "The wreath store.", 
	{"Luckiness":2,
	"ShopData": [ShopOverlay.ShopData.new(TDCardData_Art.SuitType.Wreaths, [], false, 1, 0, 0)]}),
				
	]
#static var STANDARD : Array[CardInfo] = [
	##Weapons
	#CardInfo.new("2ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/2ofWeapons.png", 2, "", {}),
	#CardInfo.new("3ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/3ofWeapons.png", 3, "", {}),
	#CardInfo.new("4ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/4ofWeapons.png", 4, "", {}),
	#CardInfo.new("5ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/5ofWeapons.png", 5, "", {}),
	#CardInfo.new("6ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/6ofWeapons.png", 6, "", {}),
	#CardInfo.new("7ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/7ofWeapons.png", 7, "", {}),
	#CardInfo.new("8ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/8ofWeapons.png", 8, "", {}),
	#CardInfo.new("9ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/9ofWeapons.png", 9, "", {}),
	#CardInfo.new("10ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/10ofWeapons.png", 10, "", {}),
	#CardInfo.new("JackofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/JackofWeapons.png", 11, "", {}),
	#CardInfo.new("QueenofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/QueenofWeapons.png", 12, "", {}),
	#CardInfo.new("KingofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/KingofWeapons.png", 13, "", {}),
	#CardInfo.new("AceofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/AceofWeapons.png", 14, "", {}),
	##Potions
	#CardInfo.new("2ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/2ofPotions.png", 2, "", {}),
	#CardInfo.new("3ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/3ofPotions.png", 3, "", {}),
	#CardInfo.new("4ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/4ofPotions.png", 4, "", {}),
	#CardInfo.new("5ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/5ofPotions.png", 5, "", {}),
	#CardInfo.new("6ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/6ofPotions.png", 6, "", {}),
	#CardInfo.new("7ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/7ofPotions.png", 7, "", {}),
	#CardInfo.new("8ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/8ofPotions.png", 8, "", {}),
	#CardInfo.new("9ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/9ofPotions.png", 9, "", {}),
	#CardInfo.new("10ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/10ofPotions.png", 10, "", {}),
	#CardInfo.new("JackofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/JackofPotions.png", 11, "", {}),
	#CardInfo.new("QueenofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/QueenofPotions.png", 12, "", {}),
	#CardInfo.new("KingofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/KingofPotions.png", 13, "", {}),
	#CardInfo.new("AceofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/AceofPotions.png", 14, "", {}),
	##Ghosts
	#CardInfo.new("2ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/2ofGhosts.png", 2, "", {}),
	#CardInfo.new("3ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/3ofGhosts.png", 3, "", {}),
	#CardInfo.new("4ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/4ofGhosts.png", 4, "", {}),
	#CardInfo.new("5ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/5ofGhosts.png", 5, "", {}),
	#CardInfo.new("6ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/6ofGhosts.png", 6, "", {}),
	#CardInfo.new("7ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/7ofGhosts.png", 7, "", {}),
	#CardInfo.new("8ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/8ofGhosts.png", 8, "", {}),
	#CardInfo.new("9ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/9ofGhosts.png", 9, "", {}),
	#CardInfo.new("10ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/10ofGhosts.png", 10,"", {}),
	#CardInfo.new("JackofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/JackofGhosts.png", 11,"", {}),
	#CardInfo.new("QueenofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/QueenofGhosts.png", 12, "", {}),
	#CardInfo.new("KingofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/KingofGhosts.png", 13,"", {}),
	#CardInfo.new("AceofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/AceofGhosts.png", 14,"", {}),
	##Beasts
	#CardInfo.new("2ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/2ofBeasts.png", 2, "", {}),
	#CardInfo.new("3ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/3ofBeasts.png", 3, "", {}),
	#CardInfo.new("4ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/4ofBeasts.png", 4, "", {}),
	#CardInfo.new("5ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/5ofBeasts.png", 5, "", {}),
	#CardInfo.new("6ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/6ofBeasts.png", 6, "", {}),
	#CardInfo.new("7ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/7ofBeasts.png", 7, "", {}),
	#CardInfo.new("8ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/8ofBeasts.png", 8, "", {}),
	#CardInfo.new("9ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/9ofBeasts.png", 9, "", {}),
	#CardInfo.new("10ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/10ofBeasts.png", 10, "", {}),
	#CardInfo.new("JackofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/JackofBeasts.png", 11, "", {}),
	#CardInfo.new("QueenofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/QueenofBeasts.png", 12, "", {}),
	#CardInfo.new("KingofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/KingofBeasts.png", 13, "", {}),
	#CardInfo.new("AceofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/AceofBeasts.png", 14, "", {}),
	#]
static var ALL : Array[CardInfo] =[
	Wep2(), Wep3(), Wep4(), Wep5(), Wep6(), Wep7(), Wep8(), Wep9(), Wep10(), WepJ(), WepQ(), WepK(), WepA(),
	Pot2(), Pot3(), Pot4(), Pot5(), Pot6(), Pot7(), Pot8(), Pot9(), Pot10(), PotJ(), PotQ(), PotK(), PotA(),
	Gho2(), Gho3(), Gho4(), Gho5(), Gho6(), Gho7(), Gho8(), Gho9(), Gho10(), GhoJ(), GhoQ(), GhoK(), GhoA(),
	Bea2(), Bea3(), Bea4(), Bea5(), Bea6(), Bea7(), Bea8(), Bea9(), Bea10(), BeaJ(), BeaQ(), BeaK(), BeaA(),
	
]
static var ActiveDeck : Array[CardInfo]

static func SetActiveDeck(deck : Array[CardInfo]):
	ActiveDeck = deck
	return
