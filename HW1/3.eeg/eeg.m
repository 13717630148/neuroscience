%% load data
load('R15N111_Raw.mat');
load('R15N111_Spikes.mat'); % Reference, don't need actually
load('R15N111_Stimulus.mat');

% %% plot
% plot(wave);

%% set parameters
levels_index = unique(levels);
freqs_index = unique(freqs);

%% calc mfr
mfr1 = calc_mfr(unit1, levels, freqs, sti_onset);
mfr2 = calc_mfr(unit2, levels, freqs, sti_onset);

%% imagesc
figure;
imagesc(20:60, 0:40, mfr1);
title('Unit1 MFR Matric');
colorbar;
figure;
imagesc(20:60, 0:40, mfr2);
title('Unit2 MFR Matric');
colorbar;

%% tuning curve
figure;
tuning_curve(mfr1);
figure;
tuning_curve(mfr2);

