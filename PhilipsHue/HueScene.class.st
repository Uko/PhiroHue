"
https://www.developers.meethue.com/documentation/scenes-api

A scene defines special setup for a few lights
"
Class {
	#name : #HueScene,
	#superclass : #HueResource,
	#instVars : [
		'lights'
	],
	#category : 'PhilipsHue'
}

{ #category : #properties }
HueScene class >> apiPath [

	^ 'scenes'
]

{ #category : #accessing }
HueScene >> lights [
	^ lights
]

{ #category : #initialization }
HueScene >> populateFromDict: aDictionary [

	super populateFromDict: aDictionary.
	lights := aDictionary at: #lights
]
