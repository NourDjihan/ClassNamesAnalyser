Class {
	#name : #DMPackageViewModel,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'conceptViewModels',
		'color'
	],
	#category : #DMViewModel
}

{ #category : #accessing }
DMPackageViewModel >> color [
	^ color
]

{ #category : #accessing }
DMPackageViewModel >> color: aColor [
	color := aColor 
]

{ #category : #accessing }
DMPackageViewModel >> conceptViewModels [
	^ conceptViewModels
]

{ #category : #accessing }
DMPackageViewModel >> conceptViewModels: aCollectionOfConceptViewModels [
	conceptViewModels := aCollectionOfConceptViewModels 
]

{ #category : #accessing }
DMPackageViewModel >> packageName [ 
	^ packageName
]

{ #category : #accessing }
DMPackageViewModel >> packageName: aPackageName [
	packageName := aPackageName 
]