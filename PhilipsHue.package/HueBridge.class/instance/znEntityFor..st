helpers
znEntityFor: anObject

	| contentString |
	
	contentString := anObject isString
		ifTrue: [ anObject ]
		ifFalse: [ String streamContents: [ :stream |
			(NeoJSONWriter on: stream)
				nextPut: anObject ] ].

	^ ZnEntity 
   		with: contentString
		type: ZnMimeType applicationJson