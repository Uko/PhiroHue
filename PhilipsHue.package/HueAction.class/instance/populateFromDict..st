initialization
populateFromDict: aDictionary
	super populateFromDict: aDictionary.
	
	method := aDictionary at: #method.
	body := aDictionary at: #body