Extension { #name : #MooseModel }

{ #category : #'*CNBModels' }
MooseModel >> ClassNamesBlueprint [ 

	<navigation: 'ClassNamesBlueprint'>
	<script: 'self ClassNamesBlueprint open'>
	<tlFilter: #visuTemplate>
	^ self defaultClassNamesBlueprint show
]

{ #category : #'*CNBModels' }
MooseModel >> ClassNamesBlueprintViewModel [

	<navigation: 'ClassNamesBlueprint ViewModel'>
	<script: 'self ClassNamesBlueprintViewModel open'>
	<tlFilter: #visuTemplate>
	^ self defaultClassNamesBlueprint viewModel 
]

{ #category : #'*CNBModels' }
MooseModel >> classNamesBlueprintAccordingTo: aClass [

	^ DMClassNamesBlueprint new 
	model: self;
	motherRoot: aClass;
	orderBySize;
	orderByColor;
	startBuilding.
	
	


	
	
]

{ #category : #'*CNBModels' }
MooseModel >> defaultClassNamesBlueprint [

	^ DMClassNamesBlueprint new 
	model: self;
	motherRoot: Object;
	orderBySize;
	orderByColor;
	startBuilding.
	
	


	
	
]

{ #category : #'*CNBModels' }
MooseModel >> defaultCnbViewModelAccordingTo: aMotherClass [
	^self defaultClassNamesBlueprint viewModel
]

{ #category : #'*CNBModels' }
MooseModel >> packages [ 
	^	((self allModelPackages) ifNil: (self allModelNamespaces))
	ifEmpty: self allModelNamespaces
]