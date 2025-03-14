extends Node
class_name HealthManager

#Technically used the Brave search AI to get /root/
@onready var health_text: RichTextLabel = $"/root/Game/CanvasLayer/HealthIcon/HealthText"

@export
var maxHealth : int = 20

var currentHealth : int

func _ready():
	currentHealth = maxHealth
	health_text.text = str(currentHealth)

func Heal(amount : int):
	currentHealth+=amount
	currentHealth = clamp(currentHealth, 0, maxHealth)
	health_text.text = str(currentHealth)
	return

func Damage(amount : int):
	if (amount < 0):
		amount = 0
	Heal(-amount)
	CheckDead()
	return

func IncreaseMaxHealth(amount : int):
	maxHealth += amount
	Heal(amount)
	return

func DecreaseMaxHealth(amount : int):
	maxHealth -= amount
	CheckDead()
	return
	
func IsDead() -> bool:
	return currentHealth <= 0

func CheckDead():
	if(IsDead):
		print("dead")
