Class {
	#name : #LessonSource,
	#superclass : #Object,
	#instVars : [
		'name',
		'path'
	],
	#category : #cmbLessoninator
}

{ #category : #'instance creation' }
LessonSource class >> named: aString path: aDirectory [
	^self new
		name: aString ;
		path: aDirectory ;
		yourself 
]
