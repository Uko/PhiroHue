instance creation
id: aNumber dict: aDictionary

	^ self new
		id: aNumber;
		rawDict: aDictionary;
		populateFromDict: aDictionary;
		yourself 