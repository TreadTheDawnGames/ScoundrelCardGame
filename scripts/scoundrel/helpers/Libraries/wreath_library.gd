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
	PermanentBonusWreath.new("res://assets/wreaths/Enraged.png", 1, [TDCardData_Art.SuitType.Ghosts, TDCardData_Art.SuitType.Beasts], "EnragedWreath"),
	PermanentBonusWreath.new("res://assets/wreaths/Boiled.png", 1, [TDCardData_Art.SuitType.Potions], "BoiledWreath"),
	PermanentBonusWreath.new("res://assets/wreaths/Sharp.png", 1, [TDCardData_Art.SuitType.Weapons], "SharpWreath"),
	Wreath.new("res://assets/wreaths/GreenWreath.png", "BaseWreath"),
	Wreath.new("res://assets/wreaths/GoldWreath.png", "GoldWreath"),
]

static func Rand() -> Wreath:
	return All.duplicate().pick_random()

static func ByName(string : String) -> Wreath:
	for wreath in All.duplicate():
		if wreath.wreathName == string:
			return wreath.Copy()
	return null

static func RandCompatible(data : TDCardData) -> Wreath:
	return AllCompatible(data).pick_random().Copy()

static func AllCompatible(data : TDCardData) -> Array[Wreath]:
	var compatWreaths : Array[Wreath]
	for wreath : Wreath in All.duplicate():
		print(wreath.WreathName)
		if (wreath.ValidForData(data)):
			compatWreaths.append(wreath)
	return compatWreaths.duplicate()
