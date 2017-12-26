operations
get: aString
	| parts |
	parts := (aString substrings: '/') reject: #isEmpty.
	
	^ managers keys
		detect: [ :path | path = parts first ]
		ifFound: [ :path | 
			(managers at: path) get: parts second ]
		ifNone: [ self client get: aString ]