scripts
reinstallResourceAccessors
	<script>
	
	self assert: (
		self allSubclasses allSatisfy: [ :class |
			class class canPerform: #apiPath ]).
		
	HueBridge
		compile: 'initializeManagers
	"auto generated from ', thisContext method name ,'"
	managers := IdentityDictionary new.
	managers', String cr, ((self allSubclasses collect: [ :class |
	'		at: #', class apiPath, ' put: (HueResourceManager
			bridge: self resourceClass: ', class name, ')' ])
			joinUsing: ';', String cr)
		classified:	'initialization'.
		
	self allSubclassesDo: [ :class |
		HueBridge removeSelector: class apiPath asSymbol.
		HueBridge
			compile: class apiPath, '
	"auto generated from ', thisContext method name ,'"
	^ managers at: #', class apiPath		
			classified: 'accessing-resources' ]