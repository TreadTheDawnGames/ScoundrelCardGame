extends TDCardData_Art
class_name Wreath

#@export
#var Art : Texture2D
@export
var WreathName : String = ""
var Price : int = 0
var AllowedDuplicates : bool

func ValidForData(_data : TDCardData) -> bool:
	return true


func Copy() -> Wreath:
	return Wreath.new(Art.resource_path, Price, WreathName, AllowedDuplicates)

func _init(art : String, price : int, wreathName : String, allowedDuplicates : bool):
	Art = load(art)
	WreathName = wreathName
	Price = price
	AllowedDuplicates = allowedDuplicates
	useName = "AddWreath"
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
	
	
func Postplay(playArea : TDCardPlayArea, card : TDCard) -> void:
	super.Postplay(playArea, card)
	if(playArea.ValidPlayType("AddWreath")):
		print("Assigned ", WreathName)
		var assigneeCardData : TDCardData_Art = playArea.owner.Data
		#Okay I think the issue is that AddWrath(self) is adding the 
		#item as a wreath instead of its type. I'm not sure how to fix 
		#that other than to duplicate the logic in each wreath type...
		
		#Scratch that, duplicate logic didn't work either.
		print("Type: ", type_string(typeof(GoldWreath)))
		if(assigneeCardData.AddWreath(self)): #This appears to be the problem?
			assigneeCardData.ShowAllWreaths(playArea.owner)
			card.FreeMarker()
			card.queue_free()
		else:
			card._Played = false
			printerr("Invalid wreath assignal.")
	return


func PrePlay(_cardData : TDCardData):
	return
	
func PostPlay(_cardData : TDCardData):
	print("Hi im a wreath")
	return

func Attach(_cardData : TDCardData):
	return

func Detach(_cardData : TDCardData):
	return	
