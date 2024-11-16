%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demonstration code for Information Theory: A Tutorial Introduction, JV Stone.
% Copyright: 2014, JV Stone, Psychology Department, Sheffield University, Sheffield, England.
% The MatLab code below is version R2013b. 
% This code can be downloaded from
% http://jim-stone.staff.shef.ac.uk/InformationTheoryBook.
% This file: infotheory_3_2_v1.m
% Printed output:
% Entropy of dice outcomes is H=3.2744 bits/throw.
% Entropy of dice using n=500 simulated outcomes is H=3.2247 bits/throw.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 3.2
% Plot outcome values of throws of a pair of dice.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Theoretical throwing of dice
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Each row of a is list of outcome values followed by expected outcome frequency.
a=[
2 	 1;	% & 1/36=0.03
3 	 2;	% & 2/36=0.06 
4	 3;	% & 3/36=0.08 
5	 4;	% & 4/36=0.11 
6	 5;	% & 5/36=0.14 
7	 6;	% & 6/36=0.17 
8	 5;	% & 5/36=0.14 
9	 4;	% & 4/36=0.11 
10	 3;	% & 3/36=0.08 
11	 2;	% & 2/36=0.06 
12	 1 ];	% & 1/36=0.03  

% Get frequencies.
freqs = a(:,2);
% Convert frequencies to proportions.
p = freqs/sum(freqs);

figure(1);
barw = 0.1; % bar width.
bar(a(:,1),p,barw*2);
set(gca,'Linewidth',2);
set(gca,'FontSize',20);
set(gca,'XLim',[1 13]);
set(gca,'YLim',[0 0.18]);
xlabel('Outcome value');
ylabel('Outcome probability'); 
set(gca,'Linewidth',2);% box off;
colormap(gray);
title('Throwing a pair of dice: Theory')

% Get entropy.
H=sum(-p.*log2(p)); %H =    3.2744
fprintf('Entropy of dice outcomes is H=%.4f bits/throw.\n',H);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulate throwing dice n=500 times.
%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=500; % roll each die n times.
die1 = ceil(rand(n,1)*6);
die2 = ceil(rand(n,1)*6);
x = die1 + die2; % outcome value is sum of dice numbers.
figure(2);
% hist(die1,6);
[freq,xval]=hist(x,11); % make histogram of outcome values.
p = freq/n; % normalise histogram so that bin heights sum to 1.
bar(xval,freq/n,barw*2);
set(gca,'Linewidth',2);
set(gca,'FontSize',20);
set(gca,'XLim',[1 13]);
%set(gca,'YLim',[0 7]);
xlabel('Outcome value');
ylabel('Outcome probability'); 
set(gca,'Linewidth',2);% box off;
colormap(gray);
title('Throwing a pair of dice: Numerical')

% Get entropy.
H=sum(-p.*log2(p)); %H =    3.2744
fprintf('Entropy of dice using n=%d simulated outcomes is H=%.4f bits/throw.\n',n,H);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%