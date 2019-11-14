"
Action that a rule performes if conditions are met
"
Class {
	#name : #HueAction,
	#superclass : #HueRuleSubresource,
	#instVars : [
		'method',
		'body'
	],
	#category : 'PhilipsHue'
}

{ #category : #accessing }
HueAction class >> neoJsonMapping: mapper [

	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars ] 
]

{ #category : #accessing }
HueAction >> body [
	^ body
]

{ #category : #accessing }
HueAction >> body: anObject [
	body := anObject
]

{ #category : #accessing }
HueAction >> method [
	^ method
]

{ #category : #accessing }
HueAction >> method: anObject [
	method := anObject
]

{ #category : #initialization }
HueAction >> populateFromDict: aDictionary [
	super populateFromDict: aDictionary.
	
	method := aDictionary at: #method.
	body := aDictionary at: #body
]
