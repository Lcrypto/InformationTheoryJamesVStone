%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demonstration code for Information Theory: A Tutorial Introduction, JV Stone.
% Copyright: 2014, JV Stone, Psychology Department, Sheffield University, Sheffield, England.
% The MatLab code below is version R2013b. 
% This code can be downloaded from
% http://jim-stone.staff.shef.ac.uk/InformationTheoryBook.
% This file: infotheory7_2_v1.m
% Summary: The code recreates Figure 7.2 P155, using Eq. 7.40,
% which shows how the error rate increases with message length.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

P=10;   % input power variance
N=1;    % noise variance
R=0.99; % entropy rate = 0.99 bits per binary digit.
C=1;    % channel capacity
n=1:4000; % message lengths

num = 2*P*(P+N); % numerator of Eq 7.40
den=N*(P+2*N);  % denominator of Eq 7.40

% find argument to be passed to cumulative gaussian (erf) function.
z = sqrt(n) .* sqrt(num/den)*(R-C);

p = infotheory_erf(z); % prob of error.

% plot result
figure(1);plot(n,p,'k-','LineWidth',2);
set(gca,'Linewidth',2);
set(gca,'FontSize',20);
ylabel('P(error)');
xlabel('Message length, {\it n}');
linewidth=2;
fontname='Ariel';
ymin=0;
ymax=p(1);
set(gca,'YLim',[ymin ymax],'FontName',fontname);

return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


