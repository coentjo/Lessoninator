"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestcmbLessoninator,
	#superclass : #PackageManifest,
	#category : #'cmbLessoninator-Manifest'
}

{ #category : #'code-critics' }
ManifestcmbLessoninator class >> ruleModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#LessonsSource #visualizeLessonsSource #false)) #'2022-07-20T15:34:24.713+02:00') )
]
