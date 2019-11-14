"
Common subclass for rule's actions and conditions
"
Class {
	#name : #HueRuleSubresource,
	#superclass : #Object,
	#instVars : [
		'address',
		'rule',
		'reifiedResource'
	],
	#category : 'PhilipsHue'
}

{ #category : #accessing }
HueRuleSubresource class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(address) ] 
]

{ #category : #accessing }
HueRuleSubresource >> address [
	^ address
]

{ #category : #accessing }
HueRuleSubresource >> address: anObject [
	address := anObject
]

{ #category : #initialization }
HueRuleSubresource >> populateFromDict: aDictionary [

	address := aDictionary at: #address
]

{ #category : #accessing }
HueRuleSubresource >> reifiedResource [
	^ reifiedResource ifNil: [
		reifiedResource := rule manager bridge get: address ]
]

{ #category : #accessing }
HueRuleSubresource >> rule [
	^ rule
]

{ #category : #accessing }
HueRuleSubresource >> rule: anObject [
	rule := anObject
]
