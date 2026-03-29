# Hot Carrier Injection in MOSFET and FINFET

## Import status for shared Google Drive folder
The requested Google Drive folder could not be downloaded from this execution environment because outbound access to `drive.google.com` is blocked (HTTP 403 from proxy).

**Requested source:**
`https://drive.google.com/drive/folders/17a-tFkZA2a1YiATL6Bi285NHSpyeCrwM?usp=sharing`

To complete full ingestion, add the raw TCAD project files into this directory and keep their original folder structure.

---

## Technical analysis framework (prepared for your TCAD project)

This project folder is structured to support a full **Hot Carrier Injection (HCI)** analysis for both planar MOSFET and FinFET devices.

### 1) What to extract from the TCAD deck(s)
- **Device geometry**
  - Channel length, oxide thickness, spacer, LDD/halo profiles.
  - Fin dimensions (height, width, pitch) for FinFET.
- **Physical models**
  - Mobility (surface/field dependent), impact ionization model, SRH/Auger, tunneling.
  - Carrier heating / energy balance / hydrodynamic options.
- **Bias stress conditions**
  - Stress voltages (`Vg`, `Vd`, `Vs`, `Vb`), time, temperature.
- **Monitors**
  - Drain current degradation (`Idlin`, `Idsat`), transconductance (`gm`), threshold shift (`ΔVth`), substrate current (`Isub`), gate current (`Ig`).

### 2) Core HCI indicators to compare
- **Peak lateral electric field** near drain-side channel edge.
- **Impact ionization rate hotspot** location and magnitude.
- **Electron temperature / average carrier energy** (if energy transport enabled).
- **Current degradation trends** under matched stress conditions.
- **Normalized degradation**: `ΔId/Id0`, `Δgm/gm0`, `ΔVth` vs stress time.

### 3) Expected MOSFET vs FinFET behavior
- FinFETs often show improved electrostatic control and reduced peak field crowding versus equivalent planar devices.
- However, local corner effects and fin sidewall fields can become dominant depending on fin geometry and spacer design.
- Final conclusion should be based on matched **E-field, ionization, and degradation** metrics from your actual decks.

### 4) Recommended reporting package
- Geometry cross-sections with material labels.
- Contours: electric field, impact ionization, electron temperature.
- Transfer/output curves pre- and post-stress.
- Time degradation plots in log-time scale.
- One comparison table: MOSFET vs FinFET HCI sensitivity.

---

## Included visual aids
The `images/` folder includes conceptual plots to guide result interpretation and report writing:
- `hci_concept_bands.svg`
- `hci_degradation_trend.svg`
- `mosfet_finfet_field_profile.svg`

These are placeholders and should be replaced or complemented by exported TCAD figures once source simulations are available.
