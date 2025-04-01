extends Node
class_name LevelTransitioner

var curLevel : int = 0
var Discard : TDCardStack 

func _ready() -> void:
	Discard = TDCardStack.new()
	Room.ReplenishingRoom.connect(TransitionToNextLevel)
	return

func TransitionToNextLevel():
	if(CheckLevelClear()):
		curLevel += 1
		ClearBoard()
		WeaponManager.SetActiveWeapon(null)
		#add monsters with 8+level to discard, shuffle, and put into deck.

		Discard.PutArray(Levels.Get(curLevel))
		Discard.Shuffle()
		
		Deck.PutStack(Discard)
		Discard.Clear()
		#Deck.Shuffle()
		#Room.ReplenishRoom()
		
		print("Staring level " + str(curLevel))
	else:
		print("Unable to advance.")
	return

func ClearBoard():
	Discard.PutStack(Deck)
	Deck.Clear()
	
	var cardsToCleanup = Room.card_board._board + Room.roomCards
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
	Room.card_board._board.clear()
	for slot in Room.roomSlots:
		slot.SetUnfilled()
	print("Cards in discard: "+str(Discard.Cards.size()))
	print("------")
	return

func AddToDiscard(cardData : TDCardData):
	Discard.PutCard(cardData)
	return

func CheckLevelClear() -> bool:
	print("checking...")
	var cardsToCheck = Deck.Cards + Room.roomCards
	for card in cardsToCheck:
		if(card.Suit == TDCardData_Art.SuitType.Beasts or card.Suit == TDCardData_Art.SuitType.Ghosts):
			print("Monsters remain.")
			return false
	print("All monsters slain.")
	return true
