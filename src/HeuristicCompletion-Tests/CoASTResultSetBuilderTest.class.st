Class {
	#name : 'CoASTResultSetBuilderTest',
	#superclass : 'CoBasicCompletionTest',
	#category : 'HeuristicCompletion-Tests-Core',
	#package : 'HeuristicCompletion-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
CoASTResultSetBuilderTest >> newCompletionContext [

	^ CoCompletionContext new
		engine: CoMockEngine new;
		yourself
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildArrayHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTArrayNode new;
		buildCompletion.

	self assert: builder heuristic equals: #array
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildAssignmentHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTAssignmentNode new;
		buildCompletion.

	self assert: builder heuristic equals: #assignment
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildBlockHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTBlockNode new;
		buildCompletion.

	self assert: builder heuristic equals: #block
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildCascadeHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTCascadeNode new;
		buildCompletion.

	self assert: builder heuristic equals: #cascade
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildLiteralArrayHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTLiteralArrayNode new;
		buildCompletion.

	self assert: builder heuristic equals: #literalArray
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildLiteralHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTLiteralValueNode new;
		buildCompletion.

	self assert: builder heuristic equals: #literal
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildMessageHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTMessageNode new;
		buildCompletion.

	self assert: builder heuristic equals: #message
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildMethodHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTMethodNode new;
		buildCompletion.

	self assert: builder heuristic equals: #method
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildParseErrorHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTParseErrorNode new;
		buildCompletion.

	self assert: builder heuristic equals: #error
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildPragmaHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTPragmaNode new;
		buildCompletion.

	self assert: builder heuristic equals: #pragma
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildReturnHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTReturnNode new;
		buildCompletion.

	self assert: builder heuristic equals: #return
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildSequenceHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTSequenceNode new;
		buildCompletion.

	self assert: builder heuristic equals: #sequence
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildThisContextHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: (ASTVariableNode thisContextNode variable: ThisContextVariable new);
		buildCompletion.

	self assert: builder heuristic equals: #thisContext
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildVariableClassVariableHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ((ASTVariableNode named: 'ClassVar') variable: (ClassVariable named: 'ClassVar'));
		buildCompletion.

	self assert: builder heuristic equals: #variable
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildVariableGlobalHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ((ASTVariableNode named: 'Object') variable: Object binding);
		buildCompletion.

	self assert: builder heuristic equals: #variable
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildVariableHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ASTVariableNode new;
		buildCompletion.

	self assert: builder heuristic equals: #variable
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildVariableInstanceVariableHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ((ASTVariableNode named: 'ivar') variable: (Slot named: 'ivar'));
		buildCompletion.

	self assert: builder heuristic equals: #variable
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildVariableTempVariableHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ((ASTVariableNode named: 'temp') variable: (TemporaryVariable named: 'temp'));
		buildCompletion.

	self assert: builder heuristic equals: #variable
]

{ #category : 'tests' }
CoASTResultSetBuilderTest >> testBuildVariableUndeclaredHeuristic [

	| builder |
	builder := CoMockASTResultSetBuilder new.
	builder
		completionContext: self newCompletionContext;
		node: ((ASTVariableNode named: 'ClassVar') variable: (UndeclaredVariable named: 'ClassVar'));
		buildCompletion.

	self assert: builder heuristic equals: #variable
]