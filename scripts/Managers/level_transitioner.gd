extends Node
class_name LevelTransitioner

var curLevel : int = 1
var Discard : TDCardStack 

func _ready() -> void:
	Discard = TDCardStack.new()
	owner.Room.ReplenishingRoom.connect(TransitionToNextLevel)
	return

func TransitionToNextLevel():
	if(CheckLevelClear()):
		curLevel += 1
		ClearBoard()
		owner.WeaponManager.SetActiveWeapon(null)
		#add monsters with 8+level to discard, shuffle, and put into deck.
		Discard.PutArray(CardInfo.MultipleCardsFromInfo(Levels.Get(curLevel)))
		Discard.Shuffle()
		
		owner.Deck.PutStack(Discard)
		Discard.Clear()
		#Deck.Shuffle()
		#Room.ReplenishRoom()
		
		print("Staring level " + str(curLevel))
	else:
		print("Unable to advance.")
	return

func ClearBoard():
	Discard.PutStack(owner.Deck)
	owner.Deck.Clear()
	
	var cardsToCleanup = owner.Room.card_board._board + owner.Room.roomCards
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
	owner.Room.card_board._board.clear()
	for slot in owner.Room.roomSlots:
		slot.SetUnfilled()
	print("Cards in discard: "+str(Discard.Cards.size()))
	print("------")
	return

func AddToDiscard(cardData : TDCardData):
	Discard.PutCard(cardData)
	return

func CheckLevelClear() -> bool:
	print("checking level clear...")
	var cardsToCheck = owner.Deck.Cards + owner.Room.GetRoomCardData()
	for data in cardsToCheck:
		if(data.Suit == TDCardData_Art.SuitType.Beasts or data.Suit == TDCardData_Art.SuitType.Ghosts):
			print("Level not cleared. Monsters remain.")
			return false
	print("Level cleared. All monsters slain.")
	return true
