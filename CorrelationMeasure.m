function Correlation = CorrelationMeasure(ObservableTimeSeriesMatrix,Method)
%% Input Description
% ObservableTimeSeriesMatrix: TxN array, for N>1 variables with T observations
% Method: string, Method to calculate the correlation as follow,
%           Pearson = Pearson correlation
%           Spearman = Spearman correlation
%           Kendall = Kendal Tau correlation
%           Digital = Digital correlation
%% Outputs description:
% Correlation: NxN double array, represents the correlation between each pair of variables.
%
%% Read Me:
% This code is Published for "Cluster fusion-fission dynamics in the Singapore stock exchange", 
% by Boon Kin Teh and Siew Ann Cheong.
% Please refer to the paper for more details, and cite the paper when you
% are using this code for significance testing analysis,
% Thank you.

%% Lastest updated date:
% 08 July 2017

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Start here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmpi(Method,'digital')==1
    N = size(ObservableTimeSeriesMatrix,2);
    T = size(ObservableTimeSeriesMatrix,1);
    Correlation = zeros(N,N);
    for O_i = 1:N
        oi = ObservableTimeSeriesMatrix(:,O_i);
        for O_j = O_i:N
            oj = ObservableTimeSeriesMatrix(:,O_j);
            Correlation(O_i,O_j) = (sum(sign(diff(oi).*diff(oj))>0)-sum(sign(diff(oi).*diff(oj))<0))/(T-1);
            Correlation(O_j,O_i) = Correlation(O_i,O_j);
        end
    end
else
    Correlation= corr(ObservableTimeSeriesMatrix,'type',Method);
end