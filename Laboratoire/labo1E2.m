% APP4 S6 GE - E2023
% Anthony Royer - ROYA2019
% Laboratoire 1 - Exercice 2
% 26 juin 2023

% Péparatifs
close all
clear
clc

% Variables
PlayAudio = 1;

%% Mise en place de l'environnement de la simulation
load homme.mat
out = sim('L1E2');


% A - Histogramme du signal audio et du bruit blanc
disp("=====================================================")
disp("= A - Histogramme du signal audio et du bruit blanc =")
disp('=====================================================')

figure('Name','Histogramme du signal audio')
hold on
hist(out.z, 50);
hold off

disp('(i) Que peut-on conclure de la forme des histogrammes pour le signal audio et le bruit ?')
disp(['->      O'])
disp(' ')

% B - Histogramme du bruit filtré
disp("=====================================================")
disp("========== B - Histogramme du bruit filtré ==========")
disp('=====================================================')

figure('Name','Histogramme du bruit filtré')
hold on
hist(out.z_bruit_filtre, 50);
hold off

disp('(ii) Comment le filtrage affecte-t-il la distribution statistique de l’amplitude du processus de bruit ?')
disp(['->      O'])
disp(' ')


