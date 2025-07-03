class_name Levels

static func Get(which : int) -> Array[CardInfo]:
	return Level(which) as Array[CardInfo]

static func Level(num : int) -> Array:
	match num:
		2: return [CardLibrary.Bea2()]as Array[CardInfo]
		4: return [CardLibrary.Bea3()]as Array[CardInfo]
		5: return [CardLibrary.Bea4(), CardLibrary.Gho2(),   ]as Array[CardInfo]
		6: return [CardLibrary.Bea5(), CardLibrary.Gho3(),   ]as Array[CardInfo]
		7: return [CardLibrary.Bea6(), CardLibrary.Gho4(),   ]as Array[CardInfo]
		8: return [CardLibrary.Bea7(), CardLibrary.Gho5(),   ]as Array[CardInfo]
		9: return [CardLibrary.Bea8(), CardLibrary.Gho6(),   ]as Array[CardInfo]
		10: return [CardLibrary.Bea9(), CardLibrary.Gho7(),   ]as Array[CardInfo]
		12: return [CardLibrary.Bea10(), CardLibrary.Gho8(),  ]as Array[CardInfo]
		13: return [CardLibrary.BeaJ(), CardLibrary.Gho9(),  ]as Array[CardInfo]
		14: return [CardLibrary.BeaQ(), CardLibrary.Gho10(), ]as Array[CardInfo]
		15: return [CardLibrary.BeaK(), CardLibrary.GhoJ(),  ]as Array[CardInfo]
		16: return [CardLibrary.BeaA(), CardLibrary.GhoQ(),  ]as Array[CardInfo]
		17: return [CardLibrary.GhoK(),  ]as Array[CardInfo]
		18: return [CardLibrary.GhoA(),  ]as Array[CardInfo]
		_: printerr("No such level: " + str(num))
	return []as Array[CardInfo]
