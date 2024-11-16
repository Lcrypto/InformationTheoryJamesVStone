function [ent, X, N] = entropyfromsamples(x,binwidth,xmin,xmax,fignum,stitle)

% Take account of bin width here in v3.

% x = vector of values of a variable.
% binwidth = histogram width required (eg 1).
% fignum optional figure number.
% stitle optional string title for figure.

xrange=xmax-xmin;
X = xmin:binwidth:xmax;

n=length(x); % number of data points.
N =hist(x,X); % For the intervals in X, N is the height of each bin
if nargin>4
    figure(fignum);
else
    figure(9897);
end
bar(X,N);
fontsize=20;
xlabel('Output','FontSize',fontsize);
ylabel('Count','FontSize',fontsize);
set(gca,'FontSize',fontsize);
set(gca,'XLim',[xmin xmax]);
s='Outputs';
if nargin>3
    s=stitle;
end
title(s);

ind = find(N>0);
Ngt0 = N(ind);
p=Ngt0/n;
%p = N/n +eps; % all ps sum to one, so p now represent column area.

numbins=length(N);
% [binwidth numbins ]
% Note that p=prob that x lies in ith bin here, so do not need binwidth below.
% So pi in latex = p/dx.

enta = sum(-p.*log2(p));
% entb= sum(p.*log2(binwidth));
entb=log2(binwidth);
ent=enta; % +entb;

% differential entropy
ent=sum(ent);


