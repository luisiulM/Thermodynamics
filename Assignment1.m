%% Calculation
clear all

N = 50;             % Number of ocillators
q = 0:1:100;        % Units of energy

% Calculate multiplicity
for i=1:length(q)
   omega(i) = factorial(q(i)+N-1)./( factorial(q(i)).*factorial(N-1) );
end

% Calculate entropy
S = log(omega);

% Calculate temperature
T(1) = 0; % Initial value for temperature
for i=1:length(q)
    if (i>1) && (i<101)
        T(i) = ( q(i+1)-q(i-1) )/( S(i+1)-S(i-1) );
    end
end

omegalast = factorial( length(q) +N-1)./( factorial( length(q) ).*factorial(N-1) );
entropylast = log(omegalast);
T(i) = 2/( entropylast-S(i-1) ); % Last value for temperature

% Calculate heat capacity
for i=1:length(q)
    if (i>1) && (i<101)
        C(i) = ( q(i+1)-q(i-1) )/( T(i+1)-T(i-1) )/N;
    end
end

omegalast2 = factorial( length(q)+1 +N-1)./( factorial( length(q)+1 ).*factorial(N-1) );
entropylast2 = log(omegalast2);
Tlast = 2/( entropylast2-S(i) );
C(i) = 2/( Tlast-T(i-1) )/N; % Last value for heat capacity

%% Create table
EnergyUnits = transpose(q);
Multiplicity = transpose(omega);
Entropy = transpose(S);
Temperature = transpose(T);
HeatCapacity = transpose(C);

table(EnergyUnits, Multiplicity, Entropy, Temperature, HeatCapacity)

%% Plot graphs

plot(q,S)
xlabel('Energy U/\epsilon = q')
ylabel('Entropy S/k = ln(\Omega)')

%%
%subplot(1,2,2)
plot(T,C)
xlabel('Temperature kT/\epsilon = \Delta q/\Delta S')
ylabel('Heat capacity C/Nk = \Delta q/N\Delta T')
