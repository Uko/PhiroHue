comparing
= anObject

	^ (anObject isKindOf: self class) and: [ 
	self bridge = anObject bridge and: [ 
	id = anObject id ] ]