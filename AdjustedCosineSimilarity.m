function Similarity = AdjustedCosineSimilarity(VariablesSpecturm,GlobalSpecturm)
%% Input Description
% VariablesSpectrumMatrix: FxN array, for N>1 variables with F specturms (distributions)
% GlobalSpecturm: 1xF array, representing the global specturm (distribution)
%% Outputs description:
% Similarity: NxN double array, represents the adjusted cosine similarity between each pair of variables.
%
%% Read Me:
% This code is plan to be Published together with 
% "Individual career progression can be more strategically planned",by Boon Kin Teh and others (under preparation).
% Detail can be found in Boon Kin Teh dissertation, “Macroscopic & Mesoscopic dynamics of Financial Market” -
% Chapter Methodologies, Algorithms, and Models-Section Similarity Measures for more details.
% Thank you.

%% Lastest updated date:
% 08 July 2017

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Start here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = size(VariablesSpecturm,2);
P_G = GlobalSpecturm'/sum(GlobalSpecturm);
Similarity = zeros(N,N);
for O_i = 1:N
    oi = VariablesSpecturm(:,O_i);
    Loi = sum(oi);
    for O_j = O_i:N
        oj = VariablesSpecturm(:,O_j);
        Loj = sum(oj);
        Similarity(O_i,O_j) =  sum(oi.*oj-Loi*Loj*P_G.^2);
        Similarity(O_j,O_i) = Similarity(O_i,O_j);
    end
end
