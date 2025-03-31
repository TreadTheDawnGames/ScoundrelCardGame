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

func PrePlay(cardData : TDCardData):
	print("Preplay for " + cardData.CardName + "!")
	return
	
func PostPlay(cardData : TDCardData):
	print("Postplay for " + cardData.CardName + "!")
	return

func Attach(cardData : TDCardData):
	print("Attach for " + cardData.CardName + "!")	
	return

func Detach(cardData : TDCardData):
	print("Detach for " + cardData.CardName + "!")
	return	
