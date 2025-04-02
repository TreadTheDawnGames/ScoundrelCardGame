class_name WreathLibrary

static func All() -> Array[Wreath]:
	var Wreaths : Array[Wreath]
	var files = DirAccess.get_files_at("res://scenes/wreaths/")
	for file in files:
		if (file.ends_with(".tscn")):
			var wreathScene : PackedScene = load("res://scenes/wreaths/" + file)
			Wreaths.append(wreathScene.instantiate())
	
	return Wreaths
	

static func Rand() -> Wreath:
	return All().pick_random()

static func ByName(string : String) -> Wreath:
	for wreath in All():
		if wreath.wreathName == string:
			return wreath
	return null

static func GuaranteedCompat(data : TDCardData) -> Wreath:
	var compatWreaths : Array
	for wreath : Wreath in All():
		if (wreath.ValidForData(data)):
			compatWreaths.append(wreath)
	return compatWreaths.pick_random()
