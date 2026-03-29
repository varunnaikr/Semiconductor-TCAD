# Full Device Simulation Configuration File

## File Section
file: "finfet/mosfet1"

## Electrode Section
electrodes:
  - name: "Source"
    type: "n+"
    voltage: 0.0
  - name: "Gate"
    type: "metal"
    voltage: 1.0
  - name: "Drain"
    type: "n+"
    voltage: 0.5

## Physics Section
physics:
  - model: "BSIM3"
    parameters:
      - length: 0.1e-6
      - width: 1.0e-6

## Math Section
math:
  equations:
    - equation: "d/dt(Voltage) = Current / Capacitance"

## Plot Section
plots:
  - title: "Gate Voltage vs Drain Current"
    x_axis: "Gate Voltage (V)"
    y_axis: "Drain Current (A)"

## Solve Section
solve:
  - algorithm: "Newton-Raphson"
    tolerance: 1e-6