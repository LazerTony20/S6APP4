% APP4 S6 GE - E2023
% Anthony Royer - ROYA2019
% Laboratoire 1
% 26 juin 2023


% Péparatifs
close all
clear
clc

% Variables
PlayAudio = 1;

%% A - Mise en place de l'environnement de la simulation
load homme.mat

%% B - Application d'un gain et observation du signal
disp("==================================================")
disp("B - Application d'un gain et observation du signal")
disp('==================================================')
out = sim('LE1'); % most basic way to simulate with command script.

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
disp(' ')
%% C - Filtrage du Signal
disp("==================================================")
disp("============= C - Filtrage du Signal =============")
disp('==================================================')

disp("(v) Vous devriez observer les 2 spectres superposés, celui de l’entrée supérieure étant en jaune.")
disp("    Commentez sur les différences entre les deux.")
disp("->      On voit que le signal en bleu a été filtré à la fréquence désirée (soit au alentours de 3300Hz).")
disp("->      On voit que le signal en bleu est sensiblement identique à l'original jusqu'à la freq de filtration.")
disp(' ')
%% D - Bruit Additif
disp("==================================================")
disp("================ D - Bruit Additif ===============")
disp('==================================================')

% Calculs théoriques
No = (0.048/16000)*2;
Pnfiltree = (No/2)*(2*3300);
% Calculs de simulation
Pbruitmoy = sum(out.simout.^2)/length(out.simout);
Densite_Pbruit = Pbruitmoy/16000;
% On est en Bilatéral, en unilatéral on aurait eu une division par 8000
Densite_Pbruit_db = 10*log10(Densite_Pbruit/(10^-3));

Veffbruit = sqrt(Pbruitmoy);

disp('(vi)   Simplement par raisonnement et calcul, déterminez la puissance du bruit en sortie du filtre.')
disp(['->      La puissance de bruit calculée théorique est de ', num2str(Pnfiltree), ' W'])
disp(' ')
disp('(vii)  Calculer la valeur efficace du bruit en sortie par le biais d’une commande appropriée')
disp('       dans l’environnement Matlab (comme fait en (b) ci-haut). À partir de cette valeur,')
disp('       calculez la puissance de out.simout et comparez votre résultat à celui obtenu en (i).')
disp(['->       La puissance de bruit obtenue depuis la simulation est de ', num2str(Pbruitmoy), ' W'])
disp(' ')
disp('(viii) Étant donné sa largeur de bande et sa puissance, que devrait être le niveau (d’un point ')
disp('       de vue théorique) de la densité spectrale de puissance du bruit (en mW / Hz) à la sortie')
disp('       du filtre à l’intérieur de la bande passante de ce dernier ?')
disp(['->      DSP_Bruit = ', num2str(Densite_Pbruit*1000000), ' µW/Hz'])
disp(' ')
disp('(ix)   Exprimez le niveau trouvé en (viii) en dBm / Hz.')
disp(['->      DSP_Bruit (dB) = ', num2str(Densite_Pbruit_db), ' dB'])
disp(' ')
disp('(x)    Comparez la densité spectrale de puissance dans la bande passante du filtre observée via le')
disp('       bloc Spectrum Analyzer et votre résultat en (l). Y a-t-il correspondance ? Pourquoi croyez-vous')
disp('       qu’il y a autant de variation dans l’analyseur de spectre au lieu d’un spectre parfait et plat ?')
disp(['->      O'])
disp(' ')
%% E - Chaîne complète avec bruit additif
disp("==================================================")
disp("===== E - Chaîne complète avec bruit additif =====")
disp('==================================================')

if PlayAudio == 1
    y = audioplayer(out.z, 16000);
    play(y);
end

disp('(xi) Calculez de manière analytique le rapport signal sur bruit à la sortie de la chaîne.')
disp(['->      O'])
disp(' ')
disp('(xii) À partir de quel rapport signal sur bruit la qualité du signal audio semble-t-elle acceptable ?')
disp(['->      O'])
% Hier, il y avait du smog en maudine. Montréal avait le pire indice de qualité d'air au monde :/