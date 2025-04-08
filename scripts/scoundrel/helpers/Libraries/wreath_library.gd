class_name WreathLibrary

#static func All() -> Array[Wreath]:
	#var Wreaths : Array[Wreath]
	#var files = DirAccess.get_files_at("res://scenes/wreaths/")
	#for file in files:
		#if (file.ends_with(".tscn")):
			#var wreathScene : PackedScene = load("res://scenes/wreaths/" + file)
			#Wreaths.append(wreathScene.instantiate())
	#
	#return Wreaths
	
static var All : Array[Wreath] = [
	PermanentBonusWreath.new("res://assets/wreaths/Enraged.png", 0, false, [TDCardData_Art.SuitType.Ghosts, TDCardData_Art.SuitType.Beasts], 1, "EnragedWreath"),
	PermanentBonusWreath.new("res://assets/wreaths/Boiled.png", 0, false, [TDCardData_Art.SuitType.Potions], 1, "BoiledWreath"),
	PermanentBonusWreath.new("res://assets/wreaths/Sharp.png", 0, true, [TDCardData_Art.SuitType.Weapons], 1, "SharpWreath"),
	Wreath.new("res://assets/wreaths/GreenWreath.png", 0, "BaseWreath", true),
	Wreath.new("res://assets/wreaths/GoldWreath.png", 0,"GoldWreath", true),
]

static func Rand() -> Wreath:
	return All.duplicate().pick_random()

static func ByName(string : String) -> Wreath:
	for wreath in All.duplicate(true):
		if wreath.wreathName == string:
			return wreath.Copy()
	return null

static func RandCompatible(data : TDCardData) -> Wreath:
	return AllCompatible(data).pick_random().Copy()

static func AllCompatible(data : TDCardData) -> Array[Wreath]:
	var compatWreaths : Array[Wreath]
	if(data.Suit == TDCardData_Art.SuitType.Wreaths):
		return All.duplicate(true)
	for wreath : Wreath in All.duplicate(true):
		if (wreath.ValidForData(data)):
			print("Adding ", wreath.WreathName, " to ", data.CardName)
			compatWreaths.append(wreath)
	return compatWreaths
