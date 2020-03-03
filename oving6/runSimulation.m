% ------ Simulation ------

if include_sat
   uh_lim =  20;
   ul_lim = -20;
else
   uh_lim =  inf;
   ul_lim = -inf;
end

simout = sim("testSim.slx", ...
                "SimulationMode", "Accelerator", ...
                "StopTime", "20");
            
% ------ Scrape data ------

tmp        = get(simout.logsout,"theta");
theta_ts   = tmp.Values;
tmp        = get(simout.logsout,"theta_d");
theta_d_ts = tmp.Values;