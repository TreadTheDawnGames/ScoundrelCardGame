extends TDCard_Base
class_name TDCard_Weapon

@onready var use_monster_area: TDCardPlayArea = $UseMonsterArea
@onready var useMonsterCollisionShape: CollisionShape2D = $UseMonsterArea/CollisionShape2D
@onready var monster_pos_marker: TDCardPositionMarker2D = $MonsterPosMarker
