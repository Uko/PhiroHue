condition-creation
conditionButtonEvent

	^ HueCondition new
		address: '/', self apiPath, '/state/buttonevent';
		yourself