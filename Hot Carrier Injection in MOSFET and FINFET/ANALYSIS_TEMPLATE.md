# HCI Analysis Template for Imported TCAD Decks

Use this template after adding the original simulation files.

## A. Input Deck Audit

| Category | MOSFET deck | FinFET deck | Notes |
|---|---|---|---|
| Solver type (DD/HD/EB) |  |  |  |
| Mobility model set |  |  |  |
| Impact ionization model |  |  |  |
| Self-heating enabled |  |  |  |
| Trap/interface model |  |  |  |

## B. Geometry + Doping Comparison

| Parameter | MOSFET | FinFET | Impact on HCI |
|---|---:|---:|---|
| Effective channel length |  |  |  |
| Oxide thickness / EOT |  |  |  |
| Drain extension |  |  |  |
| Peak drain-side doping |  |  |  |
| Fin width / height (FinFET) | N/A |  |  |

## C. Stress Matrix

| Stress ID | Vg (V) | Vd (V) | Temp (°C) | Time window | Device |
|---|---:|---:|---:|---|---|
| S1 |  |  |  |  | MOSFET |
| S2 |  |  |  |  | FinFET |

## D. Quantitative Extraction

| Metric | Initial | End-of-stress | Delta | Normalized delta |
|---|---:|---:|---:|---:|
| Idsat |  |  |  |  |
| Idlin |  |  |  |  |
| gm,max |  |  |  |  |
| Vth (constant current) |  |  |  |  |
| Isub,max |  |  |  |  |
| Ig,max |  |  |  |  |

## E. Spatial Physics (from contour plots)
- Peak lateral E-field coordinates:
- Peak impact ionization coordinates:
- Electron temperature hotspot:
- Correlation with observed parameter shift:

## F. Conclusion
- Which device is more HCI-robust under equivalent stress?
- Dominant mechanism: interface trap generation, oxide trap charging, or mixed?
- Design recommendations: drain engineering, spacer tuning, fin geometry optimization, or stress bias derating.
