extends OverlayCardBoard
class_name CharacterCardBoard

func _ready():
	super._ready()
	var royalty : Array[CardInfo] = [
	CardInfo.CreateCardWithAbility("JackofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/JackofWeapons.png", 11, "11 Health \n +2 Passive Weapon Bonus", WeaponAbilities.JackOfWeapons),
	CardInfo.new("QueenofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/QueenofWeapons.png", 12, "12 Health"),
	CardInfo.new("KingofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/KingofWeapons.png", 13, "13 Health"),
	]
		
	var i = 0
	for info in royalty:
		var extraParams : Dictionary[String, Variant]
		extraParams.get_or_add("Ability", info.Ability)
		var data = TDCardData_Character.new(info.CardName, info.TexturePath, info.Value, info.Lore, info.Ability, TDCardData_Art.SuitType.Weapons, extraParams)
		AddCard(data,false,true, Slots[i])
		i+=1
		
