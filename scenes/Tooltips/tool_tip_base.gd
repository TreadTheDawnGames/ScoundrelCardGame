class_name Tip
extends PanelContainer
@onready var textLabel: RichTextLabel = $RichTextLabel
#@onready var mouseArea: Area2D = $Area2D

var hovered : bool = false



func SetLore(lore : String, card : TDCardData) -> int:
	#textLabel.get_rect().size.y = 0
	#set_size(Vector2(size.x, 0))
	get_node("RichTextLabel").text = StringFormatter.Format(lore, card)
	reset_size()
	
	#textLabel.tooltip_text = StringFormatter.Keywords(lore)
	return int(textLabel.size.y)

#func _ready() -> void:
	#mouseArea.connect("mouse_entered", func():
		#hovered = true
		#print("Hovered"))
	#mouseArea.connect("mouse_exited", func(): 
		#hovered = false 
		#Tooltip._hide()
		#print("Unhovered"))

#func _make_custom_tooltip(for_text: String) -> Object:
	#var ToolTipLabel : RichTextLabel = RichTextLabel.new()
	#ToolTipLabel.bbcode_enabled = true
	#ToolTipLabel.text = for_text
	#ToolTipLabel.custom_minimum_size=Vector2(300,64)
	#return
