% APP4 S6 GE - E2023
% Anthony Royer - ROYA2019
% Problématique - Système Analogique Piste 1
% 27 juin 2023

% Péparatifs
close all
clear
clc

%Contrôles
RunSim = 0;

%% Mise en place de l'environnement de la simulation
load sons.mat
if RunSim == 1
    out = sim('SystRefAnalogique');
    clc
end

disp('Simulation Fished...')
disp(' ')
Pmoym = sum(Sonm16(:, 2).^2)/length(Sonm16);
Pmoyf = sum(Sonf16(:, 2).^2)/length(Sonf16);

disp('Data Solution Analogique - Piste 1')
disp(['Pmoy Sonm16 = ', num2str(Pmoym*1000), ' mW'])
disp(['Pmoy Sonf16 = ', num2str(Pmoyf*1000), ' mW'])