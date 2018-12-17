%% Task 2 Problem Statement

%% Constants/Initializations

p = 1.18; %[kg/m3]
v1 = 12; %[m/s]
a = 8; %[deg]
CL = 1.27; %unitless, coeff. of lift
n = 3; %unitless, 3 blades
Kh = 2.7; %[m], chord at hub r = rh
o = 0.40; %unitless, taper ratio
rh = 2.0; %[m], radius at hub
R = 35.0; %[m], radius at tip
w = 2.0; %[rad/s], angular rotation speed

lambda = w*R/v1;
rhat = rh/R;

%% Plot

r = linspace(rh,R,100); %[m], linspace
w_deg = rad2deg(w);
zeta = a - atand(2*R*v1./(3*w_deg*R.*r)); %[deg]
plot(r,zeta);
xlabel("Rotor Radius [m]");
ylabel("Setup Angle \xi [deg.]");
title("Task 2 Plot: Setup Angle vs. Radius for \alpha = 8 deg.");