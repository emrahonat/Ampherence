%% MATLAB Code for Ampherence Map
%
% 1 - as an alternative guide map for path following based phase unwrapping algorithms
% 2 - as an alternative map for change detection
%
% SAR Interferometry Applications
%
% Dr. Emrah Onat
% 08.02.2025

clear all
close all
clc

eq2 = 0;
eq3 = 0;
eq4 = 0;
eq5 = 0;
eq6 = 0;
eq6b = 0;
eq7 = 0;
eq11 = 1; % ACD Map 1
eq12 = 1; % ACD Map 2
eq13 = 1; % ACD Map 3
eq14 = 0; % Ampherence Map

load('c00007a283p50M.mat');
MasterImage = ComplexGroundImage;
clear ComplexGroundImage;

figure;
MasterImage_Histeq  = EqualizeImageHistogram2_EO(MasterImage,12,0.2);
imagesc(abs(MasterImage_Histeq));
title('Master Image');
colormap gray

load('c00007a283p50S.mat');
SlaveImage = SARdataOut;
clear SARdataOut;

figure;
SlaveImage_Histeq  = EqualizeImageHistogram2_EO(SlaveImage,12,0.2);
imagesc(SlaveImage_Histeq);
title('Slave Image');
colormap gray

%% CCD Equation - 2
if eq2 == 1
    CohCalcMeth = 1;
    CohWindowSize = 11;
    [CoherenceMap AvgCoherence] = CoherentChangeDetection_EO(CohCalcMeth,MasterImage,SlaveImage,CohWindowSize);
    
    figure_map = figure;
    imagesc(CoherenceMap);
    title(['Coherence Map using Eq-' num2str(CohCalcMeth+1) ' (Window Size = ' num2str(CohWindowSize) ') (Avg. Coh. = ' num2str(AvgCoherence) ')']);
    colormap gray
    
    name = string(date);
    WS = string(CohWindowSize);
    name=WS+name;
    saveas(figure_map,name+"CCD1.svg")
end

%% CCD Equation - 3
if eq3 == 1
    CohCalcMeth = 2;
    CohWindowSize = 11;
    [CoherenceMap AvgCoherence] = CoherentChangeDetection_EO(CohCalcMeth,MasterImage,SlaveImage,CohWindowSize);
    
    figure_map = figure;
    imagesc(CoherenceMap);
    title(['Coherence Map using Eq-' num2str(CohCalcMeth+1) ' (Window Size = ' num2str(CohWindowSize) ') (Avg. Coh. = ' num2str(AvgCoherence) ')']);
    colormap gray
    
    name = string(date);
    WS = string(CohWindowSize);
    name=WS+name;
    saveas(figure_map,name+"CCD2.svg")
end

% CCD Equation - 4
if eq4 == 1
    CohCalcMeth = 3;
    CohWindowSize = 11;
    [CoherenceMap AvgCoherence] = CoherentChangeDetection_EO(CohCalcMeth,MasterImage,SlaveImage,CohWindowSize);
    
    figure_map = figure;
    imagesc(CoherenceMap);
    title(['Coherence Map using Eq-' num2str(CohCalcMeth+1) ' (Window Size = ' num2str(CohWindowSize) ') (Avg. Coh. = ' num2str(AvgCoherence) ')']);
    colormap gray
    
    name = string(date);
    WS = string(CohWindowSize);
    name=WS+name;
    saveas(figure_map,name+"CCD3.svg")
end

% PCM Equation - 5
if eq5 == 1
    PseudoCorrCalcMeth = 1;
    CohWindowSize = 11;
    [PseudoCorrMap AvgPseudoCorr] = PseudoCorrelation_EO(PseudoCorrCalcMeth,MasterImage,SlaveImage,CohWindowSize);
    
    figure_map = figure;
    imagesc(PseudoCorrMap);
    title(['Pseudo Correlation Map using Eq-' num2str(PseudoCorrCalcMeth+4) ' (Window Size = ' num2str(CohWindowSize) ') (Avg. Coh. = ' num2str(AvgPseudoCorr) ')']);
    colormap gray
    
    name = string(date);
    WS = string(CohWindowSize);
    name=WS+name;
    saveas(figure_map,name+"PCM.svg")
end

%% PDV Equation - 6
if eq6 == 1
    PhaseDerVarCalcMeth = 1;
    CohWindowSize = 11;
    [PhaseDerVarMap AvgPhaseDerVar] = PhaseDerivativeVariance_EO(PhaseDerVarCalcMeth,MasterImage,SlaveImage,CohWindowSize);
    
    figure_map = figure;
    imagesc(PhaseDerVarMap);
    title(['Phase Derivative Variance Map using Eq-' num2str(6) ' (Window Size = ' num2str(CohWindowSize) ') (Avg. Coh. = ' num2str(AvgPhaseDerVar) ')']);
    colormap gray
    
    name = string(date);
    WS = string(CohWindowSize);
    name=WS+name;
    saveas(figure_map,name+"PDV.svg")
end

%% PDV Equation - 6
if eq6b == 1
    master_conjslave  = MasterImage.*conj(SlaveImage);
    angle_interferogram = angle(master_conjslave);
    derivative_variance = PhaseDerivativeVariance(angle_interferogram);
    
    figure_map = figure;
    imagesc(derivative_variance);
    title(['Phase Derivative Variance Map using Eq-' num2str(6)]);
    colormap gray
    
    name = string(date);
    WS = string(CohWindowSize);
    name=WS+name;
    saveas(figure_map,name+"PDV2.svg")
end

%% PDM Equation - 7
if eq7 == 1
    PhaseDerMaxCalcMeth = 1;
    CohWindowSize = 11;
    [PhaseDerMaxMap, AvgPhaseDerMax] = PhaseDerivativeMax_EO(PhaseDerMaxCalcMeth,MasterImage,SlaveImage,CohWindowSize);
    
    figure_map = figure;
    imagesc(PhaseDerMaxMap);
    title(['Phase Derivative Max Map using Eq-' num2str(7) ' (Window Size = ' num2str(CohWindowSize) ') (Avg. Coh. = ' num2str(AvgPhaseDerMax) ')']);
    colormap gray
    
    name = string(date);
    WS = string(CohWindowSize);
    name = WS+name;
    saveas(figure_map,name+"PDM.svg")
end

%% VPM Equation - 8
if eq8 == 1
    wR = 11;
    wA = 11;
    PhaseImage = MasterImage.*conj(SlaveImage);
    [VarPhaseMap, AvgVar] = variance_phase_map(PhaseImage, wR, wA);
    
    figure_map = figure;
    imagesc(VarPhaseMap);
    title(['Variance Phase Map using Eq-' num2str(8) ' (Window Size = ' num2str(wA) ') (Avg. Coh. = ' num2str(AvgVar) ')']);
    colormap gray
    
    name = string(date);
    WS = string(wA);
    name = WS+name;
    saveas(figure_map,name+"VPM.svg")
end

%% SDPM Equation - 9
if eq8 == 1
    wR = 11;
    wA = 11;
    PhaseImage = MasterImage.*conj(SlaveImage);
    [SecDiffMap, AvgSecDiff] = second_diff_phase_map(PhaseImage, wR, wA);
    
    figure_map = figure;
    imagesc(SecDiffMap);
    title(['Second Difference Phase Map using Eq-' num2str(9) ' (Window Size = ' num2str(wA) ') (Avg. Coh. = ' num2str(AvgSecDiff) ')']);
    colormap gray
    
    name = string(date);
    WS = string(wA);
    name = WS+name;
    saveas(figure_map,name+"SDPM.svg")
end


%% ACD Equation - 11
if eq11 == 1
    
    [ACDMap AvgAmplitude]= ACD_map1(MasterImage,SlaveImage);
    
    figure_map = figure;
    imagesc(ACDMap);
    title(['ACD Map using Eq-' num2str(11) ' (Window Size = ' num2str(0) ') (Avg. Amp. = ' num2str(AvgAmplitude) ')']);
    colormap gray
    
    name = string(date);
    WS = string(0);
    name = WS+name;
    saveas(figure_map,name+"ACD1.svg")
end

ACDMap1_Histeq  = EqualizeImageHistogram2_EO(abs(ACDMap),12,0.2);
figure;
imagesc((ACDMap1_Histeq));
colormap gray

%% ACD Equation - 12
if eq12 == 1
    
    [ACDMap AvgAmplitude]= ACD_map2(MasterImage,SlaveImage);
    
    figure_map = figure;
    imagesc(ACDMap);
    title(['ACD Map using Eq-' num2str(12) ' (Window Size = ' num2str(0) ') (Avg. Amp. = ' num2str(AvgAmplitude) ')']);
    colormap gray
    
    name = string(date);
    WS = string(0);
    name = WS+name;
    saveas(figure_map,name+"ACD2.svg")
end

ACDMap2_Histeq  = EqualizeImageHistogram2_EO(abs(ACDMap),12,0.2);
figure;
imagesc((ACDMap2_Histeq));
colormap gray

%% ACD Equation - 13
if eq13 == 1
    
    [ACDMap AvgAmplitude]= ACD_map3(MasterImage,SlaveImage);
    
    figure_map = figure;
    imagesc(ACDMap);
    title(['ACD Map using Eq-' num2str(13) ' (Window Size = ' num2str(0) ') (Avg. Amp. = ' num2str(AvgAmplitude) ')']);
    colormap gray
    
    name = string(date);
    WS = string(0);
    name = WS+name;
    saveas(figure_map,name+"ACD3.svg")
end

ACDMap3_Histeq  = EqualizeImageHistogram2_EO(abs(ACDMap),12,0.2);
figure;
imagesc((ACDMap3_Histeq));
colormap gray

%% Amp Equation - 14
if eq14 == 1
    ACDWindowSize = 11;
    [AmpherenceMap Ampherence] = ampherence_map(MasterImage,SlaveImage,ACDWindowSize);
    
    figure_map = figure;
    imagesc(AmpherenceMap);
    title(['Ampherence Map using Eq-' num2str(14) ' (Window Size = ' num2str(ACDWindowSize) ') (Avg. Amp. = ' num2str(Ampherence) ')']);
    colormap gray
    
    name = string(date);
    WS = string(ACDWindowSize);
    name = WS+name;
    saveas(figure_map,name+"Amp.svg")
end
