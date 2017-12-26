action-creation
actionSetScene: aScene

	^ HueAction new
		address: '/', self apiPath, '/action';
		method: #PUT;
		body: (Dictionary with: #scene -> aScene id)