extends Node
class_name AttackBonusManager

var _AttackBonus : int = 0

func GetAndResetAttackBonus() -> int:
	var buffer = _AttackBonus
	_AttackBonus = 0
	return buffer
	
func GetAttackBonus() -> int:
	return _AttackBonus
	
func SetAttackBonus(setTo:int):
	_AttackBonus = setTo
	return
	
func AddToAttackBonus(add:int):
	_AttackBonus += add
	return
