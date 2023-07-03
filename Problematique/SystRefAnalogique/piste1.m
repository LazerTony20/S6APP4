% APP4 S6 GE - E2023
% Anthony Royer - ROYA2019
% Problématique - Système Analogique - Piste 1
% 28 juin 2023

% Ce fichier est concu pour être exécuté depuis un autre script Matlab

% Constantes
DSPbi = 10*10^-6;   % En W/Hz
fm = 3400;          % En Hz
Gc_dB = -8;         % En dB (Gain canal)
RSBo_dB = 30;       % En dB
Py2_max_dB = 27;    % En dBW

% =====================================
% Data Solution Analogique - Piste 1
% =====================================
disp('=====================================')
disp('Data Solution Analogique - Piste 1')
disp('=====================================')

Pmoym = sum(Sonm16(:, 2).^2)/length(Sonm16);
Pmoyf = sum(Sonf16(:, 2).^2)/length(Sonf16);

Pn = DSPbi*(2*fm);
Py3_min = Pn*10^(RSBo_dB/10);
Py2_min = Py3_min/(10^(Gc_dB/10));
Py2_max = 10^(Py2_max_dB/10);

Gtm_min = Py2_min/Pmoym;
Gtf_min = Py2_min/Pmoyf;
Gtm_max = Py2_max/Pmoym;
Gtf_max = Py2_max/Pmoyf;
% Conversion en dB
Gtm_min_dB = 10*log10(Gtm_min);
Gtf_min_dB = 10*log10(Gtf_min);
Gtm_max_dB = 10*log10(Gtm_max);
Gtf_max_dB = 10*log10(Gtf_max);

disp(['Pmoy Sonm16 = ', num2str(Pmoym*1000), ' mW'])
disp(['Pmoy Sonf16 = ', num2str(Pmoyf*1000), ' mW'])
disp(' ')
disp('=== Gains transmission ===')
disp(['[',num2str(round(Gtm_min,2)),' ≤ ','Gt_m',' ≤ ',num2str(round(Gtm_max,2)),']'])
disp(['[',num2str(round(Gtf_min,2)),' ≤ ','Gt_f',' ≤ ',num2str(round(Gtf_max,2)),']'])
disp('            ou')
disp(['[',num2str(round(Gtm_min_dB,2)),'  ≤ ','Gt_m',' ≤ ',num2str(round(Gtm_max_dB,2)),'] (dB)'])
disp(['[',num2str(round(Gtf_min_dB,2)),' ≤ ','Gt_f',' ≤ ',num2str(round(Gtf_max_dB,2)),'] (dB)'])


disp(' ')