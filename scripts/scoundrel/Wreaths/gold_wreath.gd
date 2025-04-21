extends Wreath
class_name GoldWreath

func _init(art : String, price : int, wreathName : String, allowedDuplicates : bool):
	super._init(art, price, wreathName, allowedDuplicates)
	return

func PostPlay(cardData : TDCardData):
	print("altering money")
	Money.AlterMoney(cardData.Value)
	return

func Copy() -> Wreath:
	return GoldWreath.new(Art.resource_path, Price, WreathName, AllowedDuplicates )
