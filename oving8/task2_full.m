
% ----- Model definition -----

run('Mats_and_params_for_Assignment_8')
close all;

% ----- Initial Conditions -----

q0  = zeros(3,1);
Dq0 = zeros(3,1);

% ----- Tuning -----

% PD TUNING
Kp = [[ 3, 0,  0];...
      [ 0, 6,  0];...
      [ 0, 0,  4]];
  
Kd = [[ 4,   0,  0];...
      [ 0,   6,  0];...
      [ 0,   0,  6]];

% INVERSE DYNAMICS TUNING
w1 = 8; w2 = 0.4; w3 = 10;
z1 = 1;  z2 = 1;  z3 = 1;
K0 = diag([ w1^2, w2^2, w3^2]);
K1 = diag([ 2*w1*z1, 2*w2*z2, 2*w3*z3]);

% ----- Simulation settings -----

controller = 0; % 0 for PD, 1 for inv dynamics
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
    title("q_" + num2str(i) + " vs r_" + num2str(i) + " with PD control");
    hold on;
    grid on;
    plot(q_ts.Time, q_ts.Data(:,i),'b');
    plot(r_ts.Time, r_ts.Data(:,i),'r--');
    legend("q_" + num2str(i) , "r_" + num2str(i));
end

figure;
title("Inputs with PD control");
plot(u_ts);

% ----- Simulation -----
controller = 1;
mode = "Accelerator";
time = "50";
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
    title("q_" + num2str(i) + " vs r_" + num2str(i) + ...
          " with inverse dynamics control");
    hold on;
    grid on;
    plot(q_ts.Time, q_ts.Data(:,i),'b');
    plot(r_ts.Time, r_ts.Data(:,i),'r--');
    legend("q_" + num2str(i) , "r_" + num2str(i));
end

figure;
title("Inputs with inverse dynamics control");
plot(u_ts);
