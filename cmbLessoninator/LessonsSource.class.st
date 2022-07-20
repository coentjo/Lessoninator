"
I represent 1 directory where lesson material can be found. 

I have a name and a path (that's where you can find the lessons)
Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	extensions:		<Object>
	name:		<Object>
	path:		<Object>


    Implementation Points
"
Class {
	#name : #LessonsSource,
	#superclass : #Object,
	#instVars : [
		'name',
		'path',
		'extensions',
		'lessonItems'
	],
	#category : #cmbLessoninator
}

{ #category : #'instance creation' }
LessonsSource class >> named: aString path: aDirectory [
	^self new
		name: aString ;
		path: aDirectory ;
		yourself 
]

{ #category : #lessons }
LessonsSource >> colorFor: aFileReference [ 
	^aFileReference isDirectory 
		ifTrue: [ Color lightGray ]
		ifFalse: 
			[ self extensions 
				at: aFileReference path extension 
				ifAbsent: [ Color gray  ]]
]

{ #category : #accessing }
LessonsSource >> docsPath [
	^ path 
]

{ #category : #accessing }
LessonsSource >> extensions [
	^ extensions ifNil: [ Dictionary new ]
]

{ #category : #accessing }
LessonsSource >> extensions: aCollection [ 
	extensions := aCollection
]

{ #category : #lessons }
LessonsSource >> inspectorVisualizeLessons [ 

	<inspectorPresentationOrder: 90 title: 'lessons'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeLessons ;
		yourself 
]

{ #category : #lessons }
LessonsSource >> inspectorVisualizeLessonsSource [ 

	<inspectorPresentationOrder: 80 title: 'lessone source'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeLessonsSource  ;
		yourself 
]

{ #category : #'instance creation' }
LessonsSource >> name: aString [ 
	name := aString
]

{ #category : #accessing }
LessonsSource >> path: aFileLocator [ 
	path := aFileLocator
]

{ #category : #lessons }
LessonsSource >> visualizeLessons [ 

|  canvas nodes |

canvas := RSCanvas new.

"docsPath allChildren do: [ :aFile | 
	| node |
	node := RSEllipse model: aFile .
	canvas add: node ]. "

nodes := RSEllipse 
	models: self docsPath allChildren  
	forEach: [ :ellipse :model |
		ellipse size: 10;
		color: (self colorFor: model) ].
canvas addAll: nodes.

RSLineBuilder line
	shapes: canvas nodes;
	connectFrom: #parent .

"(canvas nodes, canvas lines) @ RSLabeled new
	in: [ : label |
		label location middle.
		label shapeBuilder labelShape color: Color black  ];
	yourself  . 
"

RSLineBuilder line 
	shapes: canvas nodes .

	
RSForceBasedLayout new
	charge: -500;
	on: canvas nodes.

canvas
	@ RSCanvasController ; 
	open. 
	
^ canvas
	

]

{ #category : #'instance creation' }
LessonsSource >> visualizeLessonsSource [

| canvas nodes |
canvas := RSCanvas new.
lessonItems := path allChildren collect: [ :fileRef  | fileRef asLessonItem].
lessonItems do: [ :item | 
	item findParentLessonItemIn: lessonItems  ]. 

nodes := RSEllipse 
	models: lessonItems
	forEach: [ :ellipse :model |
		ellipse size: 10;
		color: model color ].
	
canvas addAll: nodes.

RSLineBuilder line
	shapes: canvas nodes;
	connectFrom: #parent .

"(canvas nodes, canvas lines) @ RSLabeled new
	in: [ : label |
		label location middle.
		label shapeBuilder labelShape color: Color black  ];
	yourself  . 
"

RSLineBuilder line 
	shapes: canvas nodes .

	
RSHorizontalTreeLayout new
	on: canvas nodes.

^canvas
	@ RSCanvasController ; 
	yourself

]
