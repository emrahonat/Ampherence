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

eq2 = 1; % CCD Map 1
eq3 = 0; % CCD Map 2
eq4 = 0; % CCD Map 3
eq5 = 0; % PseudoCorrelation Map
eq6 = 0; % Phase Derivative Variance Map
eq6b = 0;% Phase Derivative Variance Map
eq7 = 0; % Phase Derivative Max Map
eq8 = 0; % Variance Phase Map
eq9 = 0; % Second Difference Phase Map
eq11 = 0; % ACD Map 1
eq12 = 0; % ACD Map 2
eq13 = 0; % ACD Map 3
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

    CoherenceMap_Histeq  = EqualizeImageHistogram2_EO(abs(CoherenceMap),12,0.2);
    figure_map = figure;
    imagesc((CoherenceMap_Histeq));
    title(['Histogram Equalized Coherence Map using Eq-' num2str(CohCalcMeth+1)]);
    colormap gray

    saveas(figure_map,name+"CCD1_histeq.svg")
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

    CoherenceMap_Histeq  = EqualizeImageHistogram2_EO(abs(CoherenceMap),12,0.2);
    figure_map = figure;
    imagesc((CoherenceMap_Histeq));
    title(['Histogram Equalized Coherence Map using Eq-' num2str(CohCalcMeth+1)]);
    colormap gray

    saveas(figure_map,name+"CCD2_histeq.svg")
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

    CoherenceMap_Histeq  = EqualizeImageHistogram2_EO(abs(CoherenceMap),12,0.2);
    figure_map = figure;
    imagesc((CoherenceMap_Histeq));
    title(['Histogram Equalized Coherence Map using Eq-' num2str(CohCalcMeth+1)]);
    colormap gray

    saveas(figure_map,name+"CCD3_histeq.svg")
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

    PseudoCorrMap_Histeq  = EqualizeImageHistogram2_EO(abs(PseudoCorrMap),12,0.2);
    figure_map = figure;
    imagesc((PseudoCorrMap_Histeq));
    title(['Histogram Equalized Pseudo Correlation Map using Eq-' num2str(PseudoCorrCalcMeth+4)]);
    colormap gray

    saveas(figure_map,name+"PCM_histeq.svg")
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

    PhaseDerVarMap_Histeq  = EqualizeImageHistogram2_EO(abs(PhaseDerVarMap),12,0.2);
    figure_map = figure;
    imagesc((PhaseDerVarMap_Histeq));
    title(['Histogram Equalized Phase Derivative Variance Map using Eq-' num2str(6)]);
    colormap gray

    saveas(figure_map,name+"PDV_histeq.svg")
end

%% PDV Equation - 6
if eq6b == 1
    WindowSize = 1;
    master_conjslave  = MasterImage.*conj(SlaveImage);
    angle_interferogram = angle(master_conjslave);
    derivative_variance = PhaseDerivativeVariance(angle_interferogram);
    AvgPhaseDerVar = mean2(derivative_variance);
    
    figure_map = figure;
    imagesc(derivative_variance);
    title(['Phase Derivative Variance Map using Eq-' num2str(6) ' (Window Size = ' num2str(WindowSize) ') (Avg. Coh. = ' num2str(AvgPhaseDerVar) ')']);
    colormap gray
    
    name = string(date);
    WS = string(WindowSize);
    name=WS+name;
    saveas(figure_map,name+"PDV2.svg")

    PhaseDerVarMap_Histeq  = EqualizeImageHistogram2_EO(abs(derivative_variance),12,0.2);
    figure_map = figure;
    imagesc((PhaseDerVarMap_Histeq));
    title(['Histogram Equalized Phase Derivative Variance Map using Eq-' num2str(6)]);
    colormap gray

    saveas(figure_map,name+"PDV2_histeq.svg")
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

    PhaseDerMaxMap_Histeq  = EqualizeImageHistogram2_EO(abs(PhaseDerMaxMap),12,0.2);
    figure_map = figure;
    imagesc((PhaseDerMaxMap_Histeq));
    title(['Histogram Equalized Phase Derivative Max Map using Eq-' num2str(7)]);
    colormap gray

    saveas(figure_map,name+"PDM_histeq.svg")
end

%% VPM Equation - 8
if eq8 == 1
    wR = 11;
    wA = 11;
    master_conjslave = MasterImage.*conj(SlaveImage);
    angle_interferogram = angle(master_conjslave);
    [VarPhaseMap, AvgVar] = variance_phase_map(angle_interferogram, wR, wA);
    
    figure_map = figure;
    imagesc(VarPhaseMap);
    title(['Variance Phase Map using Eq-' num2str(8) ' (Window Size = ' num2str(wA) ') (Avg. Coh. = ' num2str(AvgVar) ')']);
    colormap gray
    
    name = string(date);
    WS = string(wA);
    name = WS+name;
    saveas(figure_map,name+"VPM.svg")

    VarPhaseMap_Histeq  = EqualizeImageHistogram2_EO(abs(VarPhaseMap),12,0.2);
    figure_map = figure;
    imagesc((VarPhaseMap_Histeq));
    title(['Histogram Equalized Variance Phase Map using Eq-' num2str(8)]);
    colormap gray

    saveas(figure_map,name+"VPM_histeq.svg")
end

%% SDPM Equation - 9
if eq9 == 1
    wR = 11;
    wA = 11;
    master_conjslave = MasterImage.*conj(SlaveImage);
    angle_interferogram = angle(master_conjslave);
    [SecDiffMap, AvgSecDiff] = second_diff_phase_map(angle_interferogram, wR, wA);
    
    figure_map = figure;
    imagesc(SecDiffMap);
    title(['Second Difference Phase Map using Eq-' num2str(9) ' (Window Size = ' num2str(wA) ') (Avg. Coh. = ' num2str(AvgSecDiff) ')']);
    colormap gray
    
    name = string(date);
    WS = string(wA);
    name = WS+name;
    saveas(figure_map,name+"SDPM.svg")

    SecDiffMap_Histeq  = EqualizeImageHistogram2_EO(abs(SecDiffMap),12,0.2);
    figure_map = figure;
    imagesc((SecDiffMap_Histeq));
    title(['Histogram Equalized Second Difference Phase Map using Eq-' num2str(9)]);
    colormap gray

    saveas(figure_map,name+"SDPM_histeq.svg")
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

    ACDMap_Histeq  = EqualizeImageHistogram2_EO(abs(ACDMap),12,0.2);
    figure_map = figure;
    imagesc((ACDMap_Histeq));
    title(['Histogram Equalized ACD Map using Eq-' num2str(11)]);
    colormap gray

    saveas(figure_map,name+"ACD1_histeq.svg")
end


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

    ACDMap_Histeq  = EqualizeImageHistogram2_EO(abs(ACDMap),12,0.2);
    figure_map = figure;
    imagesc((ACDMap_Histeq));
    title(['Histogram Equalized ACD Map using Eq-' num2str(12)]);
    colormap gray

    saveas(figure_map,name+"ACD2_histeq.svg")
end


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

    ACDMap_Histeq  = EqualizeImageHistogram2_EO(abs(ACDMap),12,0.2);
    figure_map = figure;
    imagesc((ACDMap_Histeq));
    title(['Histogram Equalized ACD Map using Eq-' num2str(13)]);
    colormap gray

    saveas(figure_map,name+"ACD3_histeq.svg")
end


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

    AmpherenceMap_Histeq  = EqualizeImageHistogram2_EO(abs(AmpherenceMap),12,0.2);
    figure_map = figure;
    imagesc((AmpherenceMap_Histeq));
    title(['Histogram Equalized Ampherence Map using Eq-' num2str(14)]);
    colormap gray

    saveas(figure_map,name+"Amp_histeq.svg")
end
