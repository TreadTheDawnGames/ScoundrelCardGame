extends Node
class_name WeaponsManager

@onready var rich_text_label: RichTextLabel = $/root/Game/DungeonNodes/AttackBonusIcon/RichTextLabel

var _AttackBonus : int = 0
var _PassiveBonus : int = 0
var _ActiveWeapon : TDCardData_Weapon

func _ready() -> void:
	UpdateIcon(GetBonus())
	return

func SetActiveWeapon(weapon : TDCardData_Weapon):
	_ActiveWeapon = weapon
	return

func GetActiveWeapon() -> TDCardData_Weapon:
	return _ActiveWeapon

#region Attack Bonus
func GetAndResetAttackBonus() -> int:
	var buffer = _AttackBonus
	SetAttackBonus(0)
	return buffer
	
func GetAttackBonus() -> int:
	return _AttackBonus 

func GetPassiveBonus() -> int:
	return _PassiveBonus 

func GetBonus() -> int:
	return GetAttackBonus() + GetPassiveBonus()

func GetAndResetBonus() -> int:
	var buffer = _AttackBonus + _PassiveBonus
	_AttackBonus = 0
	UpdateIcon(GetBonus())
	return buffer

func SetAttackBonus(setTo:int):
	_AttackBonus = setTo
	UpdateIcon(GetBonus())
	return


func AddToAttackBonus(add:int):
	_AttackBonus += add
	UpdateIcon(GetBonus())
	return
	

func SetPassiveBonus(setTo:int):
	_PassiveBonus = setTo
	UpdateIcon(GetBonus())
	return

func AddToPassiveBonus(add:int):
	_PassiveBonus += add
	UpdateIcon(GetBonus())
	return

func UpdateIcon(amount : int):
	var textAmount = ""
	if(amount >= 0):
		textAmount = "+"
	textAmount += str(amount)
	rich_text_label.text = textAmount
	return
#endregion
