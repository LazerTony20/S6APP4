% APP4 S6 GE - E2023
% Anthony Royer - ROYA2019
% Problématique - Système Analogique - Piste 2
% 28 juin 2023

% Ce fichier est concu pour être exécuté depuis un autre script Matlab

% Constantes

PlayAudio = 0;

disp('=====================================')
disp('Data Solution Analogique - Piste 2')
disp('=====================================')
Pmaxm = max(Sonm16(:, 2)).^2;
Pmaxf = max(Sonf16(:, 2)).^2;

% exécuter avec et sans bruit
% set_param('DepartPiste2/Beta', 'value', '2')
set_param('DepartPiste2/SwNoise', 'sw', '1')
sim("DepartPiste2");
Ps = sum(simout.^2)/length(simout);
set_param('DepartPiste2/SwNoise', 'sw', '0')
sim("DepartPiste2");
Psb = sum(simout.^2)/length(simout);

if PlayAudio == 1
    y = audioplayer(simout, 16000);
    play(y);
end

disp(['Pmax Sonm16 = ', num2str(Pmaxm*1000), ' mW'])
disp(['Pmax Sonf16 = ', num2str(Pmaxf*1000), ' mW'])
disp(' ')


RSBoB1 = Ps/(Psb-Ps);
RSBoB1dB = 10*log10(RSBoB1);
disp(['RSBo (Beta = 2) = ', num2str(RSBoB1)])
disp(['RSBo (Beta = 2) = ', num2str(real(RSBoB1dB)), ' dB'])