extends TDCardData_Art
class_name TDCardData_Weapon

var LastMonsterValue : int = Value
var MonsterSlots : Array[TDCardPositionMarker2D]
var SlainMonsters : Array[TDCard]
var equipped:bool = false
var weaponArea : Weapon_TDCardPlayArea

func _init(name : String, art : String, value : int, lore : String) -> void:
	super._init(name, value, art, lore)
	useName = "Equip, Discard"
	LastMonsterValue = 15
	return
	
func SpecialSetup(card:TDCard)->void:
	super.SpecialSetup(card)
	if(CheckCardValid(card)):
		var myCard : TDCard_Weapon = card
		myCard.monster_pos_marker = myCard.get_node("MonsterPosMarker")
		myCard.useMonsterCollisionShape = myCard.get_node("UseMonsterArea/CollisionShape2D")
		myCard.useMonsterCollisionShape.disabled = true
		MonsterSlots.push_back(card.monster_pos_marker)
	else:
		printerr("Unable to set up card: \"" + card.CardName + ".\" It is not of type TDCard_Weapon. " + card.get_class())
	return

func PlayCard(playArea : TDCardPlayArea, card : TDCard) -> void:
	if(playArea is Weapon_TDCardPlayArea):
		weaponArea = playArea
		if(!equipped and !weaponArea.weaponEquipped):
			if(playArea.ValidPlayType("Equip")):
				Equip(card)
	elif(playArea.ValidPlayType("Discard")):
		Unequip(card)
	Room.RemoveFromRoom(card)
	return

func Equip(card : TDCard):
	print("Equipped " + CardName)
	weaponArea.SetEquipped(true)
	card.FillMarker(weaponArea.get_node("EquippedSlot"))
	card.useMonsterCollisionShape.disabled = false
	equipped = true
	card._Played = false
	card.tooltip.show_tooltip = false
	WeaponManager.SetActiveWeapon(self)
	return

func Unequip(card : TDCard):
	print("Unequipped " + CardName)
	if(weaponArea):
		weaponArea.SetEquipped(false)
		
	for monster in SlainMonsters:
		monster.FreeMarker()
		monster.queue_free()
	WeaponManager.SetActiveWeapon(null)
	card.FreeMarker()
	card.queue_free()
	return
	
func CheckCardValid(card : TDCard) -> bool:
	if(card is not TDCard_Weapon):
		return false
	return true

func EnterUsable(_playArea : TDCardPlayArea, card : TDCard)->void:
	if(_playArea is Weapon_TDCardPlayArea):
		var myWeaponArea : Weapon_TDCardPlayArea = _playArea
		if(myWeaponArea.weaponEquipped):
			card.usable = false
			return
	super.EnterUsable(_playArea, card)
	return
	
func GetUnfilledCardSlot() -> TDCardPositionMarker2D:
	for slot : TDCardPositionMarker2D in MonsterSlots:
		if(is_instance_valid(slot)):
			if(!slot.isFilled):
				return slot
	return null

func DropAction(card : TDCard):
	if(!equipped):
		super.DropAction(card)
	card.get_parent().move_child(card, 0)
	return

func UpdateLastMonster(monstStr : int):
	LastMonsterValue = monstStr
	return
	
func AddSlainMonster(monster : TDCard_Monster):
	SlainMonsters.append(monster)
	return

func CleanWeapon():
	for monster in SlainMonsters:
		monster.FreeMarker()
		monster.queue_free()
	SlainMonsters.clear()
	LastMonsterValue = 15
	return
