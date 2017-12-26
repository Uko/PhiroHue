actions api
save: aResource

	"we do not update yet"
	self assert: aResource id isNil.

	^ self post: aResource 