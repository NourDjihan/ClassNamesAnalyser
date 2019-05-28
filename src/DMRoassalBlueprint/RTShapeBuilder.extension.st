Extension { #name : #RTShapeBuilder }

{ #category : #'*DMRoassalBlueprint' }
RTShapeBuilder >> withTextAbove: aSymbolOrABlock color: aColor [
	| newShape |
	newShape := RTCompositeShape new.
	newShape add: (RTLabel new text: aSymbolOrABlock; color: aColor).
	newShape add: shape.
	newShape vertical.
	newShape setAutomaticRelayout.
	shape := newShape.
]