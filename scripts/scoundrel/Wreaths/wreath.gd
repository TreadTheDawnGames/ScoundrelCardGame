extends Node
class_name Wreath

@export
var art : Texture2D

func Setup(card : TDCard) -> bool:
	var bCard : TDCard_Base = card as TDCard_Base
	var sprite = Sprite2D.new()
	sprite.texture = art 
	sprite.position.y+= -6 * bCard.WreathContainer.get_child_count()
	bCard.WreathContainer.add_child(sprite)
	return true

func PrePlay(_cardData : TDCardData):
	return
	
func PostPlay(_cardData : TDCardData):
	return

func Attach(_cardData : TDCardData):
	return

func Detach(_cardData : TDCardData):
	return	
