%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demonstration code for Information Theory: A Tutorial Introduction, JV Stone.
% Copyright: 2014, JV Stone, Psychology Department, Sheffield University, Sheffield, England.
% The MatLab code below is version R2013b. 
% This code can be downloaded from
% http://jim-stone.staff.shef.ac.uk/InformationTheoryBook.
% This file: infotheory7_1_v1.m
% Summary: The code recreates the Figure 7.1 P155, using Eq. 7.18,
% which shows how channel capacity increases with signal to noise ratio.
% A channel which transmits 1000 values per second has a capacity C.
% C depends on the amount of channel noise variance N.
% Input values have a variance P.
% If the channel transmits 1000 values/s then the channel capacity is C = 1000/2 log(1+P/N) bits/s.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

% Capacity graph
figure(1);
N = 1; % fixed noise variance
P = 0.01:0.01:4; % input variance values
C = 500*log2(1+P/N); % channel capacity, Eq in legend of figure 7.1 (assumes 1000 values/s), based on Eq 7.18.
SNR = P/N; % signal to noise ratio.
set(gca,'FontSize',20);
set(gca,'Linewidth',2);
plot(SNR,C,'k','Linewidth',2);
set(gca,'Linewidth',2);
xlabel('Signal to noise ratio, P/N');
ylabel('Channel capacity (bits/s)');
set(gca,'Linewidth',2);
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%