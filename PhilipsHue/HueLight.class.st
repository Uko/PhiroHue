"
https://www.developers.meethue.com/documentation/lights-api

A resource representing a single hue light
"
Class {
	#name : #HueLight,
	#superclass : #HueResource,
	#category : 'PhilipsHue'
}

{ #category : #properties }
HueLight class >> apiPath [

	^ 'lights'
]

{ #category : #initialization }
HueLight >> populateFromDict: aDictionary [
 
	super populateFromDict: aDictionary.
]
