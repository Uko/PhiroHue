actions api
get

	^ (bridge client get: bridge apiPath, resoureceClass apiPath)
		associations collect: [ :as |
			(resoureceClass new: as)
				manager: self;
				yourself ]