initialization
populateFromDict: aDictionary
	super populateFromDict: aDictionary.
	
	operator := aDictionary at: #operator.
	aDictionary at: #value ifPresent: [ :obj |
		value := obj ].