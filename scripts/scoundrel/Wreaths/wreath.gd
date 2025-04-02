extends Node
class_name Wreath

@export
var art : Texture2D
@export
var wreathName : String = ""
var setupFlag = false

func ValidForData(_data : TDCardData) -> bool:
	return true

## Called when visual card is initialized
func Setup(card : TDCard):
	if (wreathName.is_empty()):
		printerr("Wreath has no name. It will not be findable in the WreathLibrary.")
	var bCard : TDCard_Base = card as TDCard_Base
	var sprite = Sprite2D.new()
	sprite.texture = art 
	sprite.position.y+= -6 * bCard.WreathContainer.get_child_count()
	bCard.WreathContainer.add_child(sprite)
	setupFlag = true
	return

func PrePlay(_cardData : TDCardData):
	return
	
func PostPlay(_cardData : TDCardData):
	return

func Attach(_cardData : TDCardData):
	return

func Detach(_cardData : TDCardData):
	return	
