function [ent, X, N] = diffentropyfromsamples(x,binwidth,xmin,xmax)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [ent, X, N] = diffentropyfromsamples(x,binwidth,xmin,xmax)
% Function entropyfromsamples.m.
% Estimate differential of data x based on histogram with binwidth specified by user.
% Input: x = samples from a distribution.
% binwidth = width of bins to be used to quantise sample values.
% xmin, xmax: ignore values outside of this range.
% fignum optional: plot histogram in this figure number.
% stitle optional: give figure this title.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X = xmin:binwidth:xmax;

n=length(x); % number of data points.
N =hist(x,X); % For the intervals in X, N is the height of each bin


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


