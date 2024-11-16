%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demonstration code for Information Theory: A Tutorial Introduction, JV Stone.
% Copyright: 2014, JV Stone, Psychology Department, Sheffield University, Sheffield, England.
% The MatLab code below is version R2013b. 
% This code can be downloaded from
% http://jim-stone.staff.shef.ac.uk/InformationTheoryBook.
% This file: infotheory4_1_v1.m
% Summary: Estimates entropy of joint X,Y distribution in Table 4.1, entropy of
% marginal distributions (p(X) and p(Y)), and mutual information between X and Y. 
% Printed output:
% XYcounts =
%     12    15     2     0
%      4    21    10     0
%      0    10    21     4
%      0     2    15    12
% 
% Eq. 4.42 H(X)		= 1.81 bits
% Eq. 4.45 H(Y)		= 1.99  bits
% Eq. 4.46 H(X,Y)		= 3.30  bits
% Eq. 4.48 H(X)+H(Y)	= 3.80  bits
% Eq. 4.51 I(X,Y)		= 0.509  bits
% Eq  4.63 H(noise) 	= 1.48  bits
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Our 4x4 table of frequency data
XYcounts = [[12, 15, 2, 0]; [4, 21, 10, 0]; [0, 10, 21, 4]; [0, 2, 15, 12]];

% print Table 4.1 
XYcounts

% Get row and column sums.
Xcounts = sum(XYcounts);
Ycounts = sum(XYcounts');

% Get total number of counts in table.
tot = sum(XYcounts(:));

% Convert Xcounts to marginal probability distribution p(X).
pX = Xcounts/tot;

% Convert Ycounts to marginal probability distribution p(Y).
pY = Ycounts/tot;

% Convert 2D XYcounts to 2D probability distribution.
pXY = XYcounts./tot;

% Estimate entropy of each distribution
HX = entropy_from_probabilities(pX);
HY = entropy_from_probabilities(pY);
HXY = entropy_from_probabilities(pXY);

% Find mutual information between X and Y
IXY = HX + HY - HXY;

% Get channel noise
Hnoise = HY - IXY;

fprintf('Eq. 4.42 H(X)\t\t= %.2f bits\n',HX);
fprintf('Eq. 4.45 H(Y)\t\t= %.2f  bits\n',HY);
fprintf('Eq. 4.46 H(X,Y)\t\t= %.2f  bits\n',HXY);
fprintf('Eq. 4.48 H(X)+H(Y)\t= %.2f  bits\n',HX+HY);
fprintf('Eq. 4.51 I(X,Y)\t\t= %.3f  bits\n',IXY);
fprintf('Eq  4.63 H(noise) \t= %.2f  bits\n',Hnoise);



%%%%%%%%%%%%%
% END OF FILE
%%%%%%%%%%%%%
