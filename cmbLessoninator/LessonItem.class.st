Class {
	#name : #LessonItem,
	#superclass : #Object,
	#instVars : [
		'fileReference'
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
LessonItem >> fileRef: aFileReference [ 
	fileReference := aFileReference 
]

{ #category : #accessing }
LessonItem >> parent [
	^ fileReference parent
]
