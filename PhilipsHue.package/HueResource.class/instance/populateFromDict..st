initialization
populateFromDict: aDictionarry

	"you get a 'JSON' dict from the Hue API. Populate yourself with it"
	
	name := aDictionarry at: #name