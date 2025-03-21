extends OverlayCardBoard
class_name CharacterCardBoard

func _ready():
	super._ready()
	var royalty : Array[CardInfo] = [
	CardInfo.CreateCardWithAbility("JackofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/JackofWeapons.png", 11, "11 Health \n +2 Passive Weapon Bonus", WeaponAbilities.JackOfWeapons),
	CardInfo.new("QueenofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/QueenofWeapons.png", 12, "12 Health"),
	CardInfo.new("KingofWeapons", CardInfo.SuitType.Weapons, false, "res://assets/cards/KingofWeapons.png", 13, "13 Health"),
	]
		
	var i = 0
	for info in royalty:
		var data = TDCardData_Character.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Ability)
		var card = AddCard(data,false,true, Slots[i])
		card.scale *= 4
		i+=1
		
