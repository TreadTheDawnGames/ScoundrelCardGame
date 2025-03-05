extends Marker2D
class_name CardSlot

func _ready() -> void:
	get_parent().AreaEntered += MarkDrawn;
	return 
	

func MarkDrawn(node : Node2D) -> void:
	var card : Card = node.Owner;
	card.SetDrawn(true);

	
