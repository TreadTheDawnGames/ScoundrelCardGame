class_name Tip
extends PanelContainer
var lore : String
@onready var textLabel: RichTextLabel = $RichTextLabel

func _ready() -> void:
	textLabel.text = lore
