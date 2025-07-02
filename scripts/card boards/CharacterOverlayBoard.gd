extends OverlayCardBoard
class_name CharacterCardBoard

func _ready() -> void:
	super._ready()
	var royalty : Array[CardInfo] = [
		CardLibrary.WepJ(), 
		CardLibrary.WepQ(), 
		CardLibrary.WepK(), 
	]
		
	var i = 0
	for info in royalty:
		var data = TDCardData_Character.new(info.CardName, info.TexturePath, info.Value, info.Lore, TDCardData_Art.SuitType.Weapons, info.ExtraParams)
		AddCard(data,true, true, Slots[0][i])
		i+=1
		
