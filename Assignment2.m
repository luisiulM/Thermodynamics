%% Problem 4
clear all

dT = 0.1;
T0 = -40;        % start temperature   
T = T0:dT:120;  % temperature in celsius
Sice = 41*10^(-3);     % entropy of ice water at 25 degrees celsius [kJ/K]
Sliq = 69.91*10^(-3);  % entropy of liquid water at 25 degrees celsius [kJ/K]
Sgas = 188.83*10^(-3); % entropy of gas water at 25 degrees celsius [kJ/K]

N = length(T);

Gice(1) = -235.38 - Sice*(T0 - 0); % Educated guess value at 0 degrees celcius
Gliq(1) = -237.13 - Sliq*(T0 - 25); % Start value at 0 degrees celcius
Ggas(1) = -228.57 - Sgas*(T0 - 25); % Start value at 0 degrees celcius

for i=1:N
    if (i<N)
        Gice(i+1) = Gice(i) - Sice*dT;
        Gliq(i+1) = Gliq(i) - Sliq*dT;
        Ggas(i+1) = Ggas(i) - Sgas*dT;
    end
end

hold on
plot(T,Gliq)
plot(T,Ggas)
plot(T,Gice)
legend('Water', 'Steam', 'Ice')
xlabel('Temperature in degrees celsius [ ^{\circ}C]')
ylabel('Gibbs free energy [kJ]')

%% Problem 8
clear all

N_A = 1;            % Number of ocillators on first Einstein solid
q_A = 0:1:20;       % Units of energy on first Einstein solid
N2 = 100;          % Number of ocillators on second Einstein solid
q_TOT = 500;           % Total number of energy units

L = length(q_A);

% Calculate multiplicity
for i=1:L
   % Multiplicity of the first Einstein solid
   Omega_A(i) = factorial(q_A(i)+N_A-1)./( factorial(q_A(i)).*factorial(N_A-1) );
   % Multiplicity of the second Einstein solid with Stirling's approximation
   q_B(i) = q_TOT-q_A(i);
   Omega_B(i) = (q_B(i)+N2-1)^(q_B(i)+N2-1)*exp(-(q_B(i)+N2-1)) ./ ( (q_B(i))^(q_B(i))*exp(-(q_B(i))) .* (N2-1)^(N2-1)*exp(-(N2-1)) );
   M_TOT(i) = Omega_A(i)*Omega_B(i); % Total multiplicity
end

%% table
Energy_Units_in_A = transpose(q_A);
Omega_A = transpose(multi_A);
Energy_Units_in_B = transpose(q_B);
Omega_B = transpose(multi_B);
Omega_TOT = transpose(Omega_AB);

table(Energy_Units_in_A, Omega_A, Energy_Units_in_B, Omega_B, Omega_TOT)

%% Plot

plot(Energy_Units_in_A, Omega_TOT)
xlabel('Energy Units in A')
ylabel('Total multiplicity')

%% Plot 2

plot(Energy_Units_in_A, log(Omega_TOT))
xlabel('Energy Units in A')
ylabel('Logarithm of the total multiplicity')