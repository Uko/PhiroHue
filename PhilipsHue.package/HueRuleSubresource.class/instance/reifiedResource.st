accessing
reifiedResource
	^ reifiedResource ifNil: [
		reifiedResource := rule manager bridge get: address ]