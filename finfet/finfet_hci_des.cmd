# Device simulation configuration for FinFET

# Set parameters for the HCI simulation
parameters = {
    "temperature": 300, 
    "bias_voltage": 1.2, 
    "time_step": 1e-12, 
    "simulation_time": 1e-6
}

# Additional configuration settings
simulation_settings = {
    "solver": "implicit",
    "max_iterations": 1000
}

# Run the simulation
run_simulation(parameters, simulation_settings)