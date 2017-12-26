actions api
get: anId

	^ (resoureceClass
		id: anId
		dict: (
			bridge client get:
				bridge apiPath,
				resoureceClass apiPath,
				'/', anId) )
		manager: self;
		yourself