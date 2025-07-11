extends Manager
class_name LevelTransitioner

var curLevel : int = 1
var Discard : TDCardStack 

func Setup() -> void:
	Discard = TDCardStack.new()
	Dungeon.instance.Room.ReplenishingRoom.connect(TransitionToNextLevel)
	return

func TransitionToNextLevel():
	if(CheckLevelClear()):
		curLevel += 1
		ClearBoard()
		Dungeon.instance.WeaponManager.SetActiveWeapon(null)
		#add monsters with 8+level to discard, shuffle, and put into deck.
		Discard.PutArray(CardInfo.MultipleCardsFromInfo(Levels.Get(curLevel)))
		Discard.Shuffle()
		
		Dungeon.instance.Deck.PutStack(Discard)
		Discard.Clear()
		#Deck.Shuffle()
		#Room.ReplenishRoom()
		
		print("Staring level " + str(curLevel))
	else:
		print("Unable to advance.")
	return

func ClearBoard():
	Discard.PutStack(Dungeon.instance.Deck)
	Dungeon.instance.Deck.Clear()
	
	var cardsToCleanup = Dungeon.instance.Room.card_board._board + Dungeon.instance.Room.roomCards
	print("---emptying room---")
	for card in cardsToCleanup:
		if(!is_instance_valid(card)):
			continue
		if(Discard.has(card.Data)):
			continue
		print("Still in room: "+card.CardName)
		var data = card.Data
		if(card.Data is TDCardData_Weapon):
			data.Unequip(card)
		if(card.Data is TDCardData_Monster):
			data.Revive()
		
		Discard.PutCard(data)
		card.FreeMarker()
		card.queue_free()
	Dungeon.instance.Room.card_board._board.clear()
	for slot in Dungeon.instance.Room.roomSlots:
		slot.SetUnfilled()
	print("Cards in discard: "+str(Discard.Cards.size()))
	print("------")
	return

func AddToDiscard(cardData : TDCardData):
	Discard.PutCard(cardData)
	return

func CheckLevelClear() -> bool:
	print("checking level clear...")
	var cardsToCheck = Dungeon.instance.Deck.Cards + Dungeon.instance.Room.GetRoomCardData()
	for data in cardsToCheck:
		if(data.Suit == TDCardData_Art.SuitType.Beasts or data.Suit == TDCardData_Art.SuitType.Ghosts):
			print("Level not cleared. Monsters remain.")
			return false
	print("Level cleared. All monsters slain.")
	return true
