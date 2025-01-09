Class {
	#name : 'CoBasicCompletionTest',
	#superclass : 'TestCase',
	#instVars : [
		'completionClass',
		'systemNavigation'
	],
	#category : 'HeuristicCompletion-Tests-Core',
	#package : 'HeuristicCompletion-Tests',
	#tag : 'Core'
}

{ #category : 'testing' }
CoBasicCompletionTest class >> isAbstract [

	^ self == CoBasicCompletionTest
]

{ #category : 'tests' }
CoBasicCompletionTest >> assertCollectionOfEntry: aCollection equals: anotherCollection [

	self assert: aCollection size equals: anotherCollection size.

	aCollection with: anotherCollection do: [ :a :b |
		self assertEntry: a equals: b ]
]

{ #category : 'tests' }
CoBasicCompletionTest >> assertEntry: anEntry equals: expectedEntry [

	"Entries do not define equality :("
	self assert: anEntry class equals: expectedEntry class.
	self assert: anEntry contents equals: expectedEntry contents
]

{ #category : 'tests' }
CoBasicCompletionTest >> completionClass [

	^ completionClass
]

{ #category : 'tests' }
CoBasicCompletionTest >> innerASTNode [
	| nodeInsideABlock |
	ASTMethodNode
		selector: #foo
		arguments: (#(methodArgument) collect: [ :e | ASTVariableNode named: e ])
		body:
			(ASTSequenceNode
				temporaries: (#(methodTemporary) collect: [ :e | ASTVariableNode named: e ])
				statements:
					{(ASTBlockNode
						arguments: (#(blockArgument) collect: [ :e | ASTVariableNode named: e ])
						body:
							(ASTSequenceNode
								temporaries: (#(blockTemporary) collect: [ :e | ASTVariableNode named: e ])
								statements: {(nodeInsideABlock := ASTVariableNode named: '')}))}).
	^ nodeInsideABlock
]

{ #category : 'running' }
CoBasicCompletionTest >> setUp [

	super setUp.
	completionClass := CoMockClass new
		instanceVariables: #(a b c);
		selectors: #(ma mb mc);
		classVariables: #(Ca Cb Cc);
		sharedPools: {
			CoMockClass new
				classVariables: #(Sa Sb);
				superclass: (CoMockClass new
					classVariables: #(SSupera SSuperb);
					yourself);
				yourself.
			CoMockClass new
				classVariables: #(Sc);
				superclass: (CoMockClass new
					classVariables: #(SSuperc);
					yourself);
				yourself.
		};
		superclass: (CoMockClass new
			instanceVariables: #( supera superb superc );
			selectors: #(superma supermb supermc);
			classVariables: #(SuperCa SuperCb SuperCc);
			yourself)
		yourself.

	systemNavigation := CoMockSystemNavigation new
		globals: {'A' . 'B' . 'C'};
		yourself
]

{ #category : 'tests' }
CoBasicCompletionTest >> systemNavigation [

	^ systemNavigation
]