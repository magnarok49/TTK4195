% Tests theoretical critical damping for PD controller

% ------ Tuning ------
w    = 9;
zeta = 1;

% ------ Calculate gains ------
Kp = J*(w^2)
Kd = J*2*zeta*w - B
Ki = 30

% ------ Simulation, static load ------
choose_load = 1;
run("runSimulation.m")
satString = "";
if include_sat
    satString = ", saturation";
end

% ------ Plotting ------
figure;
subplot(2,1,1);
hold on;
grid on;
plot(theta_d_ts);
plot(theta_ts);
legend(["Theta_d","Theta"]);
title("theta vs theta_d, PID controller, static load" + satString);

% ------ Simulation, dynamic load ------
choose_load = 0;
run("runSimulation.m")

% ------ Plotting ------
subplot(2,1,2);
hold on;
grid on;
plot(theta_d_ts);
plot(theta_ts);
legend(["Theta_d","Theta"]);
title("theta vs theta_d, PID controller, dynamic load" + satString);