
% ----- Model definition -----

% This defines expressions using syms for qi and Dqi, stacking the vectors 
% and using subs(expr, [q1,q2,q3,Dq1,Dq2,Dq3],u) should do the trick.
run('Mats_and_params_for_Assignment_8')

% ----- Initial Conditions -----

q0  = zeros(3,1);
Dq0 = zeros(3,1);

% ----- Tuning -----

Kp = [[ 3, 0,  0];...
      [ 0, 6,  0];...
      [ 0, 0,  4]];
  
Kd = [[ 4,   0,  0];...
      [ 0,   6,  0];...
      [ 0,   0,  6]];

% ----- Simulation settings -----

controller = 0;
mode = "Accelerator";
time = 50;

% ----- Simulation -----

simout = sim('task2.slx',"SimulationMode", mode, ... 
                         "StopTime"      , num2str(time));

% ----- Scraping data -----

tmp   = get(simout.logsout, 'q');
q_ts  = tmp.Values;
tmp   = get(simout.logsout, 'Dq');
Dq_ts = tmp.Values;
tmp   = get(simout.logsout, 'u');
u_ts  = tmp.Values;
tmp   = get(simout.logsout, 'r');
r_ts  = tmp.Values;

% ----- Plotting -----

figure;
for i = 1:3
    subplot(3,1,i);
    title("q_" + num2str(i) + " vs r_" + num2str(i));
    hold on;
    grid on;
    plot(q_ts.Time, q_ts.Data(:,i),'b');
    plot(r_ts.Time, r_ts.Data(:,i),'r--');
    legend("q_" + num2str(i) , "r_" + num2str(i));
end

figure;
title("Inputs");
plot(u_ts);
