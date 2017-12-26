instance creation
bridge: aHueBridge resourceClass: aHueResourceClass 
	^ self basicNew
		initializeBridge: aHueBridge
		resourceClass: aHueResourceClass