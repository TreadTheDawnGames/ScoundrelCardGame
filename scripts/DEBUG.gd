extends Node

var newCardAction = createCard
@export
var textures : Array[Texture2D]

func RandTex() -> Texture:
	return textures.pick_random()

func createCard():
	var card = CardFactory.CreateCardFromData(Test_CardData.new("CardName", RandTex()))
	card.SetDrawn(true)
	get_node("CanvasLayer").add_child(card)
	return

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Debug-NewCard")):
		createCard()
	return
