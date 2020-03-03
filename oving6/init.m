% ------ Initialization ------

% Controller params
Kp =    8;
Ki =    0;
Kd =    0.5;

% Simulation params
Ti  = 500; % Constant disturbance
r   =  50; % Gear ratio
B   =   1; % Time constant
J   =   2; % Overall inertia
J_l =  80; % Dynamic load inertia
choose_load = 0; % 1 is static load, 0 is dynamic load
include_sat = 0; % 0 is without input saturation, 1 is with

% % ------ Plotting ------
% 
% figure;
% hold on;
% grid on;
% plot(theta_d_ts);
% plot(theta_ts);
% legend(["Theta_d","Theta"]);
% title("theta vs theta_d, PD controller");