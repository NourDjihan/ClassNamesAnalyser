Class {
	#name : #DMColor,
	#superclass : #Object,
	#instVars : [
		'hierarchiesColors'
	],
	#category : #DMClassNameBlueprint
}

{ #category : #building }
DMColor >> attributeColors: aViewModel [

	| allConceptsViewModels allClassViewModels featureSelector hierarchies concepts conceptsHierarchies conceptsColors |	
	
	featureSelector := DMFeatureSelector new.		
	hierarchies := aViewModel hierarchies.
	hierarchiesColors := (self setColorsOf: hierarchies From: aViewModel).
	
	concepts := self extractAllConceptsFrom: aViewModel.
	conceptsHierarchies:= (concepts collect: [ :aConcept | ((aConcept)->(OrderedCollection new)) ]) 		asDictionary.
	allConceptsViewModels := aViewModel packageViewModels flatCollect: [ :aPackageModel | 		aPackageModel	conceptViewModels ].	
	allConceptsViewModels do: [ :aConceptViewModel | 
		| roots |
		roots := aConceptViewModel classViewModels collect: [ :aClassModel | featureSelector extractRootClassFrom: (aClassModel classRef) ].
		(conceptsHierarchies at: aConceptViewModel conceptName) addAll: roots ].
	
	conceptsColors := (concepts collect: [ :aConcept |
		| color conceptsBiggestHierarchy  |
		conceptsBiggestHierarchy := self selectBiggestHierarchy: (conceptsHierarchies at: aConcept).	
		color := (self selectColorOf:conceptsBiggestHierarchy).
		(((conceptsHierarchies at: aConcept) asSet size > 1) and: [color == #gray])
		ifTrue: [ 
			(self checkIfAllMonoSuffix: (conceptsHierarchies at: aConcept) )
				ifTrue: [ (aConcept -> #monoHierarchies) ]
				ifFalse: [(aConcept -> #lightGray) ] ]
		ifFalse: [(aConcept->color)]
		 ]) asDictionary.	
						
	allConceptsViewModels do: [ :aConceptViewModel | 
		aConceptViewModel color: (self selectConceptsColor: 	aConceptViewModel conceptName From: conceptsColors).
			aConceptViewModel root: (self selectBiggestHierarchy: (conceptsHierarchies at: aConceptViewModel conceptName)	).
			].			
	allClassViewModels := allConceptsViewModels 
		flatCollect: [ :aConceptVModel | aConceptVModel classViewModels ].	
	allClassViewModels do: [ :aClassViewModel |
aClassViewModel color:(self selectColorOf: (aClassViewModel classRef)) ].
	^aViewModel 
]

{ #category : #'as yet unclassified' }
DMColor >> checkIfAllMonoSuffix: aCollection [

	aCollection do: [ :eachClass | 
		(self checkIfMonoSuffix: eachClass)
			ifFalse: [ ^false ]
	  ].
^true.
]

{ #category : #'as yet unclassified' }
DMColor >> checkIfMonoSuffix: aRoot [

	| subclasses conceptualSymbolSelector symbol  |

	conceptualSymbolSelector := DMConceptualSymbolSelector new.
	symbol := (conceptualSymbolSelector selectLastSymbol: aRoot asString).
	subclasses := aRoot allSubclasses.
	subclasses do: [ :aSubClass | ((conceptualSymbolSelector selectLastSymbol: aSubClass) = symbol)
		ifFalse: [ ^false ]
		 ].
	^true
	
]

{ #category : #'as yet unclassified' }
DMColor >> extractAllClasses: aViewModel [

	| conceptVMs classVMs classes |
	conceptVMs := aViewModel packageViewModels flatCollect: [ :aPackageVMs | aPackageVMs conceptViewModels 	].
	classVMs := conceptVMs flatCollect: [ :aConceptVM | aConceptVM classViewModels ].
	classes := classVMs collect: [ :aClassMD | aClassMD classRef ].
	^classes 
]

{ #category : #actions }
DMColor >> extractAllConceptsFrom: aViewModel [

	| packageViewModels conceptsViewModels  resultedConcepts |
	packageViewModels := aViewModel packageViewModels.
	conceptsViewModels := packageViewModels flatCollect: [ :aPackageViewModel | aPackageViewModel 	conceptViewModels ].
	resultedConcepts := conceptsViewModels collect: [ :aConceptViewModel | aConceptViewModel  	conceptName  ].
	^ resultedConcepts asSet
]

{ #category : #actions }
DMColor >> extractAllRootClassesFrom: aViewModel [

	| packageViewModels resultedHierarchies conceptViewModels featureSelector classViewModels |
	featureSelector := DMFeatureSelector new.
	resultedHierarchies := OrderedCollection new.
	packageViewModels := aViewModel packageViewModels.
	conceptViewModels := packageViewModels flatCollect: [ :aPackageViewModel | aPackageViewModel 	conceptViewModels  ].
	classViewModels := conceptViewModels flatCollect: [ :aConceptViewModel | aConceptViewModel 	classViewModels ].
	resultedHierarchies := classViewModels collect: [ :aClassViewModel | (featureSelector 	extractRootClassFrom: aClassViewModel classRef ) ].
	^ resultedHierarchies asOrderedCollection.
	
	
]

{ #category : #accessing }
DMColor >> hierarchiesColors [
	^hierarchiesColors
]

{ #category : #building }
DMColor >> selectBiggestHierarchy: aCollection [
	^ aCollection asBag sortedCounts first value
]

{ #category : #actions }
DMColor >> selectColorOf: aClass [

	| featureSelector  theRootClass color |
	featureSelector := DMFeatureSelector new.
	theRootClass := featureSelector extractRootClassFrom: aClass.
	color := hierarchiesColors at: theRootClass.
	^ color
]

{ #category : #building }
DMColor >> selectConceptsColor: aConcept From: conceptsColors [
	^ (conceptsColors at: aConcept) 
]

{ #category : #actions }
DMColor >> setColorsOf: aCollectionOfHierarchies From: aViewModel [

	| arrayOfColors index multiSuffixesColors monoClasses monoSuffixes resultedColors |
	arrayOfColors := {#red . #yellow . #blue . #purple . #magenta . #orange . #green . #pink . #tan  . #cyan . #lightBlue . #lightBrown . #lightCyan  . #lightGreen.
	#lightMagenta . #lightOrange . #lightRed .
	#paleGreen . #paleMagenta . #paleOrange . #palePeach . #paleRed . #paleTan . #black}.
	index := 0.
	resultedColors := Dictionary new.
	monoClasses := aCollectionOfHierarchies select: [ :anHierarchy | anHierarchy subclasses isEmpty ].
	aCollectionOfHierarchies removeAll: monoClasses.
	monoSuffixes := aCollectionOfHierarchies select: [ :anHierarchy | (self checkIfMonoSuffix: anHierarchy )].
	aCollectionOfHierarchies removeAll: monoSuffixes.
	multiSuffixesColors := ((aCollectionOfHierarchies asBag sortedCounts) collect: [ :anAssociation | 
		(index == arrayOfColors size)
		ifFalse: [ index := index + 1 ].
		(anAssociation value -> (arrayOfColors at: index))	
		 ]) asDictionary.
	resultedColors addAll: multiSuffixesColors; addAll: (monoClasses asSet collect: [ :aMonoClass | (aMonoClass -> #white)]) asDictionary; addAll: (monoSuffixes asSet collect: [ :aMonoSuffix | (aMonoSuffix -> #gray) ]) asDictionary .
	 ^ resultedColors asDictionary
]