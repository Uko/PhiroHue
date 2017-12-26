condition-creation
conditionAnyOn

	^ HueCondition new
		address: '/', self apiPath, '/state/any_on';
		yourself