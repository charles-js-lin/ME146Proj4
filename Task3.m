%% Task 3 Problem Statement
% Provide 1.5 kW of power. This means Wdot = 1.5e3.
% Maximize efficiency, Wdot/Wbetz

p = 1.18;
v1 = 6.5;
alpha = 8;
CL = 1.26;
n = 3;
w = 3.0;

Wdot_des = 1500;
ospace = linspace(0,1,101); % Deliverable
Rspace = linspace(2,190,17001); % Deliverable

% power_results = zeros(31,11);
% eff_results = zeros(31,11);
results = [];
for i = 1:length(ospace)
    for j = 1:length(Rspace)
        o = ospace(i);
        R = 4.904;%Rspace(j);
        rh = 0.1*R;
        Kh = 0.085*R;
        lambda = w*R/v1;
        rhat = rh/R;

        x = o/(1-rhat);
        power1 = (1/3)*n*p*v1^3*CL*lambda^2*Kh*R;
        a = (((1/3)+(o/(1-rhat))*((rhat/3)-1/4))*(1+(4/(9*lambda^2)))^1.5)-(((1/3)+(o/(1-rhat))*((rhat/12)))*(rhat+(4/(9*lambda^2)))^1.5);
        b = x*1/(18*lambda^2)*((sqrt(1+(4/(9*lambda^2)))-(rhat*sqrt(rhat^2+(4/(9*lambda^2))))));
        c = x*2/(81*lambda^4)*log((1+sqrt(1+(4/(9*lambda^2))))/(rhat+sqrt(rhat^2+(4/(9*lambda^2)))));
        Wdot = power1*(a-b-c);
        Wbetz = 8*pi/27*p*v1^3*R^2*(1-rhat^2);

        eff = (9*n*CL*lambda^2*Kh)*(a-b-c)/(8*pi*R*(1-rhat^2));
        
        error = abs(Wdot-Wdot_des);
        if(error < 0.025*Wdot_des) && (eff<1)% && (eff>0.3)
            col = [o; R; Wdot; eff];
            results = [results col];
        end
        power_results(i,j) = Wdot;
        eff_results(i,j) = eff;
    end
end

power_results = [Rspace; power_results];
eff_results = [Rspace; eff_results];
