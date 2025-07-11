class_name StringFormatter

# Dictionary Entries: {"What to Replace" : "How to replace it", "Next thing to replace" : "How to replace next thing"}
static var replacements = {"Health" : Color.RED, 
	"Passive Weapon Bonus":Color.BLACK, 
	"Attack" : Color.ORANGE,
	"Flee" : Color.GREEN,
	"Peek" : Color.PINK,
	"Repair" : Color.BLUE,
	"Weapon" : Color.DARK_GRAY,
	"Beast" : Color.CYAN,
	"Ghost" : Color.PURPLE,
	"Potion" : Color.WEB_GREEN,
	"Wreath" : Color.CHARTREUSE,
	"[Value]" : Color(5,5,5)
	
	}

static func Format(input : String, card : TDCardData_Art = null) -> String:
	var updatedInput : String = input
	
	for replacementKey : String in replacements.keys():
		if(replacementKey == "[Value]" and card != null):
			updatedInput = updatedInput.replace(replacementKey, str(card.Value))
			continue
		updatedInput = updatedInput.replace(replacementKey, "[color="+replacements.get(replacementKey).to_html()+"]"+replacementKey+"[/color]")#.replace(replacementKey.to_lower(), "[color="+replacements.get(replacementKey).to_html()+"]"+replacementKey.to_lower()+"[/color]")
	
	return updatedInput

static func Keywords(input : String) -> String:
	var keywords : String = ""
	for replacementKey in replacements.keys():
		if(input.contains(replacementKey)):
			keywords+=replacementKey + ", "
	return keywords
