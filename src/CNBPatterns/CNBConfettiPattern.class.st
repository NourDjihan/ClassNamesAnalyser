"
'Anti-Pattern: Confetti; 
	multiple hierarchies use this suffix, my suffixes are not used much in other packages'.
"
Class {
	#name : #CNBConfettiPattern,
	#superclass : #CNBAbstractPattern,
	#instVars : [
		'confettiSize',
		'confettiPourcentage',
		'minColorful'
	],
	#category : #CNBPatterns
}

{ #category : #accessing }
CNBConfettiPattern class >> confettiPourcentage [
	^ self new
		confettiPourcentage
]

{ #category : #accessing }
CNBConfettiPattern class >> confettiSize [
	^ self new
		confettiSize
]

{ #category : #accessing }
CNBConfettiPattern class >> minColorful [

	^ self new
		minColorful
]

{ #category : #initialization }
CNBConfettiPattern >> check: aTokenModel [

	| insideColors |
	aTokenModel root isMonoToken ifTrue: [ ^ false ].
	insideColors := (aTokenModel innerRoots collect: #color) asSet.
	(
		insideColors asSet size >= self confettiSize
	)
	ifFalse: [ ^ false ].
	
	^ ((self outsidersPourcentageIn: aTokenModel) >= self confettiPourcentage) and: [ 
		(CNBBuilder new palette multiTokenColors intersection: insideColors) size >= minColorful ]
	
	
	
	
]

{ #category : #accessing }
CNBConfettiPattern >> confettiPourcentage [

	^ confettiPourcentage
]

{ #category : #accessing }
CNBConfettiPattern >> confettiSize [ 

	^ confettiSize 
]

{ #category : #accessing }
CNBConfettiPattern >> description [

	^ description
]

{ #category : #initialization }
CNBConfettiPattern >> initialize [ 
	super initialize.
	
	description 
	:= 
	'Anti-Pattern: Confetti; 
	multiple hierarchies use this suffix, my suffixes are not used much in other packages'.
	
	name := #'Confetti'.
	confettiSize := 3.
	confettiPourcentage := 30. 
	minColorful := 2
]

{ #category : #accessing }
CNBConfettiPattern >> minColorful [
	^ minColorful
]

{ #category : #accessing }
CNBConfettiPattern >> name [

	^ name
]

{ #category : #accessing }
CNBConfettiPattern >> outsidersPourcentageIn: aTokenModel [

 ^ ((aTokenModel outsiders size * 100) / aTokenModel size) asFloat.
]
