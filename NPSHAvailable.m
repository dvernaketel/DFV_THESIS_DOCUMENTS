%% Net positive suction head available

clear
clc

% Length of pipe
L = 2*0.3048; % m

% Array of water heights
h = linspace(0,3) + L; % m

% Atmospheric pressure
P_atm = 101600; % Pa

% Density of water at room temperature
rho = 997; % kg/m^3

% Calculation of flow rate
Q = 2.3/rho; %m^3/s

% Diameter
D = 1.0049*0.0254; %m

% Pipe velocity
V = Q/(D^2 * pi() / 4); % m/s

% Gravitational constant
g = 9.81; %m/s^2

% Vaporization pressure of water at room temperature
pv = 3170;

% Dynamic viscosity of water at room temperature
mu = 0.0008900;

% Calculating Reynolds number
Re = rho * V * D / mu;

% friction factor
f = 0.024;

% Major losses
hL1 = f .* L.* V^2 ./ (2 * g * D);

% Minor loss coefficient
KL = 3.9;

% Minor losses
hL2 = KL * V^2 / 2 / g;

% Pressure in
Pin = P_atm + (h+1*0.3048-hL1-hL2)*rho*g;

% Calculating net positive head available
NPSHA = ((Pin-pv)/rho/g) * 3.28084;

% Converting back to imperial units
h = h * 3.28084;

% Plotting
plot(h,NPSHA);
grid on
xlabel('Height of Water Level in Tank (ft.)')
ylabel('NPSH_A (ft.)')
legend('NPSH_A (ft.)')