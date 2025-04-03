extends Wreath
class_name PermanentBonusWreath
@export
var Bonus : int = 0
@export
var ValidSuitTargets : Array[TDCardData_Art.SuitType]

func _init(art : String, bonus: int, validSuitTargets : Array[TDCardData_Art.SuitType], wreathName : String = "PermanentBonusWreath"):
	super._init(art, wreathName)
	ValidSuitTargets = validSuitTargets
	Bonus = bonus
	return

func Copy() -> Wreath:
	return PermanentBonusWreath.new(Art.resource_path, Bonus, ValidSuitTargets, WreathName)

func ValidForData(data : TDCardData) -> bool:
	var disallowedSuits : Array[TDCardData_Art.SuitType] = [TDCardData_Art.SuitType.Beasts, TDCardData_Art.SuitType.Ghosts, TDCardData_Art.SuitType.Weapons, TDCardData_Art.SuitType.Potions]
	for type in ValidSuitTargets:
		disallowedSuits.erase(type)
		
	return !disallowedSuits.has(data.Suit)


func Attach(data : TDCardData):
	data.Value += Bonus
	return
