as yet unclassified
populateFromDict: aDictionary
 
	super populateFromDict: aDictionary.
	(aDictionary at: #conditions) do: [ :cond |
		self addCondition: ( 
			HueCondition new
				populateFromDict: cond;
				yourself) ].
	(aDictionary at: #actions) do: [ :act |
		self addAction: ( 
			HueAction new
				populateFromDict: act;
				yourself) ].