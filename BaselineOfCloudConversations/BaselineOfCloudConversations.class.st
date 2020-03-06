Class {
	#name : #BaselineOfCloudConversations,
	#superclass : #BaselineOf,
	#category : #BaselineOfCloudConversations
}

{ #category : #baselines }
BaselineOfCloudConversations >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'CloudConversations-Core';
				package: 'CloudConversations-UI';
				package: 'CloudConversations-Tests'
					with: [ spec requires: #('CloudConversations-Core') ].
			spec
				baseline: 'NeoJSON'
				with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].
			spec
				baseline: 'JSONWebToken'
				with: [ spec repository: 'github://noha/JSONWebToken:master/source' ].	]
]

{ #category : #baselines }
BaselineOfCloudConversations >> projectClass [
	^ MetacelloCypressBaselineProject
]