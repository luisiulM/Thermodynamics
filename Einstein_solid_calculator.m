%% EINSTEIN SOLIDS CALCULATOR 
% Macrostates and multiplicities of a system of two Einstein solids,
% initialy set at 200 and 300 oscilators respectively, sharing a total of
% 100 energy units [Schroeder p59]. Requires a calculation of
% "599!/(499!*100!) beyond MatLab without my modification function 'C'
clear all

q_total = 500;            % # total energy units
N_A = 1;                  % # ocsilators solid A
N_B = 100;                % # ocsilators solid B
%% requires file C.m
Micro = C(q_total + N_A + N_B -1, q_total);% # Total Microstates  
%%
Macro = q_total + 1;        % # Total Macrostates
q_A = 0:20;            % vector of macro states for N_A
q_B = q_total - q_A;        % same vector reversed for N_B
multi_A = zeros(1, length(q_A) );% initialize multiplicity of each qA macro state
multi_B = zeros(1, length(q_B) );% initialize multiplicity of each qB macro state
%%
for i = 1:length(q_A)
    multi_A(i) = C(q_A(i) + N_A - 1, q_A(i));% # microstates for each N_A macrostate
    multi_B(i) = C(q_B(i) + N_B - 1, q_B(i));% # microstates for each N_B macrostate
end
Omega_AB = multi_A .* multi_B; % total multiplicities, ie # microstates
%%
%% Print
% q_A_equalibrium = Print_Einstein_Solid_Calculations(Omega_AB,...
%                                            Micro, q_total,...
%                                            multi_A, multi_B,...
%                                            q_A, q_B); 
                                       
fprintf('sum  of Omega_A.B: %0.2E\ntotal microstates: %0.2E\n', sum(Omega_AB), Micro)

q_A_equalibrium = find(Omega_AB==max(Omega_AB))-1; % -1 as index(1) => qA = 0

fprintf('Equalibrium  at macrostate q_A=%d (q_B=%d)\n',...
    q_A_equalibrium, q_total - q_A_equalibrium)
fprintf('Multiplicity of macrostate: %0.2E\n', Omega_AB(q_A_equalibrium+1))
fprintf('Probability  of macrostate: %0.1f %%\n', 100*Omega_AB(q_A_equalibrium+1)/Micro)
disp(' ')

P = Omega_AB./Micro;
disp('   q_A  Omega_A      q_B  Omega_B       Omega_A.B     Probability')
disp(' ')
for i = 1:length(multi_A)
    fprintf(' %3d  %9.2E  |  %3d  %9.2E  |  %10.3E  |  %9.2E\n',... 
        q_A(i), multi_A(i), q_B(i), multi_B(i),Omega_AB(i),P(i))
end 
disp(' ')
disp(' ')                                     

%% Plot
% graph_Einstein_solid(Omega_AB, q_total+0.5,q_A_equalibrium,Micro)
f=figure(10);
a=axes('Parent', f);
hold(a, 'on')
bar(0:length(Omega_AB)-1,Omega_AB)
plot(0:length(Omega_AB)-1,Omega_AB, 'LineWidth', 1, 'Color','r')
xlim([-0.5 q_total+0.5]) 

% Create Labels
xlabel('q_A','FontWeight','bold','FontAngle','italic','FontSize',14);

ylabel('\Omega  _{( q_A . q_B )}','FontWeight','bold',...
        'FontAngle','italic','FontSize',14);

title(sprintf('                  equalibrium at q_A = %d    |    \\Omega _t_o_t_a_l %0.1E ',...
    q_A_equalibrium(1),Micro),'FontWeight','bold','FontSize',12, 'FontAngle','italic')



% C:\Users\Andrew\OneDrive\Documents\AC\UNI SYD 2016\SEM 1\PHYS2011\Thermo\MatLab Thermo\Einstein_solid_calculator.m