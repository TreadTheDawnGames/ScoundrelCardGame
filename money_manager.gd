extends Node
class_name MoneyManager

var MoneyAmount : int = 0

func AlterMoney(amount : int):
	MoneyAmount += amount
	return

func CurrentMoney() -> int:
	return MoneyAmount

func TryBuy(price : int) -> int:
	if(MoneyAmount - price >= 0):
		AlterMoney(-price)
		return true
	return false
