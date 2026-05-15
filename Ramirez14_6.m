% Temperature Application
% Define constants
Tb = 170;     % Bath temperature (°F)
Ti = 70;      % Initial temperature (°F)
k = 10;       % From equation: 10 dT/dt + T = Tb → dT/dt = (Tb - T)/10

% Solve for temperature after 10 s
[~,T] = ode45(@(t,T) (Tb - T)/k, [0 10], Ti);
n = length(T);
fprintf("The temperature after 10s is %.2f°F\n", T(n))

% Solve for temperature after 20 s
[~,T] = ode45(@(t,T) (Tb - T)/k, [0 20], Ti);
n = length(T);
fprintf("The temperature after 20s is %.2f°F\n", T(n))

% Solve for temperature after 40 s
[~,T] = ode45(@(t,T) (Tb - T)/k, [0 40], Ti);
n = length(T);
fprintf("The temperature after 40s is %.2f°F\n", T(n))

% Solve for time to reach 160°F
[t,T] = ode45(@(t,T) (Tb - T)/k, [0 100], Ti);
near160 = T > 159.9 & T < 160.1;
time160 = t(near160);
fprintf("It will take %.1f seconds for the temperature to reach 160°F.\n", time160)

% Plot the temperature curve
plot(t,T, 'LineWidth', 2)
ylim([0 180])
grid on
title("Temperature of Object in Liquid Bath")
xlabel("Time (s)")
ylabel("Temperature (°F)")
