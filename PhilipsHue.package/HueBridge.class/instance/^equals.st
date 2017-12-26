comparing
= anObject

	^ (anObject isKindOf: self class) and: [ 
		ip = anObject ip ]