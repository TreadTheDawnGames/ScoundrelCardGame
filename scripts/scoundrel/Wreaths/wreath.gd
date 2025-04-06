class_name Wreath

@export
var Art : Texture2D
@export
var WreathName : String = ""
var Price : int = 0
func ValidForData(_data : TDCardData) -> bool:
	return true
	
func Copy() -> Wreath:
	return Wreath.new(Art.resource_path, Price, WreathName)

func _init(art : String, price : int, wreathName : String):
	Art = load(art)
	WreathName = wreathName
	Price = price
	return

## Called when visual card is initialized
func Setup(card : TDCard):
	if (WreathName.is_empty()):
		printerr("Wreath has no name. It will not be findable in the WreathLibrary.")
	var bCard : TDCard_Base = card as TDCard_Base
	var sprite = Sprite2D.new()
	sprite.texture = Art 
	var data : TDCardData_Art = card.Data
	sprite.position.y+= -6 * (data.Wreaths.find(self))
	bCard.WreathContainer.add_child(sprite)
	return

func PrePlay(_cardData : TDCardData):
	return
	
func PostPlay(_cardData : TDCardData):
	return

func Attach(_cardData : TDCardData):
	return

func Detach(_cardData : TDCardData):
	return	
