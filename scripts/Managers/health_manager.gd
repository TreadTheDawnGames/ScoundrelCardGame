extends Manager
class_name HealthManager

@export var health_text: RichTextLabel

@export
var maxHealth : int = 20

var currentHealth : int

func Setup():
	currentHealth = maxHealth
	if(health_text):
		health_text.text = str(currentHealth)
	else:
		printerr("No health text in the scene")
func Heal(amount : int):
	currentHealth+=amount
	currentHealth = clamp(currentHealth, 0, maxHealth)
	if(health_text):
		health_text.text = str(currentHealth)
	else:
		printerr("No health text in the scene")
	return

func Damage(amount : int):
	if (amount < 0):
		amount = 0
	Heal(-amount)
	CheckDead()
	return

func SetMaxHealth(value : int):
	maxHealth = value
	_ready()
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
