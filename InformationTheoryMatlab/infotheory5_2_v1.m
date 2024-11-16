%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demonstration code for Information Theory: A Tutorial Introduction, JV Stone.
% Copyright: 2014, JV Stone, Psychology Department, Sheffield University, Sheffield, England.
% The MatLab code below is version R2013b.
% This code can be downloaded from
% http://jim-stone.staff.shef.ac.uk/InformationTheoryBook.
% This file: infotheory5_2_v1.m
% Summary: Estimates entropy of Gaussian histograms with different bin widths and compares these to the known underlying differential entropy.
% Printed output:
% Analytic differential entropy of Gaussian distribution with standard deviation = 1.000 is H = 2.04710 bits.
%
% For sampled data: binwidth 		 = 1.000
% entropy of histogram			= 2.104 bits
% differential entropy of histogram	= 2.104 bits
% 
% For sampled data: binwidth 		 = 0.500
% entropy of histogram			= 3.061 bits
% differential entropy of histogram	= 2.061 bits
% 
% For sampled data: binwidth 		 = 0.100
% entropy of histogram			= 5.369 bits
% differential entropy of histogram	= 2.047 bits
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

% Set standard deviation.
sd = 1;
x = -4:0.01:4; % set range values of Gaussian.
m = 0; % set mean of Gaussian to be 0.

n = 1e6; % number of data points in sample.
H0 = 0.5*log2(2*pi*exp(1)*sd^2); % Analytic differential entropy of Gaussian distribution. Eq 5.47.
fprintf('Analytic differential entropy of Gaussian distribution with standard deviation = %.3f is H = %.5f bits.\n\n',sd,H0);

s = randn(n,sd); % make n samples from a Gaussian distribution.
fignum = 0; % set figure number
for binwidth = [1 0.5 0.1] 
    fignum = fignum+1;
    numsds = 7; % set number of standard deviations.
    ind = find(abs(s)<numsds);
    s = s(ind); % restrict samples to lie within +- 7 sds of mean.
    numbins = 2*numsds/binwidth; % set number of bins to be used in histogram.
    [N X] = hist(s,numbins); % make histogram based on numbins.
    
    [ent, X, N] = entropyfromsamples(s,binwidth,-numsds,numsds); 
    
    HH = H0 + log2(1/binwidth); % theoretica value of differential entropy. Eq 5.19.

    diffent = ent - log2(1/binwidth); % eq 5.17
    
    fprintf('For sampled data: binwidth \t\t = %.3f\nentropy of histogram\t\t\t= %.3f bits\ndifferential entropy of histogram\t= %.3f bits\n\n',binwidth,ent,diffent);
    
    % make new figure.
    figure(fignum);
    % get histogram
    hist(s,numbins,'LineWidth',2); 
    bar(X,N,1);
    if fignum==3
        X3 = X;
        N3 = N;
    end
    
    colormap([1 1 1]/2)
    jset_xlim(-4,4);
    %jset_yticks([]);
    %jset_xticks([]);
    set(gca,'Linewidth',2);
    set(gca,'FontSize',20);
    %axis off
end

%%%%%
