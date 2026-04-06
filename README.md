# Semiconductor-TCAD

TCAD project repository for **Hot Carrier Injection (HCI)** analysis and comparison of:
- Planar **MOSFET**
- **FinFET**

The repository contains simulation command files, parameter/model files, generated data artifacts, and supporting report material.

## Repository structure

- `mosfet/` — Planar MOSFET simulation setup and outputs
  - `mosfet1_msh.cmd` — mesh setup
  - `mosfet1_des.cmd` — device simulation deck
  - `create_geometry.cmd`, `create_geometry.scm` — geometry generation scripts
  - `models.par` — model/parameter definitions
  - `.plt` and generated output files

- `finfet/` — FinFET HCI simulation setup and outputs
  - `finfet_hci_msh.cmd` — mesh setup
  - `finfet_hci_des.cmd` — device simulation deck
  - `finfet_hci.scm` — structure/script file
  - `finfet_hci.par` — model/parameter definitions
  - `.tdr` and generated output files

- `Hot Carrier Injection in MOSFET and FINFET/` — project documentation package
  - `README.md` — analysis framework and guidance
  - `ANALYSIS_TEMPLATE.md` — report template
  - `HC_MOSFET_Final_Report.pdf`, `FinFET_HCI.pdf` — report artifacts
  - `images/` — conceptual figures

## Project focus

This repo is intended for studying HCI behavior using TCAD by comparing MOSFET and FinFET under stress conditions. Typical outputs to analyze include:
- Electric field distribution
- Impact ionization trends
- Current degradation (`Idlin`, `Idsat`)
- Threshold shift (`ΔVth`)

## How to use

1. Open the relevant deck in `mosfet/` or `finfet/`.
2. Run mesh and device simulation steps in your TCAD flow.
3. Post-process generated `.plt` / `.tdr` outputs.
4. Use documentation in `Hot Carrier Injection in MOSFET and FINFET/` to structure analysis and reporting.

## Notes

- Several files in this repository are generated simulation artifacts and logs.
- If you need a clean reproducible workflow, keep source deck files (`.cmd`, `.scm`, `.par`) under version control and regenerate binary outputs as needed.

## License

This project is distributed under the terms in [LICENSE](./LICENSE).
