Class {
	#name : #CCAccountPanelMorph,
	#superclass : #GroupboxMorph,
	#instVars : [
		'accounts',
		'accountsPanel',
		'accountDetail'
	],
	#category : #'CloudConversations-UI-Accounts'
}

{ #category : #accessing }
CCAccountPanelMorph >> accounts [
	^ accounts
]

{ #category : #accessing }
CCAccountPanelMorph >> accounts: aCollection [
	accounts := aCollection.
	accountDetail allAccounts: accounts.
	accountDetail showAccount.
	accountsPanel
		onAccountSelected: [ :selectedAccount | self selectAccount: selectedAccount ].
	accountsPanel accounts: accounts
]

{ #category : #initialization }
CCAccountPanelMorph >> initialize [
	super initialize.	
	self label: 'Cloud Provider Service Accounts';
	vResizing: #shrinkWrap .
	accountsPanel := CCAccountsPanel new.
	accountDetail := CCAccountDetail new.	
	self
		layoutPolicy: TableLayout new;
		width: 410;
		"vResizing: #shrinkWrap ;"
		"listDirection: #topToBottom;"
		"listCentering: #justified ;"
			"cellInset: 5;"
			hResizing: #spaceFill;
		vResizing: #shrinkWrap.
	"hResizing: #spaceFill;
		vResizing: #spaceFill."
	self addMorph: accountsPanel.
	self addMorph: accountDetail.
	accountDetail onAccountUpdate: [ accountsPanel updateList ]
]

{ #category : #accessing }
CCAccountPanelMorph >> selectAccount: anAccount [
	anAccount isNil
		ifTrue: [ ^ self ].
	CCMainController lastUsedAccount: anAccount item.
	accountDetail
		account: anAccount item;
		showAccount
]
