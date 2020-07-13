Class {
	#name : #CCDetailPanel,
	#superclass : #PanelMorph,
	#instVars : [
		'itemUpdateCallback',
		'item'
	],
	#category : #'CloudConversations-UI-Common'
}

{ #category : #initialization }
CCDetailPanel >> initialize [
	super initialize.	
	self initializeLayout.	
	self	layoutInset: 5 @ 5.
	self initializeButtons .

]

{ #category : #initialization }
CCDetailPanel >> initializeButtons [
	self subclassResponsibility 
]

{ #category : #initialization }
CCDetailPanel >> initializeLayout [
	self
		layoutPolicy: TableLayout new;
		wrapDirection: #topToBottom;
		listDirection: #leftToRight;
		vResizing: #shrinkWrap;
		width: 300;
		cellInset: 1;
		layoutInset: 1;
		color: Color yellow;
		color: Color gray darker
]

{ #category : #initialization }
CCDetailPanel >> item [
	^  item
]

{ #category : #initialization }
CCDetailPanel >> item: i [
	item := i.
	self renderDetail
]

{ #category : #initialization }
CCDetailPanel >> onItemDelete: anItemDeleteCallback [
	itemUpdateCallback := anItemDeleteCallback 
]

{ #category : #initialization }
CCDetailPanel >> onItemUpdate: anItemUpdateCallback [
	itemUpdateCallback := anItemUpdateCallback 
]

{ #category : #rendering }
CCDetailPanel >> renderDetail [
	self subclassResponsibility  
]