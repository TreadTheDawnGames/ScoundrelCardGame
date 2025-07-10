extends Wreath
class_name GoldWreath

func _init(art : String, price : int, wreathName : String, allowedDuplicates : bool):
	super._init(art, price, wreathName, allowedDuplicates)
	Lore = "Gives +VALUE $ when played."
	return

func PostPlay(cardData : TDCardData):
	print("altering money")
	push_warning("Unable to alter money. Money used to be global but now is not.")
	#Money.AlterMoney(cardData.Value)
	return

func Copy() -> Wreath:
	return GoldWreath.new(Art.resource_path, Price, WreathName, AllowedDuplicates)
