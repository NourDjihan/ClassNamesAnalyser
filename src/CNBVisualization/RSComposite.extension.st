Extension { #name : #RSComposite }

{ #category : #'*CNBVisualization' }
RSComposite >> color [
	^ paint
	ifNil: [ CNBPalette new monoClassColor ]
]
