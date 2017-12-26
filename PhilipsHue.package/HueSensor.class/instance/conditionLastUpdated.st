condition-creation
conditionLastUpdated

	^ HueCondition new
		address: '/', self apiPath, '/state/lastupdated';
		yourself