Title "Untitled"

Controls {
}

IOControls {
	EnableSections
}

Definitions {
	Constant "ConstantProfileDefinition_substrate" {
		Species = "BoronActiveConcentration"
		Value = 1e+15
	}
	Constant "ConstantProfileDefinition_channel" {
		Species = "BoronActiveConcentration"
		Value = 1e+16
	}
	Constant "ConstantProfileDefinition_source" {
		Species = "ArsenicActiveConcentration"
		Value = 1e+20
	}
	Constant "ConstantProfileDefinition_drain" {
		Species = "ArsenicActiveConcentration"
		Value = 1e+20
	}
	Refinement "RefinementDefinition_channel" {
		MaxElementSize = ( 0.005 0.002 0.003 )
		MinElementSize = ( 0.002 0.001 0.001 )
	}
	Refinement "RefinementDefinition_source" {
		MaxElementSize = ( 0.005 0.003 0.003 )
		MinElementSize = ( 0.002 0.001 0.001 )
	}
	Refinement "RefinementDefinition_drain" {
		MaxElementSize = ( 0.005 0.003 0.003 )
		MinElementSize = ( 0.002 0.001 0.001 )
	}
	Refinement "RefinementDefinition_oxide" {
		MaxElementSize = ( 0.005 0.002 0.0005 )
		MinElementSize = ( 0.002 0.001 0.0002 )
	}
	Refinement "RefinementDefinition_bulk" {
		MaxElementSize = ( 0.01 0.01 0.01 )
		MinElementSize = ( 0.005 0.005 0.005 )
	}
}

Placements {
	Constant "ConstantProfilePlacement_substrate" {
		Reference = "ConstantProfileDefinition_substrate"
		EvaluateWindow {
			Element = region ["substrate"]
		}
	}
	Constant "ConstantProfilePlacement_channel" {
		Reference = "ConstantProfileDefinition_channel"
		EvaluateWindow {
			Element = region ["fin_base"]
		}
	}
	Constant "ConstantProfilePlacement_source" {
		Reference = "ConstantProfileDefinition_source"
		EvaluateWindow {
			Element = region ["source"]
		}
	}
	Constant "ConstantProfilePlacement_drain" {
		Reference = "ConstantProfileDefinition_drain"
		EvaluateWindow {
			Element = region ["drain"]
		}
	}
	Refinement "RefinementPlacement_channel" {
		Reference = "RefinementDefinition_channel"
		RefineWindow = region ["fin_base"]
	}
	Refinement "RefinementPlacement_source" {
		Reference = "RefinementDefinition_source"
		RefineWindow = region ["source"]
	}
	Refinement "RefinementPlacement_drain" {
		Reference = "RefinementDefinition_drain"
		RefineWindow = region ["drain"]
	}
	Refinement "RefinementPlacement_oxide_bottom" {
		Reference = "RefinementDefinition_oxide"
		RefineWindow = region ["gate_oxide_bottom"]
	}
	Refinement "RefinementPlacement_oxide_top" {
		Reference = "RefinementDefinition_oxide"
		RefineWindow = region ["gate_oxide_top"]
	}
	Refinement "RefinementPlacement_substrate" {
		Reference = "RefinementDefinition_bulk"
		RefineWindow = region ["substrate"]
	}
	Refinement "RefinementPlacement_box" {
		Reference = "RefinementDefinition_bulk"
		RefineWindow = region ["buried_oxide"]
	}
}

