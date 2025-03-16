extends NinePatchRect
@onready var rich_text_label: RichTextLabel = $RichTextLabel
@export var abilityDescription : String 

func _ready() -> void:
	rich_text_label.text = abilityDescription
