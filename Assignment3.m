%% problem 1c
k = 1.381*10^(-23);             % Boltzmann constant [J/K]
T = 4*10^(22);                  % Temperature [K]
mu = 20;                        % Chemical potential [J]
epsilon = linspace(0,2*mu,500); % Energy per particle in state [J]

FD = 1./(exp((epsilon-mu)./(k.*T)) + 1);  % Fermi-Dirac
BED = 1./(exp((epsilon-mu)./(k.*T)) - 1); % Bose-Einstein
BD = exp(-(epsilon-mu)./(k.*T));          % Boltzmann distribution

plot(epsilon,FD)
hold on
plot(epsilon,BED,'--')
plot(epsilon,BD,':o')
ylim([0 1.5])
xlim([0.9*mu 1.1*mu])
legend('Fermi-Dirac','Bose-Einstein','Boltzmann distribution')
xlabel('Energy per particle in state \epsilon [J]')
ylabel('Occupancy ')

%% problem 6
k = 1.381*10^(-23); % Boltzmann constant [J/K]
h = 6.626*10^(-34); % planck constant [Js]
T = 300;            % Temperature [K]
f = 4.8*10^(13);    % frequency [Hz]

Z(1) = exp(-(1/2*h*f)/(k*T))
