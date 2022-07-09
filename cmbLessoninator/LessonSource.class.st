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

{ #category : #lessons }
LessonSource >> inspectorVisualizeLessons [ 

	<inspectorPresentationOrder: 90 title: 'lessons'>
	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeLessons ;
		yourself 
]

{ #category : #'instance creation' }
LessonSource >> name: aString [ 
	name := aString
]

{ #category : #accessing }
LessonSource >> path: aFileLocator [ 
	path := aFileLocator
]

{ #category : #lessons }
LessonSource >> visualizeLessons [ 

| docsPath canvas nodes |

docsPath := FileLocator home / 'git' / 'softwarematerial' / 'docs'. 

canvas := RSCanvas new.

"docsPath allChildren do: [ :aFile | 
	| node |
	node := RSEllipse model: aFile .
	canvas add: node ]. "

nodes := RSEllipse 
	models: docsPath allChildren  
	forEach: [ :ellipse :model |
		ellipse size: 10;
		color: Color black ].
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
