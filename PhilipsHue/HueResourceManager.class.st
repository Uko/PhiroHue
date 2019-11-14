"
Mostly used to simplify implementation. Incorporates main actions (get, post) for a provided resource class
"
Class {
	#name : #HueResourceManager,
	#superclass : #Object,
	#instVars : [
		'resoureceClass',
		'bridge'
	],
	#category : 'PhilipsHue'
}

{ #category : #'instance creation' }
HueResourceManager class >> bridge: aHueBridge resourceClass: aHueResourceClass [ 
	^ self basicNew
		initializeBridge: aHueBridge
		resourceClass: aHueResourceClass
]

{ #category : #accessing }
HueResourceManager >> bridge [
	^ bridge
]

{ #category : #'actions api' }
HueResourceManager >> delete: aNumber [

	^ bridge client delete:
		bridge apiPath,
		resoureceClass apiPath,
		'/', aNumber asString
]

{ #category : #requirements }
HueResourceManager >> empty [

	"create a new, empty resource associated with this manager"
	^ resoureceClass new
		manager: self;
		yourself.
]

{ #category : #'actions api' }
HueResourceManager >> get [

	^ (bridge client get: bridge apiPath, resoureceClass apiPath)
		associations collect: [ :as |
			(resoureceClass new: as)
				manager: self;
				yourself ]
]

{ #category : #'actions api' }
HueResourceManager >> get: anId [

	^ (resoureceClass
		id: anId
		dict: (
			bridge client get:
				bridge apiPath,
				resoureceClass apiPath,
				'/', anId) )
		manager: self;
		yourself
]

{ #category : #initialization }
HueResourceManager >> initializeBridge: aHueBridge resourceClass: aHueResourceClass [ 
	self initialize.
	bridge := aHueBridge.
	resoureceClass := aHueResourceClass
]

{ #category : #'actions api' }
HueResourceManager >> new: anObject [

	"becuase how do you memorize that post: created a new resource?"
	^ self post: anObject 
]

{ #category : #'actions api' }
HueResourceManager >> post: anObject [

	^ bridge client
		post: bridge apiPath, resoureceClass apiPath
		contents: anObject
		
]

{ #category : #'actions api' }
HueResourceManager >> save: aResource [

	"we do not update yet"
	self assert: aResource id isNil.

	^ self post: aResource 
]
