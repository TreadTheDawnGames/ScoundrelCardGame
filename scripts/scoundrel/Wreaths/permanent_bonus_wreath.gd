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
	Lore = "+" + str(bonus) +" to card value. Valid card types: "
	var index : int = 0
	for validTarget in ValidSuitTargets:
		Lore += str(TDCardData_Art.SuitType.find_key(validTarget))
		index+=1
		if(index<ValidSuitTargets.size()):
			Lore+=", "
	return

func Copy() -> Wreath:
	return PermanentBonusWreath.new(Art.resource_path, Price, AllowedDuplicates, ValidSuitTargets, Bonus, WreathName)

func ValidForData(data : TDCardData) -> bool:
	if(data == null):
		return false
	var isValid : bool = data.Suit in ValidSuitTargets
	print("Namd / Valid Suits / current / valid: ", data.CardName, " / ", ValidSuitTargets, " / ", data.Suit, " / ", isValid)
	return isValid 


func Attach(data : TDCardData):
	data.Value += Bonus
	return
