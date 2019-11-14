"
Condition that has to be satisfied for a rule to act
"
Class {
	#name : #HueCondition,
	#superclass : #HueRuleSubresource,
	#instVars : [
		'operator',
		'value'
	],
	#category : 'PhilipsHue'
}

{ #category : #'instance creation' }
HueCondition class >> localTime [

	^ self new 
		address: '/config/localtime';
		yourself
]

{ #category : #accessing }
HueCondition class >> neoJsonMapping: mapper [

	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars ] 
]

{ #category : #'operator-setters' }
HueCondition >> changed [

	operator := 'dx'
]

{ #category : #'operator-setters' }
HueCondition >> changedDelayed [

	operator := 'ddx'
]

{ #category : #'operator-setters' }
HueCondition >> equals [

	operator := 'eq'
]

{ #category : #'operator-setters' }
HueCondition >> equals: aValue [

	self equals.
	self value: aValue
]

{ #category : #'operator-setters' }
HueCondition >> greaterThan [

	operator := 'gt'
]

{ #category : #'operator-setters' }
HueCondition >> in [

	operator := 'in'
]

{ #category : #'operator-setters' }
HueCondition >> in: aValue [

	self in.
	self value: aValue
]

{ #category : #'operator-setters' }
HueCondition >> lessThan [

	operator := 'lt'
]

{ #category : #'operator-setters' }
HueCondition >> nonStable [

	operator := 'non stable'
]

{ #category : #'operator-setters' }
HueCondition >> notIn [

	operator := 'not in'
]

{ #category : #'operator-setters' }
HueCondition >> notIn: aValue [

	self notIn.
	self value: aValue
]

{ #category : #accessing }
HueCondition >> operator [
	^ operator
]

{ #category : #accessing }
HueCondition >> operator: anObject [
	operator := anObject
]

{ #category : #initialization }
HueCondition >> populateFromDict: aDictionary [
	super populateFromDict: aDictionary.
	
	operator := aDictionary at: #operator.
	aDictionary at: #value ifPresent: [ :obj |
		value := obj ].
]

{ #category : #'operator-setters' }
HueCondition >> stable [

	operator := 'stable'
]

{ #category : #accessing }
HueCondition >> value [
	^ value
]

{ #category : #accessing }
HueCondition >> value: anObject [
	value := anObject asString "value can be only a string anyway"
]
