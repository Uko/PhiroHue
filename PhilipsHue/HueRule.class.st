"
https://www.developers.meethue.com/documentation/rules-api

A resource that represents a rule that performs some actions based on met onditions
"
Class {
	#name : #HueRule,
	#superclass : #HueResource,
	#instVars : [
		'conditions',
		'actions'
	],
	#category : 'PhilipsHue'
}

{ #category : #properties }
HueRule class >> apiPath [

	^ 'rules'
]

{ #category : #accessing }
HueRule class >> neoJsonMapping: mapper [

	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(actions conditions) ] 
]

{ #category : #accessing }
HueRule >> actions [
	^ actions
]

{ #category : #adding }
HueRule >> addAction: anAction [

	anAction rule: self.
	actions add: anAction.
]

{ #category : #adding }
HueRule >> addCondition: aCondition [

	aCondition rule: self.
	conditions add: aCondition.
]

{ #category : #accessing }
HueRule >> conditions [
	^ conditions
]

{ #category : #'as yet unclassified' }
HueRule >> gtInspectorIn: composite [
	<gtInspectorPresentationOrder: 30> 

composite tabulator 
		title: 'Conditions/Actions';
		with: [ :t |  
			t row: #conditions; row: #actions. 
			t transmit
				to: #conditions;
				andShow: [ :a | 
					conditions gtInspectorItemsIn: a ].
			t transmit
				to: #actions;
				andShow: [ :a | 
					actions gtInspectorItemsIn: a ] ]
]

{ #category : #initialization }
HueRule >> initialize [
	conditions := OrderedCollection new.
	actions  := OrderedCollection new.
]

{ #category : #accessing }
HueRule >> neoJsonMapping: mapper [

	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(actions conditions) ] 
]

{ #category : #'as yet unclassified' }
HueRule >> populateFromDict: aDictionary [
 
	super populateFromDict: aDictionary.
	(aDictionary at: #conditions) do: [ :cond |
		self addCondition: ( 
			HueCondition new
				populateFromDict: cond;
				yourself) ].
	(aDictionary at: #actions) do: [ :act |
		self addAction: ( 
			HueAction new
				populateFromDict: act;
				yourself) ].
]

{ #category : #'as yet unclassified' }
HueRule >> selectedIvars [
	^ super selectedIvars, { #conditions . #actions }
]

{ #category : #'ston persistence' }
HueRule >> stonOn: stonWriter [

	self dictFromSelectedIvars stonOn: stonWriter
]
