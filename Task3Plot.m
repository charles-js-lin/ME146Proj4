%% Task 3 Problem Statement
% Plot setup angle to keep alpha = 8

%% Constants/Initializations

p = 1.18;
v1 = 6.5;
a = 8;
CL = 1.26;
n = 3;
w = 3.0;

% Deliverables
o = 0;
R = 4.9042; %[m]

rh = 0.1*R;
Kh = 0.085*R;
lambda = w*R/v1;
rhat = rh/R;

%% Plot

r = linspace(rh,R,100); %[m], linspace
w_deg = rad2deg(w);
zeta = a - atand(2*R*v1./(3*w_deg*R.*r)); %[deg]
plot(r,zeta);
xlabel("Rotor Radius [m]");
ylabel("Setup Angle \xi [deg.]");
title("Task 3 Plot: Setup Angle vs. Radius for \alpha = 8 deg.");