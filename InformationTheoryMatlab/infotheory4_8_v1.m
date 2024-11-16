%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demonstration code for Information Theory: A Tutorial Introduction, JV Stone.
% Copyright: 2014, JV Stone, Psychology Department, Sheffield University, Sheffield, England.
% The MatLab code below is version R2013b. 
% This code can be downloaded from
% http://jim-stone.staff.shef.ac.uk/InformationTheoryBook.
% This file: infotheory4_8_v1.m
% Printed output:
% Summary: Estimates entropy of figure 4.8a (input X) and 4.8b (outpuit Y), and mutual information between X and Y. 
% Printed output: 
% Eq. 4.68 H(X)		= 0.850 bits
% Eq. 4.71 H(Y)		= 0.906 bits
% Eq. 4.75 H(X,Y)	= 1.32 bits
% Eq. 4.78 I(X,Y)	= 0.436 bits
% Eq. 4.81 H(X|Y)	= 0.415 bits
% Eq. 4.84 H(noise)	= 0.470 bits
% Eq. 4.88 H(noise)	= 0.469 bits (analytic)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

% set random number seeds.
s=1;
rand('seed',s);
randn('seed',s);
    
% Read in image from file.
fname='image1_6.jpg'; 
X = imread(fname);
figure(1);imagesc(X); title('Grey-level image'); axis off; colormap(gray);
% Get flattened version of image.
X1d = X(:);
n = length(X1d);

% Make binary image, by classifying pixels as being above or below 150.
Xbinary = X>150;
% Flatten image.
Xbinary1d = Xbinary(:);
figure(2);imagesc(Xbinary); title('Binary image'); axis off; colormap(gray);

% Find entropy of binary image.
HX = entropy_from_data(Xbinary,[0 1]);
% Eq. 4.68
fprintf('Eq. 4.68 H(X)\t\t= %.3f bits\n',HX);

% Make noise image.
Xbinarywithnoise = Xbinary;
% Intitialise noise image of zeros.
Xnoise = zeros(size(X));
[nr nc]=size(X);
% Set error rate of binary symmetric channel.
pnoise = 0.1;
for r=1:nr
    for  c=1:nc
        flip = rand < pnoise;
        if flip
            % Flip state of pixel from 0->1 or 1->0.
            Xbinarywithnoise(r,c) = ~Xbinary(r,c);
            % Record noise in noise image.
            Xnoise(r,c) = 1;
        end
    end
end

figure(3);imagesc(Xbinarywithnoise); title('Binary image with noise'); axis off; colormap(gray); 

% Flatten images.
Xbinarywithnoise1d = Xbinarywithnoise(:);
Xnoise1d = Xnoise(:);
Xbinary1d = Xbinary(:);

% Find entropy of noisy image.
HY = entropy_from_data(Xbinarywithnoise,[0 1]);
% Eq. 4.71
fprintf('Eq. 4.71 H(Y)\t\t= %.3f bits\n',HY);

% Find entropy of joint distribution
p00 = sum(Xbinary1d==0 & Xbinarywithnoise1d==0)/n;
p11 = sum(Xbinary1d==1 & Xbinarywithnoise1d==1)/n;
p01 = sum(Xbinary1d==0 & Xbinarywithnoise1d==1)/n;
p10 = sum(Xbinary1d==1 & Xbinarywithnoise1d==0)/n;

prob_dist_joint = [p01 p10 p11  p00];
HXY = entropy_from_probabilities(prob_dist_joint);
fprintf('Eq. 4.75 H(X,Y)\t\t= %.2f bits\n',HXY);

% Find mutual information
% 4.78 I(X,Y)
IXY = HX + HY - HXY;
fprintf('Eq. 4.78 I(X,Y)\t\t= %.3f bits\n',IXY);

% 4.81 H(X|Y)
HXgivenY = HX - IXY;
fprintf('Eq. 4.81 H(X|Y)\t\t= %.3f bits\n',HXgivenY);

% Find entropy of noise.
Hnoise = entropy_from_data(Xnoise1d,[0 1]);
% Eq. 4.84
fprintf('Eq. 4.84 H(noise)\t= %.3f bits\n',Hnoise);

% Find entropy of image based on known noise probability distribution.
prob_dist_analytic = [pnoise 1-pnoise];
% Eq. 4.88
Hnoiseanalytic  = entropy_from_probabilities(prob_dist_analytic);
% Note: 0.1 * log2(1/0.1) + 0.9*log2(1/0.9) = 0.469
fprintf('Eq. 4.88 H(noise)\t= %.3f bits (analytic)\n',Hnoiseanalytic);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF FILE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%