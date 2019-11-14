"
https://www.developers.meethue.com/documentation/groups-api

A resourse representing a group of lights
"
Class {
	#name : #HueGroup,
	#superclass : #HueResource,
	#instVars : [
		'lights'
	],
	#category : 'PhilipsHue'
}

{ #category : #properties }
HueGroup class >> apiPath [

	^ 'groups'
]

{ #category : #'action-creation' }
HueGroup >> actionSetScene: aScene [

	^ HueAction new
		address: '/', self apiPath, '/action';
		method: #PUT;
		body: (Dictionary with: #scene -> aScene id)
]

{ #category : #'action-creation' }
HueGroup >> actionTurnOff [

	^ HueAction new
		address: '/', self apiPath, '/action';
		method: #PUT;
		body: (Dictionary with: #on -> false)
]

{ #category : #'condition-creation' }
HueGroup >> conditionAnyOn [

	^ HueCondition new
		address: '/', self apiPath, '/state/any_on';
		yourself
]

{ #category : #accessing }
HueGroup >> lights [
	^ lights
]

{ #category : #initialization }
HueGroup >> populateFromDict: aDictionary [
 
	super populateFromDict: aDictionary.
	lights := aDictionary at: #lights
]

{ #category : #accessing }
HueGroup >> relatedScenes [

	^ self bridge scenes get select: [ :s |
		s lights = lights ]
]
