extends NinePatchRect
var lore : String

func _ready() -> void:
	get_node("RichTextLabel").text = lore
