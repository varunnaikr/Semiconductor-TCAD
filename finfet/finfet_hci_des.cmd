File {
  Grid = "finfet_hci_msh.tdr"
  Parameter = "finfet_hci.par"
  Current = "finfet_hci_des.plt"
  Plot = "finfet_hci_des.tdr"
  Output = "finfet_hci_des.log"
}

Electrode {
  { Name="gate" Voltage=0.0 }
  { Name="drain" Voltage=0.0 }
  { Name="source" Voltage=0.0 }
  { Name="subs" Voltage=0.0 }
}

Physics {
    Hydro(eTemperature)
    Mobility(DopingDependence)
    Recombination(SRH Auger eAvalanche hAvalanche)  
  }

Solve {
  Quasistationary(InitialStep=0.01 Increment=1.5 MaxStep=0.1 MinStep=1.0e-4 Goal { Name="gate" Voltage=1.0 }) { Coupled { Poisson Electron Hole eTemperature } }
}

Solve {
  Quasistationary(InitialStep=0.01 Increment=1.2 MaxStep=0.05 MinStep=1.0e-5 Goal { Name="drain" Voltage=2.0 }) { Coupled { Poisson Electron Hole eTemperature } }
}

Solve {
  Quasistationary(InitialStep=0.01 Increment=1.2 MaxStep=0.05 MinStep=1.0e-5 Goal { Name="drain" Voltage=3.0 }) { Coupled { Poisson Electron Hole eTemperature } }
}

Math {
  Extrapolate
  Avalderivatives
  RelErrControl Digits=5
  Iterations=20
}
