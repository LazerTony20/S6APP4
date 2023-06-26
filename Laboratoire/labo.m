% APP4 S6 GE - E2023
% Anthony Royer - ROYA2019
% Laboratoire 1
% 26 juin 2023

% Péparatifs
close all
clear
clc

%% A - Mise en place de l'environnement de la simulation
load homme.mat

%% B - Application d'un gain et observation du signal
disp("==================================================")
disp("B - Application d'un gain et observation du signal")
disp('==================================================')
sim('LE1'); % most basic way to simulate with command script.

Vrms = sqrt(sum(homme(:,2).^2)/length(homme));
Pmoy = sum(homme(:,2).^2)/length(homme);

% Réponses
disp('(i) Pourquoi fixe-t-on la période d’échantillonnage à 16 kHz ?')
disp("->      On fixe la période d'echantillonage a 16kHz car c'est le taux d'echantillonage de mon fichier")
disp(' ')
disp("(ii) À l’oeil, pouvez-vous estimer la valeur efficace (RMS) de ce signal ?")
disp("->      On peut dire qqpart entre 0 et 0.45")
%       la valeur absolue de toutes mes données et je regarde a peu pres. Ca donne un bon estimé
disp(' ')
disp("(iii) Comment la valeur efficace calculée se compare-t-elle à celle que vous aviez estimée ? Justifiez tout écart observé, le cas échéant.")
disp(['->      On fait la racine de ma moyenne (et ca concorde avec Vrms = ', num2str(Vrms),')'])
disp(' ')
disp("(iv) Étant donné la valeur efficace du signal, comment peut-on en déduire sa puissance dans une charge normalisée de 1 Ohm?")
disp("->      Avec P = V*I et V = R*I, on a P = V^2/R. Avec R=1Ohm, on a P = V^2")   
disp(['->      Pmoy = ',num2str(Pmoy)])

%% C - Filtrage du Signal
disp("==================================================")
disp("============= C - Filtrage du Signal =============")
disp('==================================================')

disp("(v) Vous devriez observer les 2 spectres superposés, celui de l’entrée supérieure étant en jaune.")
disp("    Commentez sur les différences entre les deux.")
disp("->      On voit que le signal en bleu a été filtré à la fréquence désirée (soit au alentours de 3300Hz).")
disp("->      On voit que le signal en bleu est sensiblement identique à l'original jusqu'à la freq de filtration.")
%% D - Bruit Additif
disp("==================================================")
disp("================ D - Bruit Additif ===============")
disp('==================================================')



