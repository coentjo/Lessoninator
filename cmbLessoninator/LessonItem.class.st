Class {
	#name : #LessonItem,
	#superclass : #Object,
	#instVars : [
		'fileReference',
		'parent'
	],
	#category : #cmbLessoninator
}

{ #category : #'instance creation' }
LessonItem class >> on: aFileRef [ 
	^ self new 
		fileRef: aFileRef ;
		yourself 
]

{ #category : #accessing }
LessonItem >> color [

	| extension dict |
	fileReference isDirectory ifTrue: [ ^ Color lightGray ].
	extension := fileReference extension.
	dict := { 
		        ('md' -> Color orange lighter ).
		        'pdf' -> Color orange darker  } asDictionary.
	^ dict at: extension ifAbsent: [ Color green ]
]

{ #category : #accessing }
LessonItem >> fileRef: aFileReference [ 
	fileReference := aFileReference 
]

{ #category : #accessing }
LessonItem >> fileReference [
	^ fileReference
]

{ #category : #accessing }
LessonItem >> findParentLessonItemIn: aCollectionOfLessonItems [ 
	"My parent should be the LessonItem for the parent-fileReference of my fileReference "
	| parentFileRef |
	parentFileRef := fileReference parent . 
	aCollectionOfLessonItems do: [ :potentialParentLessonItem |
		potentialParentLessonItem fileReference == parentFileRef ifTrue: [ parent := potentialParentLessonItem   ] ]
]

{ #category : #accessing }
LessonItem >> parent [
	^ fileReference parent
]
