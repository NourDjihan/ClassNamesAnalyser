"
I represent the data as numbers extracted from the ClassNames Distribution, Num-Packag, Num-Classes, Num-Patterns ...etc
"
Class {
	#name : #CNBAnalysisDescription,
	#superclass : #Object,
	#instVars : [
		'project',
		'scatteredVocabulary',
		'confetti',
		'homogeneous',
		'intruder',
		'snowFlakes',
		'homogeneityBreaker',
		'fatBlob',
		'tokens',
		'classes',
		'packages',
		'maxDepth',
		'maxChildren',
		'maxChildrenRoot',
		'maxDepthRoot',
		'averageDepth',
		'averageChildren',
		'monoClasses',
		'traitClasses',
		'monoTokenClasses',
		'multiTokenClasses',
		'averageTokensPerMultiHierarchy',
		'monoTokenHierarchies',
		'suspisciousTokens',
		'hierarchies',
		'multiTokenHierarchies',
		'suspisciousTokensPercentage',
		'blackClasses',
		'blackHierarchies'
	],
	#category : #'CNB-Core'
}

{ #category : #'instance creation' }
CNBAnalysisDescription class >> of: aCnD [

	^ self new
		model: aCnD 
]

{ #category : #accessing }
CNBAnalysisDescription >> averageChildren [

	^ averageChildren
]

{ #category : #accessing }
CNBAnalysisDescription >> averageChildren: aNumber [
	averageChildren := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> averageDepth [
	^ averageDepth
]

{ #category : #accessing }
CNBAnalysisDescription >> averageDepth: aNumber [
	averageDepth := aNumber
]

{ #category : #accessing }
CNBAnalysisDescription >> averageTokensPerMultiHierarchy [
	^ averageTokensPerMultiHierarchy
]

{ #category : #accessing }
CNBAnalysisDescription >> averageTokensPerMultiHierarchy: aNum [

	averageTokensPerMultiHierarchy := aNum
]

{ #category : #accessing }
CNBAnalysisDescription >> blackClasses [ 
	^ blackClasses 
]

{ #category : #accessing }
CNBAnalysisDescription >> blackClasses: aNumber [ 
	blackClasses := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> blackHierarchies [
	^ blackHierarchies 
]

{ #category : #accessing }
CNBAnalysisDescription >> blackHierarchies: aNumber [
	blackHierarchies := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> classes [
	^ classes
]

{ #category : #accessing }
CNBAnalysisDescription >> classes: aNumber [
	classes := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> confetti [
	^ confetti
]

{ #category : #accessing }
CNBAnalysisDescription >> confetti: aNumber [
	
	confetti := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> fatBlob [
	^ fatBlob
]

{ #category : #accessing }
CNBAnalysisDescription >> fatBlob: aNumber [
	
	fatBlob := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> hierarchies [ 
	^ hierarchies
]

{ #category : #accessing }
CNBAnalysisDescription >> hierarchies: aNumber [
	hierarchies := aNumber
]

{ #category : #accessing }
CNBAnalysisDescription >> homogeneityBreaker [
	^ homogeneityBreaker
]

{ #category : #accessing }
CNBAnalysisDescription >> homogeneityBreaker: aNumber [
	
	homogeneityBreaker := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> homogeneous [
	^ homogeneous
]

{ #category : #accessing }
CNBAnalysisDescription >> homogeneous: aNumber [
	
	homogeneous := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> intruder [
	^ intruder
]

{ #category : #accessing }
CNBAnalysisDescription >> intruder: aNumber [
	
	intruder := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> maxChildren [
	^ maxChildren
]

{ #category : #accessing }
CNBAnalysisDescription >> maxChildren: aNumber [

	maxChildren := aNumber
]

{ #category : #accessing }
CNBAnalysisDescription >> maxChildrenRoot [
	^ maxChildrenRoot
]

{ #category : #accessing }
CNBAnalysisDescription >> maxChildrenRoot: aRoot [

	maxChildrenRoot := aRoot
]

{ #category : #accessing }
CNBAnalysisDescription >> maxDepth [
	^ maxDepth
]

{ #category : #accessing }
CNBAnalysisDescription >> maxDepth: aNumber [

	maxDepth := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> maxDepthRoot [
	^ maxDepthRoot
]

{ #category : #accessing }
CNBAnalysisDescription >> maxDepthRoot: aRoot [

	maxDepthRoot := aRoot 
]

{ #category : #accessing }
CNBAnalysisDescription >> monoClasses [
	^ monoClasses
]

{ #category : #accessing }
CNBAnalysisDescription >> monoClasses: aSize [

	monoClasses := aSize
]

{ #category : #accessing }
CNBAnalysisDescription >> monoTokenClasses [
	^ monoTokenClasses
]

{ #category : #accessing }
CNBAnalysisDescription >> monoTokenClasses: aSize [
	monoTokenClasses := aSize 
]

{ #category : #accessing }
CNBAnalysisDescription >> monoTokenHierarchies [
	^ monoTokenHierarchies
]

{ #category : #accessing }
CNBAnalysisDescription >> monoTokenHierarchies: aNumber [
	monoTokenHierarchies := aNumber
]

{ #category : #accessing }
CNBAnalysisDescription >> multiTokenClasses [
	^ multiTokenClasses
]

{ #category : #accessing }
CNBAnalysisDescription >> multiTokenClasses: aSize [
	multiTokenClasses := aSize
]

{ #category : #accessing }
CNBAnalysisDescription >> multiTokenHierarchies [
	^ multiTokenHierarchies
]

{ #category : #accessing }
CNBAnalysisDescription >> multiTokenHierarchies: aSize [
	multiTokenHierarchies := aSize
]

{ #category : #accessing }
CNBAnalysisDescription >> packages [
	^ packages
]

{ #category : #accessing }
CNBAnalysisDescription >> packages: aNumber [

	packages := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> project [
	^ project
]

{ #category : #accessing }
CNBAnalysisDescription >> project: aName [ 
	project := aName
]

{ #category : #accessing }
CNBAnalysisDescription >> scatteredVocabulary [

	^ scatteredVocabulary
]

{ #category : #accessing }
CNBAnalysisDescription >> scatteredVocabulary: aNumber [
	
	scatteredVocabulary := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> snowFlakes [
	^ snowFlakes
]

{ #category : #accessing }
CNBAnalysisDescription >> snowFlakes: aNumber [
	
	snowFlakes := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> suspisciousTokens [
	^ suspisciousTokens
]

{ #category : #accessing }
CNBAnalysisDescription >> suspisciousTokens: aNumder [
	suspisciousTokens := aNumder 
]

{ #category : #accessing }
CNBAnalysisDescription >> suspisciousTokensPercentage [
	^ ((suspisciousTokens * 100)/tokens) asInteger.
]

{ #category : #accessing }
CNBAnalysisDescription >> suspisciousTokensPercentage: aNumber [

	suspisciousTokensPercentage := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> tokens [
	^ tokens
]

{ #category : #accessing }
CNBAnalysisDescription >> tokens: aNumber [
	tokens := aNumber 
]

{ #category : #accessing }
CNBAnalysisDescription >> traitClasses [
	^ traitClasses
]

{ #category : #accessing }
CNBAnalysisDescription >> traitClasses: aSize [
	traitClasses := aSize
]
