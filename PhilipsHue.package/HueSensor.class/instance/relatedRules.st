accessing
relatedRules

	^ self bridge rules get select: [ :rule |
		rule conditions anySatisfy: [ :cond | 
			cond reifiedResource = self ] ]