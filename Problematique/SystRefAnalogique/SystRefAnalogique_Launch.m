% APP4 S6 GE - E2023
% Anthony Royer - ROYA2019
% Problématique - Système Analogique
% 27 juin 2023

% Péparatifs
close all
clear
clc

% Contrôles
RunSim = 0;
RunPiste1 = 1;
RunPiste2 = 1;

%% Mise en place de l'environnement de la simulation
load sons.mat
if RunSim == 1
    out = sim('SystRefAnalogique');
    clc
    disp('Simulation Fished...')
disp(' ')
end

% =====================================
% Data Solution Analogique - Piste 1
% =====================================
if RunPiste1 == 1
    piste1
end
% =====================================
% Data Solution Analogique - Piste 2
% =====================================
if RunPiste2 == 1
    piste2
end


