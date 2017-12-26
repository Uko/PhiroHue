as yet unclassified
gtInspectorIn: composite
	<gtInspectorPresentationOrder: 30> 

composite tabulator 
		title: 'Conditions/Actions';
		with: [ :t |  
			t row: #conditions; row: #actions. 
			t transmit
				to: #conditions;
				andShow: [ :a | 
					conditions gtInspectorItemsIn: a ].
			t transmit
				to: #actions;
				andShow: [ :a | 
					actions gtInspectorItemsIn: a ] ]