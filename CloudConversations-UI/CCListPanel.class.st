Class {
	#name : #CCListPanel,
	#superclass : #PanelMorph,
	#instVars : [
		'selectedCallback',
		'list',
		'listCollection',
		'selectedIndex'
	],
	#category : #'CloudConversations-UI-Common'
}

{ #category : #rendering }
CCListPanel >> asynchronousResolver: item [
	self subclassResponsibility  
]

{ #category : #rendering }
CCListPanel >> asynchronouslyResolveSelectedItems [
	self subclassResponsibility  
]

{ #category : #initialization }
CCListPanel >> deleteItem [
]

{ #category : #initialization }
CCListPanel >> highlightSelectedItem [
	listCollection
		ifEmpty: [  ]
		ifNotEmpty: [ list selectionIndex: selectedIndex   ]
]

{ #category : #initialization }
CCListPanel >> initialize [
	super initialize.
	self initializeLayout.
	self initializeList 
]

{ #category : #initialization }
CCListPanel >> initializeLayout [
	self
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		cellInset: 10 @ 20;
		"width: 280;"
		height:400;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		themeChanged;
		color: Color gray darker
]

{ #category : #initialization }
CCListPanel >> initializeList [
	list := PluggableIconListMorph new.
	list
		color: Color gray;
		top: 35;
		"left: 10;"
		"width:220;"
		height:280;
		width: 300;
		borderWidth: 10;
		"hResizing: #shrinkWrap;"
		"hResizing: #shrinkWrap;"
		"vResizing: #shrinkWrap;"
		wrapSelector: #wrapSelector;
		getIconSelector: #icon.
	self addMorph: list.
	list updateList
]

{ #category : #initialization }
CCListPanel >> itemSelected: anIndex [
	| item |
	anIndex > 0
		ifFalse: [ ^ self ].
	selectedIndex := anIndex.
	item := listCollection at: selectedIndex.
	selectedCallback
		ifNotNil: [ self asynchronouslyResolveSelectedItems
				ifTrue: [ (self asynchronousResolver: item)
						onSuccessDo: [ :res | selectedCallback value: res ] ]
				ifFalse: [ selectedCallback value: item ] ].
	self highlightSelectedItem
]

{ #category : #initialization }
CCListPanel >> itemSelectedIndex: i [
	selectedIndex := i
]

{ #category : #initialization }
CCListPanel >> listCollection [
	^ listCollection
]

{ #category : #initialization }
CCListPanel >> listCollection: aCollection [
	listCollection := aCollection.
	list
		on: self
		list: #listCollection
		selected: #selectListRow
		changeSelected: #itemSelected:
		menu: nil
		keystroke: nil.
	aCollection isEmpty ifFalse: [ self itemSelectedIndex: 1 ].
]

{ #category : #initialization }
CCListPanel >> onItemSelected: aSelectedCallback [
	selectedCallback := aSelectedCallback 
]

{ #category : #initialization }
CCListPanel >> selectListRow [
	^ selectedIndex 
]

{ #category : #rendering }
CCListPanel >> updateList [
	self subclassResponsibility  
]
