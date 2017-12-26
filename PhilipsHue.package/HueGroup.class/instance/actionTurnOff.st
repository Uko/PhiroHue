action-creation
actionTurnOff

	^ HueAction new
		address: '/', self apiPath, '/action';
		method: #PUT;
		body: (Dictionary with: #on -> false)