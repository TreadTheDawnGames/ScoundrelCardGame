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
	
	
	}

static func Format(input : String) -> String:
	var updatedInput = input
	
	for replacementKey in replacements.keys():
		updatedInput = updatedInput.replace(replacementKey, "[color="+replacements.get(replacementKey).to_html()+"]"+replacementKey+"[/color]")
	
	return updatedInput

static func Keywords(input : String) -> String:
	var keywords : String = ""
	for replacementKey in replacements.keys():
		if(input.contains(replacementKey)):
			keywords+=replacementKey + ", "
	return keywords
