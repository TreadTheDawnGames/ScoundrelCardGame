extends Wreath
class_name PermanentBonusWreath
@export
var Bonus : int = 0
@export
var ValidSuitTargets : Array[TDCardData_Art.SuitType]

func _init(art : String, price : int, allowedDuplicates : bool, validSuitTargets : Array[TDCardData_Art.SuitType], bonus: int, wreathName : String = "PermanentBonusWreath"):
	super._init(art, price, wreathName, allowedDuplicates)
	ValidSuitTargets = validSuitTargets
	Bonus = bonus
	return

func Copy() -> Wreath:
	return PermanentBonusWreath.new(Art.resource_path, Price, AllowedDuplicates, ValidSuitTargets, Bonus, WreathName)

func ValidForData(data : TDCardData) -> bool:
	var isValid = data.Suit in ValidSuitTargets
	print("Namd / Valid Suits / current / valid: ", data.CardName, " / ", ValidSuitTargets, " / ", data.Suit, " / ", isValid)
	return isValid 


func Attach(data : TDCardData):
	data.Value += Bonus
	return
