extends Node2D
class_name Dungeon

static var instance : Dungeon :
	get:
		return instance
	set(value):
		if(instance == null):
			instance = value
@onready var Managers: Node = $Managers
@onready var WeaponManager: WeaponsManager = $Managers/AttackBonusManager
@onready var Deck: TDCardStack = $Managers/Deck
@onready var Health: HealthManager = $Managers/Health
@onready var Money: MoneyManager = $Managers/MoneyManager
@onready var Room: RoomManager = $Managers/RoomManager
@onready var Tooltip: TooltipManager = $Managers/TooltipManager
@onready var Transitioner : LevelTransitioner = $Managers/LevelTransitioner
@onready var Canvas: CanvasLayer = $Canvas

func _ready() -> void:
	instance = self
	WeaponManager = get_node("Managers/AttackBonusManager")
	Deck = get_node("Managers/Deck")
	Health = get_node("Managers/Health")
	Money = get_node("Managers/MoneyManager")
	Room = get_node("Managers/RoomManager")
	Tooltip = get_node("Managers/TooltipManager")
	Canvas = get_node("Canvas")
	for manager in Managers.get_children().filter(func(a): return a is Manager):
		manager.Setup()
	
	return
