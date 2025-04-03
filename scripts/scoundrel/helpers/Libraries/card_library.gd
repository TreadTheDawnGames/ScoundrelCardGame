class_name CardLibrary

static var specialDeck : Array[CardInfo]=[
	#Weapons
	CardInfo.new("2ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/2ofWeapons.png", 2, "", {}),
	CardInfo.new("3ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/3ofWeapons.png", 3, "", {}),
	CardInfo.new("4ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/4ofWeapons.png", 4, "", {}),
	CardInfo.new("5ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/5ofWeapons.png", 5, "", {}),
	CardInfo.new("6ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/6ofWeapons.png", 6, "", {}),
	CardInfo.new("7ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/7ofWeapons.png", 7, "", {}),
	CardInfo.new("8ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/8ofWeapons.png", 8, "", {}),
	CardInfo.new("9ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/9ofWeapons.png", 9, "", {}),
	CardInfo.new("10ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/10ofWeapons.png", 10, "", {}),
	CardInfo.new("AceofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/AceofWeapons.png", 14, "Swird: Killer of many.", {}),
	#Potions
	CardInfo.new("2ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/2ofPotions.png", 2, "+1 Max Health", {"Ability": PotionAbilities.TwoOfPotions}),
	CardInfo.new("3ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/3ofPotions.png", 3, "Ability Description: 3",{"Ability": PotionAbilities.ThreeOfPotions}),
	CardInfo.new("4ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/4ofPotions.png", 4, "Ability Description: 4",{"Ability": PotionAbilities.FourOfPotions}),
	CardInfo.new("5ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/5ofPotions.png", 5, "+2 to next attack.",{"Ability": PotionAbilities.FiveOfPotions}),
	CardInfo.new("6ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/6ofPotions.png", 6, "Completely repairs your weapon.",{"Ability": PotionAbilities.SixOfPotions}),
	CardInfo.new("7ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/7ofPotions.png", 7, "Flee a room for free.",{"Ability": PotionAbilities.SevenOfPotions}),
	CardInfo.new("8ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/8ofPotions.png", 8, "Peek at the next room.",{"Ability": PotionAbilities.EightOfPotions}),
	CardInfo.new("9ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/9ofPotions.png", 9, "Ability Description: 9",{"Ability": PotionAbilities.NineOfPotions}),
	CardInfo.new("10ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/10ofPotions.png", 10, "Ability Description: 10",{"Ability": PotionAbilities.TenOfPotions}),
	CardInfo.new("JackofPotions",TDCardData_Art.SuitType.Potions, "res://assets/cards/JackofPotions.png", 11, "Ability Description: Jack",{"Ability": PotionAbilities.JackOfPotions}),
	CardInfo.new("QueenofPotions",TDCardData_Art.SuitType.Potions, "res://assets/cards/QueenofPotions.png", 12, "Ability Description: Queen",{"Ability": PotionAbilities.QueenOfPotions}),
	CardInfo.new("KingofPotions",TDCardData_Art.SuitType.Potions, "res://assets/cards/KingofPotions.png", 13, "Ability Description: King",{"Ability": PotionAbilities.KingOfPotions}),
	CardInfo.new("AceofPotions",TDCardData_Art.SuitType.Potions, "res://assets/cards/AceofPotions.png", 14, "Doesn't do anything. It just has art right now.",{"Ability": PotionAbilities.AceOfPotions}),
	#Ghosts
	CardInfo.new("2ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/2ofGhosts.png", 2, "", {}),
	CardInfo.new("3ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/3ofGhosts.png", 3, "", {}),
	CardInfo.new("4ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/4ofGhosts.png", 4, "", {}),
	CardInfo.new("5ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/5ofGhosts.png", 5, "", {}),
	CardInfo.new("6ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/6ofGhosts.png", 6, "", {}),
	CardInfo.new("7ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/7ofGhosts.png", 7, "", {}),
	CardInfo.new("8ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/8ofGhosts.png", 8, "", {}),
	CardInfo.new("9ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/9ofGhosts.png", 9, "", {}),
	CardInfo.new("10ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/10ofGhosts.png", 10,"", {}),
	CardInfo.new("JackofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/JackofGhosts.png", 11,"", {}),
	CardInfo.new("QueenofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/QueenofGhosts.png", 12, "", {}),
	CardInfo.new("KingofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/KingofGhosts.png", 13,"", {}),
	CardInfo.new("AceofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/AceofGhosts.png", 14,"King Ghost, something something lore.", {}),
	#Beasts
	CardInfo.new("2ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/2ofBeasts.png", 2, "", {}),
	CardInfo.new("3ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/3ofBeasts.png", 3, "", {}),
	CardInfo.new("4ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/4ofBeasts.png", 4, "", {}),
	CardInfo.new("5ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/5ofBeasts.png", 5, "", {}),
	CardInfo.new("6ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/6ofBeasts.png", 6, "", {}),
	CardInfo.new("7ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/7ofBeasts.png", 7, "", {}),
	CardInfo.new("8ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/8ofBeasts.png", 8, "", {}),
	CardInfo.new("9ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/9ofBeasts.png", 9, "", {}),
	CardInfo.new("10ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/10ofBeasts.png", 10, "Issa kitteh. He wants to eat your face.", {}),
	CardInfo.new("JackofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/JackofBeasts.png", 11, "", {}),
	CardInfo.new("QueenofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/QueenofBeasts.png", 12, "", {}),
	CardInfo.new("KingofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/KingofBeasts.png", 13, "", {}),
	CardInfo.new("AceofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/AceofBeasts.png", 14, "", {}),
	]
static var devDeck : Array[CardInfo] = [
	CardInfo.new("2ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/2ofWeapons.png", 2 , "", {}),
	CardInfo.new("AceofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/AceofWeapons.png", 14, "Swird: Killer of many.", {}),
	#Potions
	CardInfo.new("AceofPotions",TDCardData_Art.SuitType.Potions, "res://assets/cards/AceofPotions.png", 14, "Doesn't do anything. It just has art right now.", {"Ability": PotionAbilities.AceOfPotions}),
	
		#Ghosts
	CardInfo.new("AceofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/AceofGhosts.png", 14,"King Ghost, something something lore.", {}),
	#Beasts
	CardInfo.new("10ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/10ofBeasts.png", 10, "Issa kitteh. He wants to eat your face.", {}),
	CardInfo.new("AceofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/QueenofBeasts.png", 12, "", {}),
	]
static var standardDeck : Array[CardInfo] = [
	#Weapons
	CardInfo.new("2ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/2ofWeapons.png", 2, "", {}),
	CardInfo.new("3ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/3ofWeapons.png", 3, "", {}),
	CardInfo.new("4ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/4ofWeapons.png", 4, "", {}),
	CardInfo.new("5ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/5ofWeapons.png", 5, "", {}),
	CardInfo.new("6ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/6ofWeapons.png", 6, "", {}),
	CardInfo.new("7ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/7ofWeapons.png", 7, "", {}),
	CardInfo.new("8ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/8ofWeapons.png", 8, "", {}),
	CardInfo.new("9ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/9ofWeapons.png", 9, "", {}),
	CardInfo.new("10ofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/10ofWeapons.png", 10, "", {}),
	CardInfo.new("JackofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/JackofWeapons.png", 11, "", {}),
	CardInfo.new("QueenofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/QueenofWeapons.png", 12, "", {}),
	CardInfo.new("KingofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/KingofWeapons.png", 13, "", {}),
	CardInfo.new("AceofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/AceofWeapons.png", 14, "", {}),
	#Potions
	CardInfo.new("2ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/2ofPotions.png", 2, "", {}),
	CardInfo.new("3ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/3ofPotions.png", 3, "", {}),
	CardInfo.new("4ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/4ofPotions.png", 4, "", {}),
	CardInfo.new("5ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/5ofPotions.png", 5, "", {}),
	CardInfo.new("6ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/6ofPotions.png", 6, "", {}),
	CardInfo.new("7ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/7ofPotions.png", 7, "", {}),
	CardInfo.new("8ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/8ofPotions.png", 8, "", {}),
	CardInfo.new("9ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/9ofPotions.png", 9, "", {}),
	CardInfo.new("10ofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/10ofPotions.png", 10, "", {}),
	CardInfo.new("JackofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/JackofPotions.png", 11, "", {}),
	CardInfo.new("QueenofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/QueenofPotions.png", 12, "", {}),
	CardInfo.new("KingofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/KingofPotions.png", 13, "", {}),
	CardInfo.new("AceofPotions", TDCardData_Art.SuitType.Potions, "res://assets/cards/AceofPotions.png", 14, "", {}),
	#Ghosts
	CardInfo.new("2ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/2ofGhosts.png", 2, "", {}),
	CardInfo.new("3ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/3ofGhosts.png", 3, "", {}),
	CardInfo.new("4ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/4ofGhosts.png", 4, "", {}),
	CardInfo.new("5ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/5ofGhosts.png", 5, "", {}),
	CardInfo.new("6ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/6ofGhosts.png", 6, "", {}),
	CardInfo.new("7ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/7ofGhosts.png", 7, "", {}),
	CardInfo.new("8ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/8ofGhosts.png", 8, "", {}),
	CardInfo.new("9ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/9ofGhosts.png", 9, "", {}),
	CardInfo.new("10ofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/10ofGhosts.png", 10,"", {}),
	CardInfo.new("JackofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/JackofGhosts.png", 11,"", {}),
	CardInfo.new("QueenofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/QueenofGhosts.png", 12, "", {}),
	CardInfo.new("KingofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/KingofGhosts.png", 13,"", {}),
	CardInfo.new("AceofGhosts", TDCardData_Art.SuitType.Ghosts, "res://assets/cards/AceofGhosts.png", 14,"", {}),
	#Beasts
	CardInfo.new("2ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/2ofBeasts.png", 2, "", {}),
	CardInfo.new("3ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/3ofBeasts.png", 3, "", {}),
	CardInfo.new("4ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/4ofBeasts.png", 4, "", {}),
	CardInfo.new("5ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/5ofBeasts.png", 5, "", {}),
	CardInfo.new("6ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/6ofBeasts.png", 6, "", {}),
	CardInfo.new("7ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/7ofBeasts.png", 7, "", {}),
	CardInfo.new("8ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/8ofBeasts.png", 8, "", {}),
	CardInfo.new("9ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/9ofBeasts.png", 9, "", {}),
	CardInfo.new("10ofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/10ofBeasts.png", 10, "", {}),
	CardInfo.new("JackofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/JackofBeasts.png", 11, "", {}),
	CardInfo.new("QueenofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/QueenofBeasts.png", 12, "", {}),
	CardInfo.new("KingofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/KingofBeasts.png", 13, "", {}),
	CardInfo.new("AceofBeasts", TDCardData_Art.SuitType.Beasts, "res://assets/cards/AceofBeasts.png", 14, "", {}),
	]

static var ActiveDeck : Array[CardInfo]

static func SetActiveDeck(deck : Array[CardInfo]):
	ActiveDeck = deck
	return
