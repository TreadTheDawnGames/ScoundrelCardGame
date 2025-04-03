extends Wreath
class_name PermanentBonusWreath
@export
var bonus : int = 0
enum SuitType {Monster, Weapon, Potion}
@export
var ValidSuitTargets : Array[SuitType]

func ValidForData(data : TDCardData) -> bool:
	var array : Array[SuitType] = [SuitType.Monster, SuitType.Weapon, SuitType.Potion]
	for type in ValidSuitTargets:
		array.erase(type)

	for Suit in array:
		match(Suit):
			SuitType.Monster:
				if(data is not TDCardData_Monster):
					continue
			SuitType.Weapon:
				if(data is not TDCardData_Weapon):
					continue
			SuitType.Potion:
				if(data is not TDCardData_Ability):
					continue
		print("Invalid target: " + data.CardName)
		return false
	return true


func Attach(data : TDCardData):
	data.Value += bonus
	return
