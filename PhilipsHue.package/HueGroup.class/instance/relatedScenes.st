accessing
relatedScenes

	^ self bridge scenes get select: [ :s |
		s lights = lights ]