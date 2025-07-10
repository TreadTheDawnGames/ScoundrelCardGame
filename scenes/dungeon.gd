extends Node2D
class_name Dungeon


@onready var WeaponManager: WeaponsManager = $Managers/AttackBonusManager
@onready var Deck: TDCardStack = $Managers/Deck
@onready var Health: HealthManager = $Managers/Health
@onready var Money: MoneyManager = $Managers/MoneyManager
@onready var Room: RoomManager = $Managers/RoomManager
@onready var Tooltip: TooltipManager = $Managers/TooltipManager

func _ready() -> void:
	WeaponManager = get_node("Managers/AttackBonusManager")
	Deck = get_node("Managers/Deck")
	Health = get_node("Managers/Health")
	Money = get_node("Managers/MoneyManager")
	Room = get_node("Managers/RoomManager")
	Tooltip = get_node("Managers/TooltipManager")
	return
