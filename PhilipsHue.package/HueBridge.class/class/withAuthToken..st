instance creation
withAuthToken: aString

	^ self new
		ip: defaultIP;
		authtoken: aString;
		yourself