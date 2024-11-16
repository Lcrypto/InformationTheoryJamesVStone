%
% Purpose: Convert a character array (string) to an array of integers 0 through 27 (the "order")
%          Order of 1 is a space or other character, Order 1-26 are the letters "a" through "z".
%
% Author: Neal Patwari
% 

function [y] = charToOrderJVS(s)

s=double(s);
ind=find(s==32);
y = s - 96;
y(find(y < 0))  = -1;
y(find(y > 26)) = -1;
y(ind)=27; % space

ind=find(y>0);
y=y(ind);
% JVS y(find(s==' '))=27;
