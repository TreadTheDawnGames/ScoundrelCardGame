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
	var isValid = data.Suit in ValidSuitTargets
	print("Namd / Valid Suits / current / valid: ", data.CardName, " / ", ValidSuitTargets, " / ", data.Suit, " / ", isValid)
	return isValid 


func Attach(data : TDCardData):
	data.Value += Bonus
	return
