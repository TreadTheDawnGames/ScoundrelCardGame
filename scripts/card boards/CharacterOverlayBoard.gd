extends OverlayCardBoard
class_name CharacterCardBoard

func _ready() -> void:
	super._ready()
	var royalty : Array[CardInfo] = [
	CardInfo.new("JackofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/JackofWeapons.png", 11, "11 Health \n +2 Passive Weapon Bonus", {"Ability": WeaponAbilities.JackOfWeapons}),
	CardInfo.new("QueenofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/QueenofWeapons.png", 12, "12 Health", {"Ability": WeaponAbilities.QueenOfWeapons}),
	CardInfo.new("KingofWeapons", TDCardData_Art.SuitType.Weapons, "res://assets/cards/KingofWeapons.png", 13, "13 Health", {"Ability": WeaponAbilities.KingOfWeapons}),
	]
		
	var i = 0
	for info in royalty:
		var data = TDCardData_Character.new(info.CardName, info.TexturePath, info.Value, info.Lore, TDCardData_Art.SuitType.Weapons, info.ExtraParams)
		AddCard(data,false,true, Slots[0][i])
		i+=1
		
