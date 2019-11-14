"
The main entry point to connects to a bridge and controll Philips lights 
"
Class {
	#name : #HueBridge,
	#superclass : #Object,
	#instVars : [
		'client',
		'ip',
		'authtoken',
		'managers'
	],
	#classInstVars : [
		'defaultIP'
	],
	#category : 'PhilipsHue'
}

{ #category : #'instance creation' }
HueBridge class >> findAndStoreDefaultIP [
	"find a HueBridge in a local network and store it's IP"

	| possibleBridges client |
	possibleBridges := STON fromString:
		(ZnEasy get: 'https://www.meethue.com/api/nupnp') contents.
		
	client := ZnClient new
		path: '/api/config';
		method: #GET;
		timeout: 2;
		yourself.
		
	possibleBridges
		do: [ :bridge |
			| ip |
			ip := bridge at: #internalipaddress.
			[
				client host: ip.
				client execute.
				client isSuccess ifTrue: [
					^ defaultIP := ip ]
			 ] on: ConnectionTimedOut  do: [  ] ].
]

{ #category : #'instance creation' }
HueBridge class >> withAuthToken: aString [

	^ self new
		ip: defaultIP;
		authtoken: aString;
		yourself
]

{ #category : #comparing }
HueBridge >> = anObject [

	^ (anObject isKindOf: self class) and: [ 
		ip = anObject ip ]
]

{ #category : #helpers }
HueBridge >> apiPath [

	^ '/api/', authtoken, '/' 
]

{ #category : #accessing }
HueBridge >> authtoken [
	^ authtoken
]

{ #category : #accessing }
HueBridge >> authtoken: anObject [
	authtoken := anObject
]

{ #category : #helpers }
HueBridge >> client [

	^ ZnClient new
    	host: ip;
    	enforceHttpSuccess: true;
    	accept: ZnMimeType applicationJson;
    	contentWriter: [ :object | 
			self znEntityFor: object ];
    	contentReader: [ :entity |
        NeoJSONReader fromString: entity contents ];
    	yourself.
]

{ #category : #operations }
HueBridge >> get: aString [
	| parts |
	parts := (aString substrings: '/') reject: #isEmpty.
	
	^ managers keys
		detect: [ :path | path = parts first ]
		ifFound: [ :path | 
			(managers at: path) get: parts second ]
		ifNone: [ self client get: aString ]
]

{ #category : #'accessing-resources' }
HueBridge >> groups [
	"auto generated from HueResource class>>#reinstallResourceAccessors"
	^ managers at: #groups
]

{ #category : #initialization }
HueBridge >> initialize [
	super initialize.
	self initializeManagers
]

{ #category : #initialization }
HueBridge >> initializeManagers [
	"auto generated from HueResource class>>#reinstallResourceAccessors"
	managers := IdentityDictionary new.
	managers
		at: #sensors put: (HueResourceManager
			bridge: self resourceClass: HueSensor);
		at: #groups put: (HueResourceManager
			bridge: self resourceClass: HueGroup);
		at: #scenes put: (HueResourceManager
			bridge: self resourceClass: HueScene);
		at: #rules put: (HueResourceManager
			bridge: self resourceClass: HueRule);
		at: #lights put: (HueResourceManager
			bridge: self resourceClass: HueLight)
]

{ #category : #accessing }
HueBridge >> ip [
	^ ip
]

{ #category : #accessing }
HueBridge >> ip: anObject [
	ip := anObject
]

{ #category : #'accessing-resources' }
HueBridge >> lights [
	"auto generated from HueResource class>>#reinstallResourceAccessors"
	^ managers at: #lights
]

{ #category : #'accessing-resources' }
HueBridge >> rules [
	"auto generated from HueResource class>>#reinstallResourceAccessors"
	^ managers at: #rules
]

{ #category : #'accessing-resources' }
HueBridge >> scenes [
	"auto generated from HueResource class>>#reinstallResourceAccessors"
	^ managers at: #scenes
]

{ #category : #'accessing-resources' }
HueBridge >> sensors [
	"auto generated from HueResource class>>#reinstallResourceAccessors"
	^ managers at: #sensors
]

{ #category : #helpers }
HueBridge >> znEntityFor: anObject [

	| contentString |
	
	contentString := anObject isString
		ifTrue: [ anObject ]
		ifFalse: [ String streamContents: [ :stream |
			(NeoJSONWriter on: stream)
				nextPut: anObject ] ].

	^ ZnEntity 
   		with: contentString
		type: ZnMimeType applicationJson
]
