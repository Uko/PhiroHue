actions api
delete: aNumber

	^ bridge client delete:
		bridge apiPath,
		resoureceClass apiPath,
		'/', aNumber asString