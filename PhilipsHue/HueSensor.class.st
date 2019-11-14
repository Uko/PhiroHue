"
https://www.developers.meethue.com/documentation/sensors-api

Sensors… sense, what else can I say?
"
Class {
	#name : #HueSensor,
	#superclass : #HueResource,
	#category : 'PhilipsHue'
}

{ #category : #constants }
HueSensor class >> TAP_SWITCH_1 [

	^ '34'
]

{ #category : #constants }
HueSensor class >> TAP_SWITCH_2 [

	^ '16'
]

{ #category : #constants }
HueSensor class >> TAP_SWITCH_3 [

	^ '17'
]

{ #category : #constants }
HueSensor class >> TAP_SWITCH_4 [

	^ '18'
]

{ #category : #properties }
HueSensor class >> apiPath [

	^ 'sensors'
]

{ #category : #'condition-creation' }
HueSensor >> conditionButtonEvent [

	^ HueCondition new
		address: '/', self apiPath, '/state/buttonevent';
		yourself
]

{ #category : #'condition-creation' }
HueSensor >> conditionButtonEventEquals: aValue [

	^ self conditionButtonEvent
		equals: aValue;
		yourself
]

{ #category : #'condition-creation' }
HueSensor >> conditionLastUpdated [

	^ HueCondition new
		address: '/', self apiPath, '/state/lastupdated';
		yourself
]

{ #category : #initialization }
HueSensor >> populateFromDict: aDictionary [
 
	super populateFromDict: aDictionary.
]

{ #category : #accessing }
HueSensor >> relatedRules [

	^ self bridge rules get select: [ :rule |
		rule conditions anySatisfy: [ :cond | 
			cond reifiedResource = self ] ]
]
