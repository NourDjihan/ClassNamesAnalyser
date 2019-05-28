Class {
	#name : #DMRoassalClassNameBlueprint,
	#superclass : #Object,
	#category : #DMRoassalBlueprint
}

{ #category : #visualization }
DMRoassalClassNameBlueprint >> visualizeConceptualBlueprint: aViewModel [
	
	| b |
	b := RTMondrian new.
	b shape rectangle withTextAbove: [ :packageVM | packageVM packageName ].
	b interaction popup 
		text: [ :aPackageVM | aPackageVM packageName ].
	b
		nodes: (aViewModel packageViewModels collect: [ :packageVM | packageVM ])
		forEach: [ :pVM | 
			b shape rectangle 
			color: [ :eachConcept | Color value: eachConcept color ];
			withTextAbove: [ :cpt | cpt conceptName ] color: Color darkGray.
			b interaction popup 
					text: [ :conceptVM | 'Concept: ' , conceptVM conceptName ] .
			b nodes: (pVM conceptViewModels collect: [ :conceptVM | conceptVM ])
			forEach: [ :conceptVM | 
				conceptVM classViewModels addFirst:(DMClassViewModel 	new classRef: conceptVM 	root; color: conceptVM color).
				b shape rectangle
				borderColor: [ :aClassVM | 
					(aClassVM classRef = conceptVM root)
					ifTrue: [ Color black ] ifFalse: (Color value: aClassVM color) slightlyLighter ];
				color: [ :classVM | Color value: classVM color ].
				b interaction popup 
					text: [ :each | each classRef ].
				b 
					nodes: (conceptVM classViewModels collect: [ :classVm | classVm  ]).
					b layout grid.
			 ].
		b layout grid.
		 ]. 
b layout flow.
b build.
^ b view.

]