Class {
	#name : #DMSizeAttributorTest,
	#superclass : #TestCase,
	#instVars : [
		'sizeAttributor'
	],
	#category : #'DMBlueprint-Tests'
}

{ #category : #running }
DMSizeAttributorTest >> setUp [ 
	sizeAttributor := DMSizeAttributor new.
]

{ #category : #tests }
DMSizeAttributorTest >> testSetSizeForAViewModel [

	| aConceptualModal aViewModel featureSeletor builder colorAttributor |
	builder := DMBlueprintBuilder new.
	featureSeletor := DMFeatureSelector new.
	colorAttributor := DMColorAttributor new.
	aConceptualModal := featureSeletor applyFeaturesOn: { 'Kernel' . 'DMFeatureSelector' }.
	aViewModel := builder buildModelFrom: aConceptualModal.
	aViewModel := colorAttributor attributeColors: aViewModel.
	sizeAttributor attributeSize: aViewModel.
	self assert: aViewModel packageViewModels size equals: aConceptualModal packageModels size.
	self assert: (aViewModel packageViewModels 
		collect: [ :aPackageViewModel | aPackageViewModel size ]) 
		equals: (aConceptualModal packageModels collect: [ :aPackageModel | 
		(aPackageModel classModels collect: [ :aClassModel | aClassModel conceptName ]) asSet size ]).
]