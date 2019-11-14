"
A base subclass for a rest resource
"
Class {
	#name : #HueResource,
	#superclass : #Object,
	#instVars : [
		'id',
		'rawDict',
		'manager',
		'name'
	],
	#category : 'PhilipsHue'
}

{ #category : #properties }
HueResource class >> apiPath [

	"return the api path to the resource"
	
	self subclassResponsibility 
]

{ #category : #'instance creation' }
HueResource class >> id: aNumber dict: aDictionary [

	^ self new
		id: aNumber;
		rawDict: aDictionary;
		populateFromDict: aDictionary;
		yourself 
]

{ #category : #accessing }
HueResource class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name) ] 
]

{ #category : #'instance creation' }
HueResource class >> new: anIdDictPair [

	^ self 
		id: anIdDictPair key
		dict: anIdDictPair value
]

{ #category : #scripts }
HueResource class >> reinstallResourceAccessors [
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
]

{ #category : #comparing }
HueResource >> = anObject [

	^ (anObject isKindOf: self class) and: [ 
	self bridge = anObject bridge and: [ 
	id = anObject id ] ]
]

{ #category : #helpers }
HueResource >> apiPath [

	^ self class apiPath, '/', id asString
]

{ #category : #accessing }
HueResource >> bridge [

	^ manager bridge
]

{ #category : #actions }
HueResource >> delete [

	manager delete: id
]

{ #category : #printing }
HueResource >> gtDisplayString [

	^ name
]

{ #category : #accessing }
HueResource >> id [
	^ id
]

{ #category : #accessing }
HueResource >> id: anObject [
	id := anObject
]

{ #category : #accessing }
HueResource >> manager [
	^ manager
]

{ #category : #accessing }
HueResource >> manager: anObject [
	manager := anObject
]

{ #category : #accessing }
HueResource >> name [

	^ name
]

{ #category : #accessing }
HueResource >> name: anObject [
	name := anObject
]

{ #category : #initialization }
HueResource >> populateFromDict: aDictionarry [

	"you get a 'JSON' dict from the Hue API. Populate yourself with it"
	
	name := aDictionarry at: #name
]

{ #category : #accessing }
HueResource >> rawDict: anObject [
	rawDict := anObject
]

{ #category : #actions }
HueResource >> save [

	^ manager save: self
]
