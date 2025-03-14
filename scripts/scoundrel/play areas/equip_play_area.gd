extends TDCardPlayArea
class_name Weapon_TDCardPlayArea

var weaponEquipped : bool = false
@onready var monster_play_area_shape: CollisionShape2D = $MonsterPlayArea/MonsterPlayAreaShape

func _ready():
	SetEquipped(false)
	return

func SetEquipped(equipped : bool):
	weaponEquipped = equipped
	monster_play_area_shape.disabled = weaponEquipped
	return
